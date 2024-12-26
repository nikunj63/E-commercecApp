import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../../core/ui.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

 static const routeName = "cart" ;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:5 ,
                itemBuilder: (context,index){
                  return ListTile(
                    // leading
                  title: Text("Product Name"),
                  subtitle: Text("price x quantity = total"),
                  trailing: InputQty(
                    minVal: 1,
                    initVal: 2, // product initial quantity
                    maxVal: 99,
                    onQtyChanged: (value){},
                  ),
                  );
                },
              
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
              
                        Text("5 items",style: TextStyles.body1.
                        copyWith(fontWeight: FontWeight.bold),),
                        Text("Total: 99895",style: TextStyles.heading3)
                      ],
                    )
                    ),
              
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2.5,
                      child: CupertinoButton(
                        onPressed: (){},
                        padding:  EdgeInsets.all(MediaQuery.of(context).
                        size.width/22),
                        color: AppColors.accent,
                        child: const Text("Place Order", style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
        ),
    );
  }
}