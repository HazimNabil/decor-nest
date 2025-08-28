import 'package:decor_nest/core/helper/extensions.dart';
import 'package:flutter/material.dart';

class UpdateImagePlaceholder extends StatelessWidget {
  final String? imageUrl;

  const UpdateImagePlaceholder({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(imageUrl!, fit: BoxFit.cover),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            backgroundColor: context.primaryColor,
            child: IconButton(
              icon: const Icon(Icons.edit, size: 18),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
