import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../shared/second_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: "My Cart"),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: Center(child: Text("My Cart"),),
      ),
    );
  }
}
