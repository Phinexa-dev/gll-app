import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/other/data/local/settings_options.dart';
import 'package:gll/feature/other/presentation/ui/widget/profile_bar.dart';
import 'package:go_router/go_router.dart';

class OtherScreen extends ConsumerStatefulWidget {
  const OtherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtherScreenState();
}

class _OtherScreenState extends ConsumerState<OtherScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final optionListHPadding = MediaQuery.of(context).size.width * 0.1 / 2;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // https://stackoverflow.com/questions/44978216/flutter-remove-back-button-on-appbar
          automaticallyImplyLeading: false,
          title: const Center(child: Text('More')),
          elevation: 0,
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            //scrolling part
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 130),
              child: Column(
                children: [
                  //image
                  SvgPicture.asset(
                    'assets/more/cover_image_of_more_screen.svg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),

                  SizedBox(height: 15),

                  // option list
                  ...List.generate(
                    settingsOptions.length,
                    (list) => Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              list == settingsOptions.length - 1 ? 10.0 : 35.0,
                          left: optionListHPadding,
                          right: optionListHPadding),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: settingsOptions[list].length,
                        itemBuilder: (context, option) {
                          return ListTile(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            tileColor: Color(0xFFF7F7F7).withAlpha(230),
                            title: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              alignment: Alignment.centerLeft,
                              child:
                                  Text(settingsOptions[list][option]['title']!),
                            ),
                            leading: SvgPicture.asset(
                                'assets/more/${settingsOptions[list][option]['icon']!}',
                                width: 40,
                                height: 40),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF3993A1),
                              size: 18,
                            ),
                            onTap: () {
                              // Handle item click
                              context.pushNamed(
                                  settingsOptions[list][option]['route']!);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              color: Colors.white.withAlpha(150),
              height: 115,
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  context.pushNamed(RouteName.profile);
                },
                child: ProfileBar(),
              ),
            ),
          ],
        ));
  }
}
