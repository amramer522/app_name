import 'package:app_name/fake_data/fake_data.dart';
import 'package:app_name/shared/items/item_brand_photo.dart';
import 'package:flutter/material.dart';

import '../../core/styles/styles.dart';
import '../../shared/items/item_brand_collage.dart';
import '../../shared/second_app_bar.dart';

class CollagesScreen extends StatelessWidget {
  final bool isBrand;
  const CollagesScreen({Key? key, this.isBrand = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: isBrand?"Brand Collages":"Collages"),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
            itemBuilder: (context, index) => ItemBrandCollage(index: index),
            itemCount: fakeBrandCollagesDetails.length),
      ),
    );
  }
}
