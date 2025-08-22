import 'package:decor_nest/core/helper/extensions.dart';
import 'package:flutter/material.dart';

class AddImagePlaceholder extends StatelessWidget {
  const AddImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: context.surfaceColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.subTextColor),
            ),
            width: double.infinity,
            child: const Icon(Icons.image, size: 60),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            backgroundColor: context.primaryColor,
            child: IconButton(
              icon: const Icon(Icons.add, size: 18),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
