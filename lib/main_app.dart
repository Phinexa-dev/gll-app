import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/app_theme.dart';
import 'package:gll/core/route/router_provider.dart';
import 'package:gll/feature/system_feedback/widget/feedback_listener.dart';
import 'common/theme/theme_provider.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: goRouter,
      builder: (context, child) {
        return FeedbackListener(child: child!);
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(themeProvider),
    );
  }
}