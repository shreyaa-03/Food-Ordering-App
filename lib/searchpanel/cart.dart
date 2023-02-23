import 'package:canteen_app/searchpanel/OnePageForAllCat.dart';
import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

String sum = "";
// var total=pricesOnCart.reduce((value, element) => value+element);
var total;

// List<int> listforcart=pricesOnCart;
class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 177, 165, 215),
      appBar: AppBar(
        title: Text(
            style: TextStyle(
                color: Color.fromARGB(255, 110, 25, 91), fontSize: 25),
            'Cart!'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 165, 215),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (namesOnCart.length == 0) ...{
            Center(
                child: Text(
              style: TextStyle(fontSize: 25),
              'there are no items in the cart!!',
              textAlign: TextAlign.center,
            ))
          } else ...{
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                      height: 320,
                      // width: 320,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 81, 77, 94),
                              blurRadius: 10,
                              spreadRadius: 8,
                            ),
                          ],
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 179, 168, 215),
                            Color.fromARGB(255, 179, 168, 215)
                          ])),
                      child: Expanded(
                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: namesOnCart.length,
                            itemBuilder: (context, index) => ListTile(
                              leading: Text(
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                namesOnCart[index].toString(),
                                textAlign: TextAlign.left,
                              ),
                              title: Text(
                                style: TextStyle(fontSize: 20),
                                pricesOnCart[index].toString(),
                                // priceforcat.toString(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 81, 77, 94),
                                  blurRadius: 10,
                                  spreadRadius: 6,
                                )
                              ],
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 179, 168, 215),
                                Color.fromARGB(255, 179, 168, 215)
                              ])),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    ),
                                child: Text(
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                    'Price'),
                              ),
                              Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    ),
                                child: Text(
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                  sum = total = pricesOnCart
                                      .reduce(
                                          (value, element) => value + element)
                                      .toString(),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          }
        ],
      ),
    );
  }
}
