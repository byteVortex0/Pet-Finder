import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/fonts/style_manager.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: const Color(0xffF5F6FA),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10.w),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",

                    border: InputBorder.none,
                    hintStyle: StyleManager.grey16Regular,
                  ),
                ),
              ),
              const Icon(Icons.tune, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
