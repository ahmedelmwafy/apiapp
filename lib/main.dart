import 'package:apiapp/helpers/dio.dart';
import 'package:apiapp/helpers/shared.dart';
import 'package:apiapp/screens/material/view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashedHelper.init();
  await DioHelper.init();
  runApp(const ApiTest());
}
