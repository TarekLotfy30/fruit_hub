import 'package:flutter/material.dart';

extension ScaffoldExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
