import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: PhinexaColor.lighterGrey,
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: PhinexaColor.grey,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: PhinexaColor.grey,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search SIP",
                    hintStyle: PhinexaFont.highlightRegular.copyWith(color: PhinexaColor.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
