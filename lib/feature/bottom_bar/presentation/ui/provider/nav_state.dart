import 'package:equatable/equatable.dart';

class NavState extends Equatable {
  const NavState({
    this.currentIndex = 0,
  });

  final int currentIndex;

  NavState copyWith({int? currentIndex}) {
    return NavState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  // TODO implement props
  List<Object?> get props => [currentIndex];
}