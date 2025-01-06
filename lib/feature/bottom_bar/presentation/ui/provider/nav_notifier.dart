import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/bottom_bar/presentation/ui/provider/nav_state.dart';

class NavNotifier extends StateNotifier<NavState>
{
  NavNotifier() : super(const NavState());

  void onItemTapped(int index)
  {
    state = state.copyWith(currentIndex: index);
  }
}