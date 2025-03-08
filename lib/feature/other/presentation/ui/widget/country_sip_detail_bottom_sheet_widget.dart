import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/other/domain/model/sip/sip_detail.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/widget/custom_button.dart';
import '../../../../../core/route/route_name.dart';

class CountryBottomSheet extends StatelessWidget {
  final SipDetail sipDetail;

  const CountryBottomSheet({super.key, required this.sipDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset("assets/more/drag_handle.png",
                width: 32, height: 4),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(sipDetail.country, style: PhinexaFont.headingSmall),
              SizedBox(height: 15),
              Row(
                children: [
                  Image.asset("assets/more/land_plot.png",
                      width: 36, height: 36),

                  SizedBox(width: 8), // Space between icon and text

                  Text(
                    '${sipDetail.numberOfSips} SIP',
                    style: PhinexaFont.highlightRegular
                        .copyWith(color: PhinexaColor.darkGrey),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Image.asset("assets/more/users_sip.png",
                      width: 36, height: 36),

                  SizedBox(width: 8), // Space between icon and text

                  Text(
                    '${sipDetail.numberOfPeopleImpacted} people impacted',
                    style: PhinexaFont.highlightRegular
                        .copyWith(color: PhinexaColor.darkGrey),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                label: "Explore More",
                height: 40,
                onPressed: () {
                  context.pushNamed(RouteName.campMoreDetail, extra: sipDetail);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
