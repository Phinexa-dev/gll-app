import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/widget/custom_button.dart';
import '../../../../../core/route/route_name.dart';
import '../../../domain/model/camp_event/camp_event_model.dart';

class CountryBottomSheet extends StatelessWidget {
  final CountrySipBasicDetails countrySipBasicDetails;

  const CountryBottomSheet({super.key, required this.countrySipBasicDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              "assets/more/drag_handle.png",
              width: 32,
              height: 4,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                countrySipBasicDetails.countryName,
                style: PhinexaFont.headingSmall,
              ),
              // Use conditional rendering to show the SIP and people impacted details
              // only if the values are greater than zero.
              if (countrySipBasicDetails.numberOfSips > 0)
                Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Image.asset(
                          "assets/more/land_plot.png",
                          width: 36,
                          height: 36,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${countrySipBasicDetails.numberOfSips} SIP',
                          style: PhinexaFont.highlightRegular.copyWith(
                            color: PhinexaColor.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (countrySipBasicDetails.impactedNumber > 0)
                Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Image.asset(
                          "assets/more/users_sip.png",
                          width: 36,
                          height: 36,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${countrySipBasicDetails.impactedNumber} people impacted',
                          style: PhinexaFont.highlightRegular.copyWith(
                            color: PhinexaColor.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              CustomButton(
                label: "Explore More",
                height: 40,
                onPressed: () {
                  context.pushNamed(
                    RouteName.campMoreDetail,
                    extra: countrySipBasicDetails.countryName,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
