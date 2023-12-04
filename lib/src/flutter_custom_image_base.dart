import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ImageType { asset, svg, network }

class ImageViewer extends StatelessWidget {
  final String imagePath;
  final ImageType imageType;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final IconData? errorIcon;
  final Color? imageColor;
  final Color? errorIconColor;
  final Alignment alignment;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;

  const ImageViewer({
    super.key,
    required this.imagePath,
    required this.imageType,
    this.width,
    this.height,
    this.boxFit = BoxFit.contain,
    this.errorIcon = Icons.error,
    this.imageColor,
    this.errorIconColor = Colors.red,
    this.alignment = Alignment.center,
    this.topLeftRadius = 0.0,
    this.topRightRadius = 0.0,
    this.bottomLeftRadius = 0.0,
    this.bottomRightRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.asset:
        return ClipRRect(
          borderRadius: imageRadius(),
          child: Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: boxFit,
            color: imageColor,
            alignment: alignment,
            errorBuilder: (context, url, error) => errorWidget(),
          ),
        );
      case ImageType.svg:
        return ClipRRect(
          borderRadius: imageRadius(),
          child: SvgPicture.asset(
            imagePath,
            width: width,
            height: height,
            fit: boxFit!,
            alignment: alignment,
            colorFilter: imageColor != null
                ? ColorFilter.mode(imageColor!, BlendMode.srcIn)
                : null,
          ),
        );
      case ImageType.network:
        return ClipRRect(
          borderRadius: imageRadius(),
          child: CachedNetworkImage(
            imageUrl: imagePath,
            width: width,
            height: height,
            fit: boxFit,
            alignment: alignment,
            color: imageColor,
            errorWidget: (context, url, error) => errorWidget(),
          ),
        );
    }
  }

  BorderRadius imageRadius() => BorderRadius.only(
        topRight: Radius.circular(topRightRadius),
        topLeft: Radius.circular(topLeftRadius),
        bottomRight: Radius.circular(bottomRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
      );

  Widget errorWidget() => Icon(
        errorIcon,
        color: errorIconColor,
      );
}
