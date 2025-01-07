import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/widget/custom_icon_button.dart';

class InfoTableWidget extends ConsumerWidget {

  const InfoTableWidget({
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
  final Map<String,String> data;

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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Visibility(
                  visible: onPressed != null,
                  child: CustomIconButton(
                      label: 'edit',
                      textColour: Colors.black,
                      onPressed: onPressed == null? ()=>{} : onPressed!,
                      color: Colors.white,
                      btnSize: 'small',
                      borderColor: Colors.blue,
                  ),
                )
              ],
            ),
          ),

          // Table Container
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                for (int i = 0; i < data.entries.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          trimString(data.entries.elementAt(i).key, 15),
                          style: TextStyle(
                            fontSize: 15,
                            color: color,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            trimString(data.entries.elementAt(i).value, 20),
                            style: TextStyle(
                              fontSize: 13,
                              color: color,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (i < data.entries.length - 1)
                    const Divider(height: 1, color: Colors.grey),
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
