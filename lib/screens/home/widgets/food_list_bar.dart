// used to disaplay categories like rcommened and popular
import 'package:canteen_app/constants/colors.dart';
import 'package:canteen_app/models/submenu.dart';
import 'package:canteen_app/screens/home/widgets/sub_menu_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FoodListBar extends StatelessWidget {
  final int selected;
  final Function callback;
  final SubMenu subMenu;
  FoodListBar(this.selected, this.callback, this.subMenu);

  @override
  Widget build(BuildContext context) {
    //takes items from SubMenu/menu and adds them to category
    final category = subMenu.menu.keys.toList();
    return Container(
      //container representing each menu item
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 25),
          //item builder return container as described in foodListView
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => callback(index),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selected == index
                        ? AppColors.kPrimary
                        : AppColors.kBackground,
                  ),
                  child: Text(
                    category[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(
                width: 20,
              ),
          itemCount: category.length),
    );
  }
}
