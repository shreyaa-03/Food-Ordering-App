//home page describes the looks and postion of the widgets present
//widgets pressent are
// customAppBar,subMenuInfo,foodListBar,FooflistView,cart floating button
import 'package:canteen_app/constants/colors.dart';
import 'package:canteen_app/models/submenu.dart';
import 'package:canteen_app/screens/home/widgets/food_list_bar.dart';
import 'package:canteen_app/screens/home/widgets/food_list_view.dart';
import 'package:canteen_app/screens/home/widgets/sub_menu_info.dart';
import 'package:canteen_app/shreya/food/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../../../searchpanel/cart.dart';
import '../../../widgets/custom_app_bar.dart';

class SubMenuHomePage extends StatefulWidget {
  const SubMenuHomePage({super.key});

  @override
  State<SubMenuHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<SubMenuHomePage> {
  var selected = 0;
  final subMenu = SubMenu.generatesSubMenu();
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //customAppBar
          CustomAppBar(
            Icons.arrow_back_ios_new_outlined,
            Icons.favorite,
          ),
          //subMenuInfo
          //food list bar
          SubMenuInfo(),
          FoodListBar(selected, (int index) {
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }, subMenu),
          Expanded(
            //FoodListview
            child: FoodListView(
              selected,
              (int index) {
                setState(() {
                  selected = index;
                });
              },
              pageController,
              subMenu,
            ),
          ),
        ],
      ),
      //cart floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => cart()));
        },
        backgroundColor: AppColors.kPrimary,
        elevation: 2,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
