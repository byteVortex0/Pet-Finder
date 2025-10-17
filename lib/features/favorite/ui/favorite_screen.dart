import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pets_home/ui/widgets/categories_section.dart';
import '../../pets_home/ui/widgets/header_section.dart';
import 'widgets/favorites_grid.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          children: [
            // Header
            const HeaderSection(title: 'Your Favorite Pets', showIcon: false),
            // 🐾 Categories
            CategoriesSection(showTitle: false),
            SizedBox(height: 25.h),
            // 🐕 Pet List
            const FavoritesGrid(),
          ],
        ),
      ),
    );
  }
}
