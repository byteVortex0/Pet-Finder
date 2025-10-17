import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/features/pets_home/ui/widgets/categories_section.dart';
import 'package:pet_finder/features/pets_home/ui/widgets/pet_list_section.dart';

import 'widgets/header_section.dart';
import 'widgets/search_bar_section.dart';

class PetsHomeScreen extends StatelessWidget {
  const PetsHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const HeaderSection(title: 'Find Your Forever Pet', showIcon: true),
            SizedBox(height: 20.h),
            // 🔍 Search Bar
            SearchBarSection(),
            SizedBox(height: 20.h),
            // 🐾 Categories
            CategoriesSection(showTitle: true),
            SizedBox(height: 25.h),
            // 🐕 Pet List
            PetListSection(),
          ],
        ),
      ),
    );
  }
}
