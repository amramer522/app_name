import '/../core/helper_methods.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../shared/main_app_bar.dart';
import '../../../../shared/search_bar.dart';
import '../../../../shared/view_all.dart';
import '../../../brand_proucts/view.dart';
import '../../../collages/view.dart';
import 'components/best_selling_list.dart';
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
            children:  [
              const HomeHeader(),
              SectionsList(),
              const SearchBar(),
              const ViewAll(label: "Top Collages",page: CollagesScreen(title: "Top Collages",withFilter: false,)),
              const HomeTopCollagesList(),
              TopCollagesItemsCard(title: "Special Offers",onPress: () {
                navigateTo(page: const BrandProductScreen(title: 'Offers',));
              },numberOfItems: 10),
              const ViewAll(label: "Best selling",page: BrandProductScreen(title: "Best Selling",)),
              const HomeBestSellingList(),
            ],
          ),
        ),
      ),
    );
  }
}
