import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/feature/events/presentation/ui/screen/events_screen.dart';
import 'package:gll/feature/home/presentation/ui/screen/home_screen.dart';
import 'package:gll/feature/other/presentation/ui/screen/other_screen.dart';
import 'package:gll/feature/resources/presentation/ui/screen/resources_screen.dart';
import 'package:gll/feature/bottom_bar/presentation/ui/provider/nav_provider.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {

  static final List<Widget> _screenOptions = <Widget>[
    const HomeScreen(),
    const ResourcesScreen(),
    const EventsScreen(),
    const OtherScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    final navState = ref.watch(navProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: _screenOptions.elementAt(navState.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navState.currentIndex,
        onTap: (value) {
          ref.read(navProvider.notifier).onItemTapped(value);
        },
        elevation: 10,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        selectedItemColor: PhinexaColor.primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF526480),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            activeIcon: Icon(Icons.folder),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            // three dots
            icon: Icon(Icons.more_horiz),
            activeIcon: Icon(Icons.more_horiz_outlined),
            label: 'More',
          )
        ],
      ),
    );
  }
}