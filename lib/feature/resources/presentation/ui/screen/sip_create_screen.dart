import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';
import '../../../../../common/widget/custom_form_text_field.dart';


class SipCreateScreen extends ConsumerStatefulWidget {
  const SipCreateScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SipCreateScreenState();
}

class _SipCreateScreenState extends ConsumerState<SipCreateScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:  Text('SIP Reports',style: PhinexaFont.headingSmall,),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create SIP Report",style: PhinexaFont.headingLarge,),
                SizedBox(height: 12,),
                CustomFormTextField(
                  labelText: 'SPI Title*',
                  hintText: 'Community Clean-Up Initiative',
                  obscureText: false,
                  onChanged: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 12,),
                CustomFormTextField(
                  labelText: 'Description*',
                  hintText: 'Impact - 2,000+ residents benefited',
                  obscureText: false,
                  height: 180,
                  maxLines: 10,
                  onChanged: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 24,),
                _buildUploader(context),
                SizedBox(height: 12,),
                CustomFormTextField(
                  labelText: 'Link',
                  hintText: 'URL',
                  obscureText: false,
                  onChanged: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 12,),
              ],
            ),
          ),
        ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
          child: CustomButton(label: "Post",height: 40,onPressed: ()=>(),)),
      );
  }
}

Widget _buildUploader(BuildContext context) {
  return DottedBorder(
    color: PhinexaColor.grey,
    strokeWidth: 1,
    borderType: BorderType.RRect,
    radius: Radius.circular(12),
    padding: EdgeInsets.all(0),
    dashPattern: [4, 4],
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Upload icon in the center
          Icon(
            Icons.file_upload_outlined,
            size: 48,
            color: PhinexaColor.black,
          ),
          const SizedBox(height: 16),
          Text(
            'Upload (PNG, JPEG) - Max 2MB',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey, // Text color
            ),
          ),
        ],
      ),
    ),
  );
}