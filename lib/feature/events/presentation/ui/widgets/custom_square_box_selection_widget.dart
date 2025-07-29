import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomSquareBoxSelectionWidget extends StatelessWidget {
  final String question;
  final String firstGrade;
  final String lastGrade;
  final Map<String, int> responses;
  final Function(String question, int value) onResponseSelected;

  const CustomSquareBoxSelectionWidget({
    super.key,
    required this.question,
    required this.firstGrade,
    required this.lastGrade,
    required this.responses,
    required this.onResponseSelected,
  });

  @override
  Widget build(BuildContext context) {
    int? selectedValue =
        responses[question]; // Get the selected value from the responses map

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: PhinexaFont.contentRegular,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              int value = index + 1;
              bool isSelected = selectedValue == value;

              return GestureDetector(
                onTap: () => onResponseSelected(question, value),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? PhinexaColor.primaryLightBlue
                        : PhinexaColor.primaryExLightBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    value.toString(),
                    style: PhinexaFont.contentRegular.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(firstGrade,
                  style: PhinexaFont.captionRegular
                      .copyWith(color: PhinexaColor.darkGrey)),
              Text(lastGrade,
                  style: PhinexaFont.captionRegular
                      .copyWith(color: PhinexaColor.darkGrey)),
            ],
          ),
        ],
      ),
    );
  }
}
