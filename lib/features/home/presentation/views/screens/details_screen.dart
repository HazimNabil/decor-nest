import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_action_bar.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_details_header.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_thumbnail.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const path = '/details';

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductThumbnail(image: Assets.imagesLamp),
            SizedBox(height: 24),
            ProductDetailsHeader(),
            Spacer(),
            ProductActionBar(),
          ],
        ),
      ),
    );
  }
}
