import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({
    super.key,
    this.opacity,
    this.baseColor,
    this.highlightColor,
    this.skeletonColor,
    this.height,
    this.width,
    this.borderRadius,
  });

  final double? opacity;
  final Color? baseColor;
  final Color? highlightColor;
  final Color? skeletonColor;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 0.8,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey[300]!,
        highlightColor: highlightColor ?? Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: skeletonColor ?? Colors.grey[100]!,
            borderRadius: borderRadius ?? BorderRadius.circular(30),
          ),
          height: height ?? 20,
          width: width,
        ),
      ),
    );
  }
}
