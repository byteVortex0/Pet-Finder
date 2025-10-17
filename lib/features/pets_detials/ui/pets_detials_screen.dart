import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/common/widgets/custom_button.dart';
import 'package:pet_finder/core/utils/fonts/style_manager.dart';
import 'package:pet_finder/features/pets_home/data/models/pets.dart';

import 'widgets/age_and_weight.dart';
import 'widgets/header_image.dart';
import 'widgets/name_and_location.dart';

class PetsDetialsScreen extends StatelessWidget {
  const PetsDetialsScreen({super.key, required this.pet});

  final Pets pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image + Favorite Icon
                  HeaderImage(pet: pet),
                  SizedBox(height: 20.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NameAndLocation(name: pet.name, origin: pet.origin),
                        SizedBox(height: 20.h),

                        //  Age, Weight
                        AgeAndWeight(
                          age: pet.lifeSpan,
                          weight: pet.weight.metric,
                        ),
                        SizedBox(height: 20.h),

                        // About
                        Text("About:", style: StyleManager.black20Bold),
                        SizedBox(height: 8.h),
                        Text(
                          pet.description,
                          style: StyleManager.grey16Regular,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),

          // Adopt Button
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.h),
              child: CustomButton(
                text: "Adopt me",
                showIcon: false,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
