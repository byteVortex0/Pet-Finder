import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injection.dart';
import 'core/service/shared_pref/shared_pref.dart';
import 'pet_finder_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  await SharedPref.init();

  setupInjection();

  runApp(const PetFinderApp());
}
