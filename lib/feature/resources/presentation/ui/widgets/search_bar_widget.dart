import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../provider/search_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state =
                    value; // Update search query
              },
              decoration: InputDecoration(
                  hintText: "Search reports",
                  border: InputBorder.none,
                  hintStyle: PhinexaFont.contentRegular
                      .copyWith(color: PhinexaColor.darkGrey)),
            ),
          ),
        ],
      ),
    );
  }
}
