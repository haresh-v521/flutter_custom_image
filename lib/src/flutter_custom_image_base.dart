import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A versatile image viewer widget that supports different image types: asset, SVG, and network.
enum ImageType { asset, svg, network }

/// It provides customization options such as width, height, box fit, error handling, and border radius.
/// The widget uses [CachedNetworkImage] for network images and [SvgPicture] for SVG images.
class ImageViewer extends StatelessWidget {
  /// The path to the image, whether it's an asset, SVG, or network image.
  final String imagePath;

  /// The type of the image (asset, SVG, or network).
  final ImageType imageType;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// The BoxFit parameter for controlling how the image should be inscribed into the box.
  final BoxFit? boxFit;

  /// The error icon to display in case of image loading failure.
  final IconData? errorIcon;

  /// The color of the image.
  final Color? imageColor;

  /// The color of the error icon.
  final Color? errorIconColor;

  /// The alignment of the image within its container.
  final Alignment alignment;

  /// The radius for the top-left corner of the image.
  final double topLeftRadius;

  /// The radius for the top-right corner of the image.
  final double topRightRadius;

  /// The radius for the bottom-left corner of the image.
  final double bottomLeftRadius;

  /// The radius for the bottom-right corner of the image.
  final double bottomRightRadius;

  /// Constructs an instance of [ImageViewer].
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

  /// Builds the image viewer based on the specified image type.
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

  /// Returns the border radius based on the specified corner radii.
  BorderRadius imageRadius() => BorderRadius.only(
        topRight: Radius.circular(topRightRadius),
        topLeft: Radius.circular(topLeftRadius),
        bottomRight: Radius.circular(bottomRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
      );

  /// Builds the error widget using the specified error icon and color.
  Widget errorWidget() => Icon(
        errorIcon,
        color: errorIconColor,
      );
}
