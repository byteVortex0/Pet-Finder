import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_weight_helper.dart';

class StyleManager {
  static TextStyle black25Semibold = GoogleFonts.inter(
    fontSize: 25.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
}
