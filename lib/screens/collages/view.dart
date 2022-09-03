import 'package:app_name/fake_data/fake_data.dart';
import 'package:flutter/material.dart';

import '../../shared/items/item_brand_collage.dart';
import '../../shared/second_app_bar.dart';

class CollagesScreen extends StatelessWidget {
  final String title;
  final bool withFilter;
  const CollagesScreen({Key? key,required this.title,required this.withFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: title,isFilter: withFilter,haveAction: withFilter),
      body: SizedBox(
        width: double.infinity,
        child: ListView.separated(
            itemBuilder: (context, index) => ItemBrandCollage(index: index),
            separatorBuilder: (context, index) =>  const Divider(
              thickness: 6,
              color: Color(0xffEEEEEE),
            ),
            itemCount: fakeBrandCollagesDetails.length),
      ),
    );
  }
}
