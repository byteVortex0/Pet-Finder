import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/fonts/style_manager.dart';

class NameAndLocation extends StatelessWidget {
  const NameAndLocation({super.key, required this.name, required this.origin});

  final String name;
  final String origin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: StyleManager.black24Bold),
        SizedBox(height: 5.h),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.red, size: 18),
            SizedBox(width: 4.w),
            Text(origin, style: StyleManager.grey16Regular),
          ],
        ),
      ],
    );
  }
}
