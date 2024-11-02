import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miles/utils/extentions.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    super.key,
    required this.imagePath, // Required parameter for showing the image
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  final String imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: _buildCircleImage(),
      ),
    );
  }

  Widget _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  Widget _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: radius,
        ),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    switch (imagePath.imageType) {
      case ImageType.svg:
        return SizedBox(
          height: height,
          width: width,
          child: SvgPicture.asset(
            imagePath,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          ),
        );
      case ImageType.file:
        return Image.file(
          File(imagePath),
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );
      case ImageType.network:
        return CachedNetworkImage(
          height: height,
          width: width,
          imageUrl: imagePath,
          color: color,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) => const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Image.asset(
            placeHolder,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
          ),
        );
      case ImageType.png:
      default:
        return Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );
    }
  }
}
