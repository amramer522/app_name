import 'package:app_name/fake_data/fake_data.dart';
import 'package:app_name/shared/items/item_brand_photo.dart';
import 'package:flutter/material.dart';

import '../../core/styles/styles.dart';
import '../../shared/second_app_bar.dart';

class BrandPhotosScreen extends StatelessWidget {
  const BrandPhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "Brand Photos",haveAction: true),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
            itemBuilder: (context, index) => ItemBrandPhoto(index: index),
            itemCount: fakeBrandPhotosDetails.length),
      ),
    );
  }
}
