import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/features/pets_home/logic/get_all_pets_cubit.dart';

import '../../../../core/common/logic/generic_state.dart';
import '../../../../core/utils/fonts/style_manager.dart';
import '../../data/models/pets.dart';
import 'pet_card.dart';
import 'pet_card_shimmer.dart';

class PetListSection extends StatelessWidget {
  const PetListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetAllPetsCubit, GenericState<List<Pets>>>(
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
                'No Pets Found',
                textAlign: TextAlign.center,
                style: StyleManager.black18Bold,
              ),
            );
          }

          return ListView.separated(
            itemCount: loading ? 5 : pets.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (_, index) {
              if (loading) return const PetCardShimmer();
              final pet = pets[index];
              return PetCard(pet: pet);
            },
          );
        },
      ),
    );
  }
}
