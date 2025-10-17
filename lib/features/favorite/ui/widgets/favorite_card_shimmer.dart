import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteCardShimmer extends StatelessWidget {
  const FavoriteCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🐾 Image Placeholder
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(height: 12.h),

            // 🐾 Text placeholders
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.h,
                  width: 120.w,
                  color: Colors.grey.shade300,
                ),
                SizedBox(height: 6.h),
                Container(
                  height: 16.h,
                  width: 80.w,
                  color: Colors.grey.shade300,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Container(
                      height: 16.h,
                      width: 16.w,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      height: 16.h,
                      width: 60.w,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
