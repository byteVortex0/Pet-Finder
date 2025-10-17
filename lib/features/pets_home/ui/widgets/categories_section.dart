import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/utils/color_manager.dart';

import '../../../../core/utils/fonts/style_manager.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.showTitle});

  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final categories = ["All", "Cats", "Dogs", "Birds", "Fish", "Reptiles"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle
            ? Text("Categories", style: StyleManager.black20Bold)
            : const SizedBox(),
        SizedBox(height: 15.h),

        SizedBox(
          height: 35.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => SizedBox(width: 8.w),
            itemBuilder: (_, index) {
              bool isSelected = index == 0;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorManager.brandColor
                      : ColorManager.chipColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: StyleManager.brand14SemiBold.copyWith(
                      color: isSelected
                          ? Colors.white
                          : ColorManager.brandColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
