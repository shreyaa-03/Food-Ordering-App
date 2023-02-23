// used to navigate between recommended and popular
import 'package:canteen_app/models/food.dart';
import 'package:canteen_app/models/submenu.dart';
import 'package:canteen_app/screens/detail/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'sub_menu_info.dart';
import 'food_item.dart';

class FoodListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final SubMenu subMenu;

  FoodListView(this.selected, this.callback, this.pageController, this.subMenu);

  @override
  Widget build(BuildContext context) {
    final category = subMenu.menu.keys.toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: category
            .map((e) => ListView.separated(
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              subMenu.menu[category[selected]]![index],
                            ),
                          ),
                        );
                      },
                      child: FoodItem(
                        subMenu.menu[category[selected]]![index],
                      ),
                    ),
                separatorBuilder: (_, index) => SizedBox(height: 15),
                itemCount: subMenu.menu[category[selected]]!.length))
            .toList(),
      ),
    );
  }
}
