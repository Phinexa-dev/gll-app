import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerBox({required double width, double height = 16}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}