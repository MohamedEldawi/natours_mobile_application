import 'package:flutter/material.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryScreen extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;
  const GalleryScreen({
    super.key,
    required this.imageUrls,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: PhotoViewGallery.builder(
          pageController: PageController(initialPage: initialIndex),
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(imageUrls[index]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 3,
              heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: ColorsManager.white,
                    size: 48,
                  ),
                );
              },
            );
          },
          itemCount: imageUrls.length,
          loadingBuilder: (context, event) => Center(
            child: Shimmer.fromColors(
              baseColor: ColorsManager.lightGrey,
              highlightColor: ColorsManager.white,
              child: Container(color: ColorsManager.white),
            ),
          ),
        ),
      ),
    );
  }
}
