import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/local/user/user_service.dart';
import 'package:gll/feature/other/application/certification/certification_service.dart';
import 'package:gll/feature/resources/presentation/controller/certificate/certificate_controller.dart';

import '../../../../../core/data/local/ countries.dart';
import '../../../../events/presentation/ui/widgets/custom_searchable_dropdown.dart';
import '../provider/certification_preview_provider.dart';

class CertificationTabScreen extends ConsumerStatefulWidget {
  const CertificationTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CertificationTabScreenState();
}

class _CertificationTabScreenState
    extends ConsumerState<CertificationTabScreen> {
  String? _selectedCountry;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref
          .read(certificateControllerProvider.notifier)
          .fetchCertificates();
      // Removed the initial dialog call from here
    });
  }

  void _showCountrySelectionDialog(BuildContext context, dynamic cert) {
    String? tempSelectedCountry = _selectedCountry;
    String? errorMessage;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Select your Country'),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.25,
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomSearchableDropdown(
                      fieldName: "Country of origin",
                      selectedValue: tempSelectedCountry,
                      items: countries,
                      hintText: 'Country',
                      fieldWidth: double.infinity,
                      onChanged: (value) {
                        setState(() {
                          tempSelectedCountry = value;
                          if (value != null) {
                            errorMessage = null;
                          }
                        });
                      },
                    ),
                    if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          errorMessage!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const Spacer(),
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        if (tempSelectedCountry != null) {
                          // Update the state and immediately call the createCertificate function
                          this.setState(() {
                            _selectedCountry = tempSelectedCountry;
                          });
                          createCertificate(
                            ref,
                            _selectedCountry!,
                            cert.path,
                            cert.isMinimal,
                          );
                          Navigator.of(dialogContext).pop();
                        } else {
                          setState(() {
                            errorMessage = 'Please select a country.';
                          });
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final allCertificates = ref.watch(certificationPreviewListProvider);
    final userAsync = ref.watch(userProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final certificatesAsync = ref.watch(certificateControllerProvider);

    return userAsync.when(
      data: (user) => certificatesAsync.when(
        data: (fetchedCertificates) {
          final availableCertificates = allCertificates.where((previewCert) {
            return fetchedCertificates.any(
              (fetchedCert) => previewCert.title.toLowerCase().contains(
                fetchedCert.name.toLowerCase(),
              ),
            );
          }).toList();

          if (availableCertificates.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.workspace_premium_outlined,
                      color: Colors.blueGrey,
                      size: 60,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No certifications yet, but your journey has just begun!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Keep participating in events and completing challenges to unlock your first badge soon!',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(availableCertificates.length, (index) {
                final cert = availableCertificates[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_selectedCountry != null) {
                        createCertificate(
                          ref,
                          _selectedCountry!,
                          cert.path,
                          cert.isMinimal,
                        );
                      } else {
                        _showCountrySelectionDialog(context, cert);
                      }
                    },
                    child: Card(
                      elevation: 2,
                      child: ClipRRect(
                        child: Image.asset(
                          'assets/certificates/${cert.path}',
                          width: screenWidth * 0.9,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error loading certificates: $error')),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          Center(child: Text('Error loading user data: $error')),
    );
  }
}
