import 'package:flutter/material.dart';

@immutable
class RouteName{
  const RouteName._();

  static String get welcome => '/welcome';
  static String get login => '/login';
  static String get signup => '/signup';
}