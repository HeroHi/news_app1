import 'package:flutter/material.dart';

class SkeletonArticleWidget extends StatelessWidget {
  const SkeletonArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skeleton for the image
          Container(
            height: 200, // Adjust height based on your design
            color: Colors.grey[300],
          ),
          const SizedBox(height: 12),
          // Skeleton for the source name
          Container(
            height: 20,
            width: 100,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 8),
          // Skeleton for the title
          Container(
            height: 16,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 8),
          Container(
            height: 16,
            width: MediaQuery.of(context).size.width * 0.7,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
