import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_icon_button.dart';
import '../../../../domain/model/skill/skill_data_model.dart';

class SkillsTableWidget extends ConsumerWidget {

  const SkillsTableWidget({
    super.key,
    required this.caption,
    required this.data,
    this.onPressed,
    this.color = Colors.grey,
  }
  );

  final String caption;
  final Color color;
  final VoidCallback? onPressed;
  final List<SkillDataModel> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
                      borderColor: Color(0xFFB3B3B3),
                  ),
                )
              ],
            ),
          ),

          // Table Container
          (data.isEmpty)?
          const Center(
              child: Text(
                  'No data available',
              )
          ) :
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                for (int i = 0; i < data.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          trimString(data[i].skill, 15),
                          style: PhinexaFont.labelRegular.copyWith(
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (i < data.length - 1)
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
