//whenever a category is clicked

import 'package:canteen_app/searchpanel/searchPanel.dart';
import 'package:flutter/material.dart';

import 'OnePageForAllCat.dart';

class OnePageForAllCategories extends StatefulWidget {
  const OnePageForAllCategories({super.key});

  @override
  State<OnePageForAllCategories> createState() =>
      _OnePageForAllCategoriesState();
}

class _OnePageForAllCategoriesState extends State<OnePageForAllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 177, 165, 215),
      appBar: AppBar(
        title: Text(
          style:
              TextStyle(color: Color.fromARGB(255, 110, 25, 91), fontSize: 25),
          namesOfCategories,
          textAlign: TextAlign.right,
        ),
        // title: new Center(child: Text('Hot Items!'),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 165, 215),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: 40),
                    Container(
                      height: 320,
                      width: 320,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 81, 77, 94),
                              blurRadius: 10,
                              spreadRadius: 8,
                            )
                          ],
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 179, 168, 215),
                            Color.fromARGB(255, 179, 168, 215)
                          ])),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              // width: 240,
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black)
                                  ),
                              child: Text(
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.left,
                                  ' Names'),
                            ),
                            Container(
                              height: 40,
                              // width: 78,
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black)
                                  ),
                              child: Text(
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.right,
                                  'Prices'),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Scrollbar(
                            child: ListView.builder(
                              itemCount: dishesfordisplayCategory.length,
                              itemBuilder: (context, index) => ListTile(
                                leading: Text(
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  dishesfordisplayCategory[index].toString(),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  style: TextStyle(fontSize: 20),
                                  pricessfordisplayCategory[index].toString(),
                                  textAlign: TextAlign.right,
                                ),
                                onTap: () {
                                  nameforcat = dishesfordisplayCategory[index]
                                      .toString();
                                  priceforcat =
                                      pricessfordisplayCategory[index];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OnePageForAllCat()),
                                    // builder: (context) => detail()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
