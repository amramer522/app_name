import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../shared/second_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: "Categories List"),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: Center(child: Text("Categories List"),),
      ),
    );
  }
}
