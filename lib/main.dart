import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

void main() {
  runApp(MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData.dark().copyWith(
    backgroundColor: backgroundColor
  ),
  home: const Text('Test'),
  ));
}
