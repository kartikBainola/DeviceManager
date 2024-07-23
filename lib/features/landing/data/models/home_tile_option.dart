import 'package:flutter/material.dart';
import 'package:device_manager/helpers/enums.dart';

class HomeTileOption {
  final IconData icon;
  final String label;
  final HomeTileOptions option;

  HomeTileOption(
      {required this.icon, required this.label, required this.option});
}
