import 'dart:io' show File;

import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/admin/data/models/product_input_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImagePlaceholder extends StatefulWidget {
  final ProductInputData productInputData;

  const AddImagePlaceholder({super.key, required this.productInputData});

  @override
  State<AddImagePlaceholder> createState() => _AddImagePlaceholderState();
}

class _AddImagePlaceholderState extends State<AddImagePlaceholder> {
  File? _file;

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
              image: _file != null
                  ? DecorationImage(image: FileImage(_file!))
                  : null,
            ),
            width: double.infinity,
            child: _file != null ? null : const Icon(Icons.image, size: 60),
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
              onPressed: () async {
                final image = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  setState(() => _file = File(image.path));
                  widget.productInputData.image = _file;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
