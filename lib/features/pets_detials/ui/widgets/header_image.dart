import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';

import '../../../../core/common/logic/generic_state.dart';
import '../../../favorite/logic/cubit/favorite_cubit.dart';
import '../../../pets_home/data/models/pets.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key, required this.pet});

  final Pets pet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 350.h,
          decoration: BoxDecoration(
            color: const Color(0xffF6F8FB),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: CachedNetworkImage(
            height: 350.h,
            imageUrl: pet.imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Container(color: Colors.grey.shade200),
            errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=735',
              fit: BoxFit.cover,
              errorWidget: (c, e, s) => Container(color: Colors.grey.shade300),
            ),
          ),
        ),
        Positioned(
          top: 16.h,
          right: 16.w,
          left: 16.w,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.teal,
                      size: 22.sp,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: BlocBuilder<FavoriteCubit, GenericState<List<Pets>>>(
                    builder: (context, state) {
                      final isFav = context.read<FavoriteCubit>().isFavorite(
                        pet.id,
                      );
                      return IconButton(
                        onPressed: () {
                          context.read<FavoriteCubit>().addAndRemoveFavorite(
                            pet,
                          );
                        },
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.teal,
                          size: 25.sp,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
