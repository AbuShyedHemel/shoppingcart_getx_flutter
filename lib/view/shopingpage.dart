import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1st/controller/cartcontroller.dart';
import 'package:getx_1st/controller/shoppingController.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print("==>State are Running<==");
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName},',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                        '${controller.products[index].productDescription},',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to cart'),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text("Total Amount: \$${controller.totalPrice}",style: TextStyle(
                  fontSize: 24,fontWeight: FontWeight.bold
                ),);
              }
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: (){}
      ,
      backgroundColor: Colors.orangeAccent,
      icon: Icon(Icons.shopping_cart,color: Colors.black,),
      label: GetX<CartController>(
        builder: (controller) {
          return Text(controller.itemCounts.toString(),style: TextStyle(color: Colors.black),);
        }
      )),
    );
  }
}
