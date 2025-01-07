import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../screen/certification_tab_screen.dart';

class ResourcesWidget extends ConsumerWidget {

  const ResourcesWidget({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: PhinexaColor.lightGrey),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 0),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/resources/leadership_academic.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sustainable Development Goals in Action',
                    style: PhinexaFont.highlightEmphasis,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 16.0,
                        color: PhinexaColor.grey,
                      ),
                      SizedBox(width: 8,),
                      Text(
                          'April 5, 2025',
                          style: PhinexaFont.labelRegular.copyWith(
                              color: PhinexaColor.grey)
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Interactive session on using design thinking to solve local challenges.',
                    style: PhinexaFont.labelRegular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement navigation or action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PhinexaColor.primaryColor,
                      minimumSize: Size(double.infinity, 30),
                    ),
                    child: Text(
                      'Read More',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
