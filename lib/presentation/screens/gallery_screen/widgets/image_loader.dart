import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;

  const ImageLoader({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => const PlaceHolderImageLoader(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class PlaceHolderImageLoader extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit? fit;

  const PlaceHolderImageLoader({Key? key, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: Image.asset(
      "assets/images/placeholder.png",
      height: height,
      width: width,
      fit: fit,
      gaplessPlayback: true,
    ));
  }
}
