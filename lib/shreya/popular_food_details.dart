import 'package:canteen_app/constants/big_text.dart';
import 'package:canteen_app/constants/colors.dart';
import 'package:canteen_app/constants/small_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/app_icons.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/paneer-butter.jpg"))),
              )),
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: 320,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: 20,
                      ),
                      SmallText(
                        text:
                            "Jeera rice or Zeera rice is an Indian dish consisting of rice and cumin seeds. It is a popular dish in North India and Pakistan as an everyday rice dish. It is easy to prepare. is the Indic word for cumin seeds, often pronounced Jeera. In Indian cuisine, dal are dried, split pulses that do not require soaking before cooking. India is the largest producer of pulses in the world. The term is also used for various soups prepared from these pulses.",
                        color: Colors.grey,
                      )
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: Container(
          height: 120,
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          decoration: BoxDecoration(
              color: Color.fromARGB(31, 145, 142, 142),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       padding:
          //           EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20), color: Colors.white),
          //       child: Row(
          //         children: [
          //           Icon(
          //             Icons.remove,
          //             color: Colors.black,
          //           ),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           BigText(text: "0"),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Icon(
          //             Icons.add,
          //             color: Colors.black,
          //           )
          //         ],
          //       ),
          // ),
          child: Center(
            child: Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.buttonBackgroundColor,
              ),
              child: BigText(
                text: "Rs120 | Add to cart",
                color: Colors.white,
                size: 18,
              ),
            ),
          )
          // ],
          ),
      //  ),
    );
  }
}
