import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:gll/common/widget/custom_form_text_field.dart';
import 'package:gll/feature/bottom_bar/presentation/ui/provider/nav_provider.dart';
import 'package:gll/feature/resources/presentation/controller/sip_report/sip_report_controller.dart';
import 'package:gll/feature/resources/presentation/ui/provider/resources_tab_control_provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/data/local/user/user_service.dart';
import '../../../../../core/route/route_name.dart';
import '../../../../events/presentation/ui/provider/combine_response.dart';
import '../../../../system_feedback/model/feedback.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';
import '../../../application/firebase_services/firebaseStorageService.dart';
import '../provider/file_picker_provider.dart';

class SipCreateScreen extends ConsumerStatefulWidget {
  const SipCreateScreen({super.key});

  @override
  ConsumerState<SipCreateScreen> createState() => _SipCreateScreenState();
}

class _SipCreateScreenState extends ConsumerState<SipCreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final isSubmittingProvider = StateProvider<bool>((ref) => false);
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final feedBackService = ref.read(feedbackServiceProvider);
    final file = ref.read(selectedFileProvider);
    if (file == null) {
      if (mounted) {
        feedBackService.showToast("Please select a PDF to upload",
            type: FeedbackType.error);
      }
      return;
    }

    ref.read(isSubmittingProvider.notifier).state = true;
    try {
      final user = await ref.read(userProvider.future);
      if (user == null) {
        if (mounted) {
          feedBackService.showToast('User not authenticated. Please log in.',
              type: FeedbackType.error);
        }
        return;
      }

      final userName = user.fullName;
      final downloadUrl = await FirebaseStorageService().uploadPdf(
        file: file,
        userName: userName,
        reportName: _titleController.text,
      );

      final formData = {
        'title': _titleController.text,
        'description': _descriptionController.text,
        'image': downloadUrl, // Assuming 'image' field stores the PDF URL
        'link': _linkController.text.trim(), // Trim link to avoid empty spaces
      };

      // send to controller
      ref.read(sipReportControllerProvider.notifier).setFormData(formData);
      await ref.read(sipReportControllerProvider.notifier).uploadSipReport();

      // clear selected file and form fields before navigating
      ref.read(selectedFileProvider.notifier).state = null;
      _titleController.clear();
      _descriptionController.clear();
      _linkController.clear();
      clearSurveyResponses(ref); // Assuming this clears any related survey data

      if (mounted) {
        feedBackService.showToast("SIP Report uploaded successfully!",
            type: FeedbackType.success);
        _showCompletionDialog(context); // Show the success dialog
      }
    } catch (e) {
      if (mounted) {
        feedBackService.showToast("Failed to upload SIP: ${e.toString()}",
            type: FeedbackType.error);
      }
    } finally {
      if (mounted) {
        ref.read(isSubmittingProvider.notifier).state = false;
      }
    }
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thank you for uploading the report',
                  style: PhinexaFont.headingSmall
                      .copyWith(color: PhinexaColor.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "Whoa. You did it. You just turned an idea into positive impact—and that makes you a true leader in your community.",
                  style: PhinexaFont.contentRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  "Your Sustainable Impact Project report is on its way to our team for review. Once it's approved, it'll be featured on the app (yes, the world will see your brilliance ) and your digital certificate will be issued.",
                  style: PhinexaFont.contentRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  "Until then, take a breath. Do a dance. High five yourself. You’ve made a difference—and that’s a big deal.",
                  style: PhinexaFont.contentRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  label: "Continue",
                  height: 40,
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss the dialog
                    ref
                        .read(navProvider.notifier)
                        .onItemTapped(1); // Set tab to Resources
                    ref.read(tabIndexProvider.notifier).state =
                        0; // Set sub-tab to default if applicable
                    context.goNamed(RouteName
                        .dashboard); // Navigate to dashboard and clear stack
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SIP Reports',
          style: PhinexaFont.headingSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create SIP Report", style: PhinexaFont.headingLarge),
              const SizedBox(height: 12),
              CustomFormTextField(
                controller: _titleController,
                labelText: 'SIP Title*',
                hintText: 'Community Clean-Up Initiative',
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Please enter a title'
                    : null,
              ),
              const SizedBox(height: 12),
              CustomFormTextField(
                controller: _descriptionController,
                labelText: 'Description*',
                hintText: 'Impact - 2,000+ residents benefited',
                height: 180,
                maxLines: 10,
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Please enter a description'
                    : null,
              ),
              const SizedBox(height: 24),
              _buildUploader(),
              const SizedBox(height: 12),
              CustomFormTextField(
                controller: _linkController,
                labelText: 'Link (Optional)', // Made link optional
                hintText: 'URL',
                // No validator for link as it's optional
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: Consumer(
          builder: (context, ref, _) {
            final isSubmitting =
                ref.watch(this.isSubmittingProvider); // Use `this` for clarity
            return CustomButton(
              label: "Upload SIP",
              height: 40,
              onPressed: isSubmitting ? null : _submitForm,
              child: isSubmitting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }

  Widget _buildUploader() {
    final selectedFile = ref.watch(selectedFileProvider);
    return DottedBorder(
      color: PhinexaColor.grey,
      strokeWidth: 1,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: EdgeInsets.zero,
      dashPattern: const [4, 4],
      child: InkWell(
        onTap: () async {
          // You might want to disable picking if already submitting
          if (ref.read(isSubmittingProvider)) return;
          final filePicker = ref.read(filePickerServiceProvider);
          await filePicker.pickPdfFile();
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selectedFile != null
                    ? Icons.file_present
                    : Icons.file_upload_outlined,
                size: 48,
                color: PhinexaColor.grey,
              ),
              const SizedBox(height: 16),
              Text(
                selectedFile?.path.split('/').last ?? 'Upload PDF – Max 2MB',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: PhinexaFont.contentRegular
                    .copyWith(color: PhinexaColor.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
