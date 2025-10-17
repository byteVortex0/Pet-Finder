import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/utils/fonts/style_manager.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, required this.showIcon});

  final String title;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: StyleManager.black24Bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            showIcon
                ? IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                      size: 25.sp,
                    ),
                    onPressed: () {},
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
