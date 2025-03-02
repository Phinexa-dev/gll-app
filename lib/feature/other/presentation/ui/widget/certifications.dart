import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/fonts.dart';

class Certifications extends ConsumerWidget {

  const Certifications({
    super.key,
    required this.caption,
    required this.data,
    this.color = Colors.grey,
  });

  final String caption;
  final Color color;
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
                style: PhinexaFont.featureBold,
              ),
            ],
          ),
        ),

        // Table Container
        Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.22,
              child: PageView.builder(
                itemCount: data.length,
                controller: PageController(viewportFraction: 0.9),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Card(
                      color: Colors.grey[100],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(trimString(data[item]['program']!, 28), style: PhinexaFont.cardTipRegular.copyWith(fontWeight: FontWeight.bold)),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(data[item]['lab']!, style: PhinexaFont.captionSemiRegular),
                                Text(data[item]['year']!, style: PhinexaFont.footnoteRegular.copyWith(fontSize: 11, color: Colors.black54)),
                              ],
                            ),
                            trailing: Image(
                              image: const AssetImage('assets/more/certificate.png'),
                              width: 58,
                              height: 58,
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 5.0, bottom: 15.0),
                            child: Text(
                              data[item]['description']!,
                              style: PhinexaFont.captionSemiRegular.copyWith(
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
