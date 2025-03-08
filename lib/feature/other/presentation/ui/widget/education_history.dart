import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_icon_button.dart';

import 'educational_history/edit_educational_history.dart';

class EducationHistory extends ConsumerWidget {

  const EducationHistory({
    super.key,
    required this.caption,
    required this.data,
    // required this.onPressedEdit,
    required this.onPressedAdd,
    this.color = Colors.grey,
  });

  final String caption;
  final Color color;
  // final VoidCallback onPressedEdit;
  final VoidCallback onPressedAdd;
  final List<Map<String,String>> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                caption,
                style: PhinexaFont.featureBold,
              ),
              Row(
                children: [
                  CustomIconButton(
                    label: 'Add',
                    textColour: Colors.black,
                    onPressed: onPressedAdd,
                    color: Colors.white,
                    btnSize: 'small',
                    borderColor: Colors.blue,
                  ),
                ],
              )
            ],
          ),
        ),

        // Table Container
        Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, item) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric( vertical: 2),
                          alignment: Alignment.centerLeft,
                          child: Text(
                              data[item]['degree']!,
                              style: PhinexaFont.cardTipRegular,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // delete Icon button
                          IconButton(
                              onPressed: () {
                                // Handle delete item
                              },
                              icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 20),
                          ),
                          CustomIconButton(
                            label: 'Edit',
                            textColour: Colors.black,
                            onPressed: ()=>{
                                // ref.read(animationVisibilityProvider.notifier).state = false;
                                // open the signup overlay
                                showModalBottomSheet(
                                  // transitionAnimationController: _signUpAnimationController,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    // return unimplemented
                                    return EditEducationalHistory();
                                  },
                                ).whenComplete(() {
                                  // ref.read(animationVisibilityProvider.notifier).state = true;
                                })
                            },
                            color: Colors.white,
                            btnSize: 'small',
                            borderColor: Colors.blue,
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(data[item]['institution']!, style: PhinexaFont.captionRegular),
                        Text("${data[item]['startDate']!} - ${data[item]['endDate']!}", style: PhinexaFont.footnoteRegular.copyWith(fontSize:11 ,color: Colors.grey)),
                      ],
                    ),
                  ),
                  leading: SvgPicture.asset('assets/more/${data[item]['icon']}', width: 30, height: 30, alignment: Alignment.topLeft,),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  String trimString(String str, int length) {
    return str.length > length ? '${str.substring(0, length)}...' : str;
  }
}
