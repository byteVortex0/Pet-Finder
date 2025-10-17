import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/features/favorite/ui/widgets/favorite_card_shimmer.dart';

import '../../../../core/common/logic/generic_state.dart';
import '../../../../core/utils/fonts/style_manager.dart';
import '../../../pets_home/data/models/pets.dart';
import '../../logic/cubit/favorite_cubit.dart';
import 'favorite_card.dart';

class FavoritesGrid extends StatelessWidget {
  const FavoritesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FavoriteCubit, GenericState<List<Pets>>>(
        builder: (context, state) {
          final loading = state.state == RequestState.loading;

          final pets = state.data ?? [];

          if (state.state == RequestState.error) {
            return Center(
              child: Text(
                state.message!,
                textAlign: TextAlign.center,
                style: StyleManager.black18Bold,
              ),
            );
          }

          if (state.state == RequestState.empty) {
            return Center(
              child: Text(
                'No Favorites Found',
                textAlign: TextAlign.center,
                style: StyleManager.black18Bold,
              ),
            );
          }

          return GridView.builder(
            itemCount: loading ? 6 : pets.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (_, index) {
              if (loading) return const FavoriteCardShimmer();
              final pet = pets[index];
              return FavoriteCard(pet: pet);
            },
          );
        },
      ),
    );
  }
}
