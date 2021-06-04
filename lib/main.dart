import 'package:clean_arch/app_module.dart';
import 'package:clean_arch/app_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators(Dio());
  runApp(AppWidget());
}
