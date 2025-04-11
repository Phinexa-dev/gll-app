import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_icon_button.dart';
import 'package:shimmer/shimmer.dart';

class InfoTableWidget extends ConsumerWidget {

  const InfoTableWidget({
    super.key,
    required this.caption,
    required this.data,
    required this.isLoading,
    this.onPressed,
    this.color = Colors.grey,
  }
  );

  final String caption;
  final Color color;
  final VoidCallback? onPressed;
  final Map<String,dynamic>? data;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final length = data?.entries.length ?? 0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: (onPressed == null)? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  caption,
                  style: PhinexaFont.featureBold,
                ),
                Visibility(
                  visible: onPressed != null,
                  child: CustomIconButton(
                      label: 'Edit',
                      isBold: true,
                      textColour: Colors.black,
                      onPressed: onPressed == null? ()=>{} : onPressed!,
                      color: Colors.white,
                      btnSize: 'small',
                      borderColor: Color(0xFF3993A1),
                  ),
                )
              ],
            ),
          ),

          // Table Container
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                for (int i = 0; i < length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          trimString(data!.entries.elementAt(i).key, 15),
                          style: PhinexaFont.labelRegular.copyWith(
                            color: color,
                          ),
                        ),
                        const Spacer(), // Pushes the next widget to the right
                        isLoading?
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: 16,
                            width: 150, // Fixed width for shimmer
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        )
                        :
                        Text(
                          trimString(data?.entries.elementAt(i).value?? "-", 20),
                          style: PhinexaFont.captionAccent.copyWith(
                            fontSize: 13,
                            color: color,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),

                  if (i < length - 1)
                    const Divider(height: 1, color: Color(0xFFE5E5E5)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String trimString(String str, int length) {
    return str.length > length ? '${str.substring(0, length)}...' : str;
  }
}
