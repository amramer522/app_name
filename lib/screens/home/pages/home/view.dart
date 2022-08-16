import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../shared/items/item_home_top_collages.dart';
import '../../../../shared/items/item_section.dart';
import '../../../../shared/main_app_bar.dart';
import '../../../../shared/search_bar.dart';
import '../../../../shared/view_all.dart';
import '../../../collages/view.dart';
import 'components/header.dart';
import 'components/sections.dart';
import 'components/top_collages_items_card.dart';
import 'components/top_collages_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HomeHeader(),
              SectionsList(),
              SearchBar(),
              ViewAll(label: "Top Collages",page: CollagesScreen(title: "Top Collages",)),
              HomeTopCollagesList(),
              TopCollagesItemsCard(),
              ViewAll(label: "Best selling",page: CollagesScreen(title: "Best Selling",)),
              HomeTopCollagesList(),
            ],
          ),
        ),
      ),
    );
  }
}
