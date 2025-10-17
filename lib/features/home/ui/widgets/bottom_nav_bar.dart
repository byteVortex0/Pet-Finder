import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/image_manager.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onTab,
    required this.currentIndex,
  });

  final Function(int) onTab;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: ColorManager.brandColor,
        unselectedItemColor: Colors.grey.shade400,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: onTab,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 0 ? ImageManager.homeFilled : ImageManager.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 1
                  ? ImageManager.heartNavFilled
                  : ImageManager.heartNav,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageManager.message,
              colorFilter: ColorFilter.mode(
                currentIndex == 2
                    ? ColorManager.brandColor
                    : ColorManager.grey800,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageManager.profile,
              colorFilter: ColorFilter.mode(
                currentIndex == 3
                    ? ColorManager.brandColor
                    : ColorManager.grey800,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
