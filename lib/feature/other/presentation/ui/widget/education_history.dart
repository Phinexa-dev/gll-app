import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_icon_button.dart';
import 'package:gll/feature/other/domain/model/education/education_data_model.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/education/education_controller.dart';
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
  final List<EducationDataModel> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final educationState = ref.watch(educationControllerProvider);

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
                    isBold: true,
                    textColour: Colors.black,
                    onPressed: onPressedAdd,
                    color: Colors.white,
                    btnSize: 'small',
                    borderColor: Color(0xFF3993A1),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),

        // Table Container
        Column(
          children: [
            data.isEmpty && !educationState.isLoading
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    alignment: Alignment.center,
                    child: Text(
                      'No education history found',
                      style: PhinexaFont.cardTipRegular,
                    ),
                  )
                :
                Container(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: educationState.isLoading? 2 : data.length,
              itemBuilder: (context, item) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric( vertical: 2),
                          alignment: Alignment.centerLeft,
                          child: educationState.isLoading?
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: 16, // Approximate height of text
                              width: 150, // Approximate width of degree text
                              color: Colors.grey.shade300, // Placeholder color
                            ),
                          )
                              :
                          Text(
                              data[item].degree,
                              style: PhinexaFont.cardTipRegular,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // delete Icon button
                          educationState.isLoading?
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: 16, // Approximate height of text
                              width: 50, // Approximate width of edit text
                              color: Colors.grey.shade300, // Placeholder color
                            ),
                          )
                              :
                          IconButton(
                              onPressed: educationState.isLoading?
                              () => {}
                              :
                              () {
                                ref.watch(educationControllerProvider.notifier).deleteEducationData(data[item].id);
                              },
                              icon: Icon(
                                  Icons.delete_outline,
                                  color: Color(0xFFE87878),
                                  size: 20),
                          ),
                          educationState.isLoading?
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: 16, // Approximate height of text
                              width: 50, // Approximate width of edit text
                              color: Colors.grey.shade300, // Placeholder color
                            ),
                          )
                              :
                          CustomIconButton(
                            label: 'Edit',
                            isBold: true,
                            textColour: Colors.black,
                            onPressed: educationState.isLoading?
                                () => {}
                                :
                                ()=>{
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
                                    return EditEducationalHistory(educationData: data[item]);
                                  },
                                ).whenComplete(() {
                                  // ref.read(animationVisibilityProvider.notifier).state = true;
                                })
                            },
                            color: Colors.white,
                            btnSize: 'small',
                            borderColor: Color(0xFF3993A1),
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
                        educationState.isLoading
                            ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: 14, // Approximate height of institution text
                            width: 120, // Approximate width
                            color: Colors.grey.shade300,
                          ),
                        )
                            :
                        Text(data[item].school, style: PhinexaFont.captionRegular),

                        educationState.isLoading
                            ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: 11, // Approximate height of date text
                            width: 80, // Approximate width of "start - end"
                            color: Colors.grey.shade300,
                          ),
                        )
                            :
                        Text("${data[item].startdate.year} - ${data[item].enddate.year}", style: PhinexaFont.footnoteRegular.copyWith(fontSize:11 ,color: Colors.grey)),
                      ],
                    ),
                  ),
                  leading: educationState.isLoading
                      ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 30, // Match SvgPicture width
                      height: 30, // Match SvgPicture height
                      color: Colors.grey.shade300,
                    ),
                  )
                      :
                  SvgPicture.asset(
                    'assets/more/${data[item].degree.toLowerCase().contains("master")? 'masters.svg' : 'bachelor.svg'}'
                    , width: 30, height: 30, alignment: Alignment.topLeft,
                  ),
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
