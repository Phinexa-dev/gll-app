import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingProvider = StateProvider<bool>((ref) => false);

final surveyRefreshProvider = StateProvider<int>((ref) => 0);
