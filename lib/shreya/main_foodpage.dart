import 'package:canteen_app/searchpanel/cart.dart';
import 'package:canteen_app/searchpanel/searchPanel.dart';
import 'package:flutter/material.dart';
import '../constants/big_text.dart';
import '../constants/colors.dart';
import '../constants/small_text.dart';
import '../login/login.dart';
import '../login/register.dart';
import 'foodpage_body.dart';
import '';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.buttonBackgroundColor),
                margin: EdgeInsets.only(top: 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyLogin()));
                  },
                  child: Icon(
                    Icons.person,
                    color: AppColors.iconColor1,
                  ),
                )),
          ],
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => searchPanel()));
            },
            child: Container(
              width: 45,
              height: 45,
              child: Icon(
                Icons.search,
                color: AppColors.iconColor1,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.buttonBackgroundColor),
            ),
          ),
        )
      ],
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 50, bottom: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: row,
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          ))

          // FoodPageBody(),
        ],
      ),
      //floatin cart on the buttom left
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
