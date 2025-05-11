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
    if (!_formKey.currentState!.validate()) return;
    final feedBackService = ref.read(feedbackServiceProvider);
    final file = ref.read(selectedFileProvider);
    if (file == null) {
      if (mounted) {
        feedBackService.showToast("Please select a PDF",
            type: FeedbackType.error);
      }
      return;
    }

    ref.read(isSubmittingProvider.notifier).state = true;
    try {
      final user = await ref.read(userProvider.future);
      if (user == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User not authenticated')),
          );
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
        'image': downloadUrl,
        'link': _linkController.text,
      };

      if (mounted) {
        // send to controller
        ref.read(sipReportControllerProvider.notifier).setFormData(formData);
        ref.read(sipReportControllerProvider.notifier).uploadSipReport();

        // clear selected file and form fields before navigating
        ref.read(selectedFileProvider.notifier).state = null;
        _titleController.clear();
        _descriptionController.clear();
        _linkController.clear();
        clearSurveyResponses(ref);

        // navigate back to resources screen and set correct tab
        ref.read(navProvider.notifier).onItemTapped(1);
        ref.read(tabIndexProvider.notifier).state = 0;
        context.goNamed(RouteName.dashboard);
      }
    } catch (e) {
      if (mounted) {
        feedBackService.showToast(e.toString(), type: FeedbackType.error);
      }
    } finally {
      if (mounted) {
        ref.read(isSubmittingProvider.notifier).state = false;
      }
    }
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
                validator: (value) => (value == null || value.isEmpty)
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
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter a description'
                    : null,
              ),
              const SizedBox(height: 24),
              _buildUploader(),
              const SizedBox(height: 12),
              CustomFormTextField(
                controller: _linkController,
                labelText: 'Link',
                hintText: 'URL',
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
            final isSubmitting = ref.watch(isSubmittingProvider);
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
