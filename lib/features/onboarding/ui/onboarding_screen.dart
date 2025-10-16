import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/common/widgets/custom_button.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';
import 'package:pet_finder/core/utils/image_manager.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/fonts/style_manager.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(ImageManager.onboarding),

              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Find Your Best Companion With Us\n',
                      style: StyleManager.black32Bold,
                    ),
                    TextSpan(
                      text:
                          '\nJoin & discover the best suitable pets as per your preferences in your location',
                      style: StyleManager.grey16Regular,
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: 'Get Started',
                showIcon: true,
                onTap: () {
                  context.pushReplacementNamed(AppRoutes.home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
