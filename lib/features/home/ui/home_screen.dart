import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/features/home/logic/home_nav_cubit.dart';
import 'package:pet_finder/features/pets_home/ui/pets_home_screen.dart';

import '../../favorite/ui/favorite_screen.dart';
import 'widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> screens = const [
    PetsHomeScreen(),
    FavoriteScreen(),
    Center(child: Text('Chat')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavBar(
            currentIndex: currentIndex,
            onTab: (index) {
              context.read<HomeNavCubit>().changeTab(index);
            },
          ),
        );
      },
    );
  }
}
