import 'package:flutter/material.dart';

@immutable
class RouteName{
  const RouteName._();

  static String get welcome => '/welcome';
  static String get dashboard => '/dashboard';
  static String get createSip => '/createSip';
  static String get resourceMore => '/resourceMore';
  static String get reportMore => '/reportMore';
}