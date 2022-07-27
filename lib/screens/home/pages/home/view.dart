import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../shared/items/item_section.dart';
import '../../../../shared/main_app_bar.dart';
import '../../../../shared/search_bar.dart';
import '../../../../shared/view_all.dart';
import 'components/header.dart';
import 'components/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: Column(
          children: [
            HomeHeader(),
            SectionsList(),
            SearchBar(),
            ViewAll(label: "Top Collages",),
            ViewAll(label: "Best selling",),
          ],
        ),
      ),
    );
  }
}
