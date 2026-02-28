import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit,
  });
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder:
          (context, url) =>
              Center(child: CircularProgressIndicator(color: Colors.black)),
      errorWidget:
          (context, url, error) => Container(
            color: Colors.white10,
            child: Icon(Icons.error, color: Colors.black),
          ),
      height: height ?? 148.h,
      width: width ?? 148.w,
      fit: fit ?? BoxFit.fill,
    );
  }
}
