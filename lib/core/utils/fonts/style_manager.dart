import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_finder/core/utils/color_manager.dart';

import 'font_weight_helper.dart';

class StyleManager {
  static TextStyle white18Medium = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );

  static TextStyle black32Bold = GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.black,
  );

  static TextStyle black24Bold = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle black20Bold = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle black18Bold = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle brand14SemiBold = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorManager.brandColor,
  );

  static TextStyle grey16Regular = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.grey,
  );

  static TextStyle grey14Regular = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.grey900,
  );
}
