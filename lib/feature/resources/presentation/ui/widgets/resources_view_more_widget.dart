import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import '../screen/resources_tab_screen.dart';

class ResourcesViewMoreWidget extends ConsumerWidget {

  final Resource resource;
  const ResourcesViewMoreWidget({super.key,required this.resource});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: resource.title, // Main text
                    style: PhinexaFont.headingLarge
                  ),
                ),
              ),
              SizedBox(height: 24,),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  resource.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 24,),
              Center(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: resource.description,
                      style: PhinexaFont.labelRegular
                  ),
                ),
              ),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}
