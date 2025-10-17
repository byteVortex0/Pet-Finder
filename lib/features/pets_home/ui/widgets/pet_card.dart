import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';
import 'package:pet_finder/core/utils/color_manager.dart';
import 'package:pet_finder/core/utils/fonts/style_manager.dart';
import 'package:pet_finder/features/favorite/logic/cubit/favorite_cubit.dart';

import '../../../../core/common/logic/generic_state.dart';
import '../../../../core/routes/app_routes.dart';
import '../../data/models/pets.dart';

class PetCard extends StatelessWidget {
  const PetCard({super.key, required this.pet});

  final Pets pet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.pushNamed(AppRoutes.petsDetails, arguments: pet);
        if (!context.mounted) return;
        context.read<FavoriteCubit>().fetchFavorites();
      },
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // 🐾 Pet Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                height: 100.h,
                width: 100.w,
                imageUrl: pet.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: Colors.grey.shade200),
                errorWidget: (context, url, error) => CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=735',
                  fit: BoxFit.cover,
                  errorWidget: (c, e, s) =>
                      Container(color: Colors.grey.shade300),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // 🐾 Pet Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          pet.name,
                          style: StyleManager.black18Bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      BlocBuilder<FavoriteCubit, GenericState<List<Pets>>>(
                        builder: (context, state) {
                          final isFav = context
                              .read<FavoriteCubit>()
                              .isFavorite(pet.id);
                          return IconButton(
                            onPressed: () {
                              context
                                  .read<FavoriteCubit>()
                                  .addAndRemoveFavorite(pet);
                            },
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: Colors.teal,
                              size: 25.sp,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // Text(pet.gender, style: StyleManager.grey14Regular),
                  Text(
                    '${pet.lifeSpan} Old',
                    style: StyleManager.grey14Regular,
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ColorManager.red,
                        size: 20.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(pet.origin, style: StyleManager.grey14Regular),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
