import 'package:flutter/material.dart';

@immutable
class RouteName{
  const RouteName._();

  static String get welcome => '/welcome';
  static String get dashboard => '/dashboard';
  static String get profile => '/profile';
  static String get editProfile => '/editProfile';
  static String get settings => '/settings';
  static String get newsletter => '/newsletter';
  static String get worldMap => '/worldMap';
  static String get facultyResources => '/facultyResources';
  static String get aboutGL2 => '/aboutGL2';
  static String get contactUs => '/contactUs';
  static String get faqs => '/faqs';
  static String get feedbacks => '/feedbacks';
  static String get help => '/help';
  static String get createSip => '/createSip';
}