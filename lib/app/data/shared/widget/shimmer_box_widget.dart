import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final Size size;

  const ShimmerBox({Key? key, required this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Shimmer.fromColors(
        baseColor: Colors.blueGrey.withOpacity(.1),
        highlightColor: Colors.black.withOpacity(.03),
        child: ListView.builder(
          itemCount: 4,
          itemExtent: 120,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            ShimmerBox(
                              size: Size(150, 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const ShimmerBox(
                          size: Size(80, 12),
                        ),
                        const SizedBox(height: 8),
                        IntrinsicHeight(
                          child: Row(
                            children: const [
                              VerticalDivider(
                                thickness: 4,
                                width: 4,
                              ),
                              SizedBox(width: 8),
                              ShimmerBox(
                                size: Size(250, 12),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            ShimmerBox(
                              size: Size(120, 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1),
              ],
            );
          },
        ),
      ),
    );
  }
}
