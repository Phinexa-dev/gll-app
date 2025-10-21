import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class SurveyGrid extends StatelessWidget {
  final List<String> questions;
  final String firstGrade;
  final String lastGrade;
  final Map<String, int> responses;
  final Function(String question, int value) onResponseSelected;

  const SurveyGrid(
      {super.key,
      required this.questions,
      required this.responses,
      required this.onResponseSelected,
      required this.firstGrade,
      required this.lastGrade});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: questions.map((question) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
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
                  bool isSelected = responses[question] == value;

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
                      child: Text(value.toString(),
                          style: PhinexaFont.contentRegular.copyWith(
                            color: isSelected ? Colors.white : Colors.black,
                          )),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Disagree",
                      style: PhinexaFont.captionRegular
                          .copyWith(color: PhinexaColor.grey)),
                  Text("Strongly Agree",
                      style: PhinexaFont.captionRegular
                          .copyWith(color: PhinexaColor.grey)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
