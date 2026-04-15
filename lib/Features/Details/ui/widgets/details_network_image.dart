import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:shimmer/shimmer.dart';

class DetailsNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const DetailsNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) return const _ImagePlaceholder();

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      progressIndicatorBuilder: (context, url, progress) {
        return Shimmer.fromColors(
          baseColor: ColorsManager.lightGrey,
          highlightColor: Colors.white,
          child: Container(color: Colors.white),
        );
      },
      errorWidget: (context, url, error) {
        return const _ImagePlaceholder();
      },
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.lighterGrey,
      child: const Icon(Icons.image_not_supported_outlined),
    );
  }
}
