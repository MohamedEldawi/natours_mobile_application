import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_state.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/networking/api_constants.dart';
import 'package:shimmer/shimmer.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = context.select<UserResponseCubit, String?>(
      (cubit) => cubit.state.maybeWhen(
        userSuccess: (user) => user.data!.photo,
        orElse: () => null,
      ),
    );
    final loading = context.select<UserResponseCubit, bool>(
      (cubit) =>
          cubit.state.maybeWhen(userLoading: () => true, orElse: () => false),
    );
    if (loading) {
      return Shimmer.fromColors(
        baseColor: ColorsManager.lightGrey,
        highlightColor: Colors.white,
        child: CircleAvatar(radius: 24, backgroundColor: Colors.white),
      );
    }

    return CachedNetworkImage(
      progressIndicatorBuilder: (context, url, progress) {
        return Shimmer.fromColors(
          baseColor: ColorsManager.lightGrey,
          highlightColor: Colors.white,
          child: CircleAvatar(radius: 24, backgroundColor: Colors.white),
        );
      },
      imageUrl: '${ApiConstants.baseUsersImageUrl}${avatar!}',
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(radius: 24, backgroundImage: imageProvider);
      },
    );
  }
}
