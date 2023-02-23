//detail page layout
import 'package:canteen_app/constants/colors.dart';
import 'package:canteen_app/models/food.dart';
import 'package:canteen_app/screens/detail/widgets/food_detail.dart';
import 'package:canteen_app/screens/detail/widgets/food_image.dart';
import 'package:canteen_app/searchpanel/cart.dart';
import 'package:canteen_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPage extends StatelessWidget {
  final Food food;
  DetailPage(this.food);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              Icons.arrow_back,
              Icons.favorite,
              leftCallBack: () => Navigator.of(context).pop(),
            ),
            FoodImage(food),
            FoodDetail(food),
          ],
        ),
      ),
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
