//whenever a dish is clicked from search

import 'package:canteen_app/searchpanel/OnePageForAllCat.dart';
import 'package:canteen_app/searchpanel/searchPanel.dart';
import 'package:flutter/material.dart';

class OnePageForAll extends StatefulWidget {
  const OnePageForAll({super.key});

  @override
  State<OnePageForAll> createState() => _OnePageForAllState();
}

class _OnePageForAllState extends State<OnePageForAll> {
  var firstpresssearch = 0;
  int firstpressforqtysearch = 1;
  double xsearch = double.parse(priceforcat);

  void increment() {
    setState(() {
      firstpressforqtysearch++;
      xsearch = double.parse(priceforcat) * firstpressforqtysearch;
    });
  }

  void decrement() {
    setState(() {
      firstpressforqtysearch--;
      xsearch = double.parse(priceforcat) * firstpressforqtysearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // var v=dishes
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 177, 165, 215),
      appBar: AppBar(
        title: Text(
          name,
          style:
              TextStyle(color: Color.fromARGB(255, 110, 25, 91), fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 165, 215),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 230,
                    width: 330,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 40,
                        width: 165,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                            style: TextStyle(
                              fontSize: 30,
                            ),
                            'Price'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 40,
                        width: 165,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          style: TextStyle(
                            fontSize: 30,
                          ),
                          price,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        height: 50,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 177, 149, 194),
                          // border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                            onPressed: () {
                              firstpresssearch++;
                              if (firstpresssearch % 2 != 0) {
                                namesOnCart.add(nameforcat);
                                pricesOnCart.add(xsearch);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("item added to cart"),
                                ));
                              }
                              if (firstpresssearch > 0 &&
                                  firstpresssearch % 2 == 0) {
                                namesOnCart.remove(nameforcat);
                                pricesOnCart.remove(int.parse(priceforcat));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("item removed from to cart"),
                                ));
                              }
                            },
                            child: Text(
                                style: TextStyle(
                                  color: Color.fromARGB(255, 110, 25, 91),
                                  fontSize: 17,
                                ),
                                'add to cart')),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 19),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            height: 50,
                            width: 110,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.black),
                              color: Color.fromARGB(255, 177, 149, 194),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 191, 164, 207),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        if (firstpressforqtysearch > 1) {
                                          decrement();
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.only(right: 0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      child: Icon(
                                          size: 20,
                                          color:
                                              Color.fromARGB(255, 110, 25, 91),
                                          Icons.remove)),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 191, 164, 207),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.only(right: 0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    child: Text(
                                      firstpressforqtysearch.toString(),
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 110, 25, 91),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 191, 164, 207),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        increment();
                                      },
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.only(right: 0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      child: Icon(
                                          size: 20,
                                          color:
                                              Color.fromARGB(255, 110, 25, 91),
                                          Icons.add)),
                                ),
                              ],
                            ),
                          ),
                          Text(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 110, 25, 91),
                                  fontSize: 20),
                              'quantity'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
