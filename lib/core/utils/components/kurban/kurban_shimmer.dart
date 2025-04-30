import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KurbanShimmer extends StatelessWidget {
  const KurbanShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  buildShimmerCircle(8),
                  const SizedBox(width: 8),
                  Expanded(child: buildShimmerBox(height: 24)),
                  const SizedBox(width: 16),
                  buildShimmerBox(width: 80, height: 24)
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  buildShimmerBox(width: 120, height: 16),
                  const SizedBox(width: 16),
                  buildShimmerBox(width: 120, height: 16)
                ],
              ),
              const SizedBox(height: 16),
              buildShimmerBox(height: 8)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShimmerCircle(double size) => Container(
        width: size,
        height: size,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      );

  Widget buildShimmerBox({double? width, required double height}) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
      );
}
