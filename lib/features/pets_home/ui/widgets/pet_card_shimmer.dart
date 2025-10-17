import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PetCardShimmer extends StatelessWidget {
  const PetCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            // 🐾 Placeholder image box
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(width: 12.w),

            // 🐾 Placeholder text boxes
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20.h, width: 120.w, color: Colors.grey),
                  SizedBox(height: 8.h),
                  Container(height: 14.h, width: 80.w, color: Colors.grey),
                  SizedBox(height: 8.h),
                  Container(height: 14.h, width: 60.w, color: Colors.grey),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Container(height: 14.h, width: 14.h, color: Colors.grey),
                      SizedBox(width: 6.w),
                      Container(height: 14.h, width: 60.w, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
