import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../core/route/route_name.dart';
import '../screen/resources_tab_screen.dart';

class ResourcesWidget extends ConsumerWidget {
  final Resource resource;

  const ResourcesWidget({super.key, required this.resource});

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
                resource.imagePath,
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
                    resource.title,
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
                      SizedBox(width: 8),
                      Text(
                        DateFormat('MMMM d, yyyy').format(resource.date),
                        style: PhinexaFont.labelRegular.copyWith(
                          color: PhinexaColor.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    resource.description,
                    style: PhinexaFont.labelRegular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(
                        RouteName.resourceMore,
                        extra: resource,
                      );
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
