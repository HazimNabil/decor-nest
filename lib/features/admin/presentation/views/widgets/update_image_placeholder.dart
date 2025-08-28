import 'dart:io' show File;

import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/admin/data/models/product_input_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateImagePlaceholder extends StatefulWidget {
  final String? imageUrl;
  final ProductInputData productInputData;

  const UpdateImagePlaceholder({
    super.key,
    required this.imageUrl,
    required this.productInputData,
  });

  @override
  State<UpdateImagePlaceholder> createState() => _UpdateImagePlaceholderState();
}

class _UpdateImagePlaceholderState extends State<UpdateImagePlaceholder> {
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _file != null
              ? Image.file(_file!, fit: BoxFit.cover)
              : Image.network(widget.imageUrl!, fit: BoxFit.cover),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            backgroundColor: context.primaryColor,
            child: IconButton(
              icon: const Icon(Icons.edit, size: 18),
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
