//describes how the food item will appear in the home
//can edit the appearence of food image,
import 'package:canteen_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FoodItem extends StatelessWidget {
  final food;
  FoodItem(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              //foodImage looks
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.all(5),
              width: 110,
              height: 110,
              child: Image.asset(
                food.imageurl,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              //other details like name desc and cost
              child: Container(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          //foodname
                          food.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                        ),
                        Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 15,
                        ),
                      ],
                    ),
                    Text(
                      //food description
                      food.desc,
                      style: TextStyle(
                        color:
                            food.highlight ? AppColors.kPrimary : Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      //food price
                      children: [
                        Text(
                          'RS',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${food.price}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
