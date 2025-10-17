import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/utils/fonts/style_manager.dart';

class AgeAndWeight extends StatelessWidget {
  const AgeAndWeight({super.key, required this.age, required this.weight});

  final String age;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildInfoCard("Age", "$age Year", context),
        _buildInfoCard("Weight", "$weight kg", context),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: const Color(0xffF6F8FB),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(title, style: StyleManager.black18Bold),
          SizedBox(height: 5.h),
          Text(value, style: StyleManager.grey16Regular),
        ],
      ),
    );
  }
}
