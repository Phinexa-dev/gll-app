import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/tab_bar_widget.dart';

import '../../../../../common/theme/fonts.dart';
import '../provider/resources_tab_control_provider.dart';
import '../widgets/floating_action_button_widget.dart';
import '../widgets/search_bar_widget.dart';

class ResourcesScreen extends ConsumerStatefulWidget {
  const ResourcesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResourcesScreenState();
}

class _ResourcesScreenState extends ConsumerState<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabIndexProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            'My SIP',
            style: PhinexaFont.headingSmall,
          )),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/resources/resources_screen_image.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            const SliverToBoxAdapter(
              child: SearchBarWidget(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            const SliverFillRemaining(
              child: TabBarWidget(),
            ),
          ],
        ),
        floatingActionButton:
            tabIndex != 0 ? null : FloatingActionButtonWidget(),
      ),
    );
  }
}
