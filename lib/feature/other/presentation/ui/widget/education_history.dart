import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/widget/custom_button.dart';

class EducationHistory extends ConsumerWidget {

  const EducationHistory({
    super.key,
    required this.caption,
    required this.data,
    required this.onPressedEdit,
    required this.onPressedAdd,
    this.color = Colors.grey,
  });

  final String caption;
  final Color color;
  final VoidCallback onPressedEdit;
  final VoidCallback onPressedAdd;
  final List<Map<String,String>> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                caption,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  CustomButton(
                    label: 'edit',
                    textColour: Colors.black,
                    onPressed: onPressedEdit,
                    color: Colors.white,
                    btnSize: 'small',
                    borderColor: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    label: 'add',
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
                  title: Container(
                    padding: const EdgeInsets.symmetric( vertical: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(data[item]['degree']!, style: TextStyle(fontSize:14)),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(data[item]['institution']!, style: TextStyle(fontSize:12)),
                      Text(data[item]['year']!, style: TextStyle(fontSize:11 ,color: Colors.grey)),
                    ],
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
