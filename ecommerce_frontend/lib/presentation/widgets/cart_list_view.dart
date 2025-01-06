import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_frontend/Data/models/cart/cart_item_model.dart';
import 'package:ecommerce_frontend/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_frontend/logic/srevices/formatter.dart';
import 'package:ecommerce_frontend/presentation/widgets/link_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

class CartListView extends StatelessWidget {
  final List<CartItemModel> items;
  final bool shrinkwrap;
  final bool noScroll;
  const CartListView({
    super.key,
    required this.items,
    this.shrinkwrap = false,
    this.noScroll = false,
    });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: (noScroll)? const NeverScrollableScrollPhysics(): null,
      shrinkWrap: shrinkwrap,
                    itemCount:items.length ,
                    itemBuilder: (context,index){

                      final item = items[index];


                      return ListTile(
                       leading: CachedNetworkImage(
                        imageUrl: item.product!.image![0]
                        ),
                      title: Text("${item.product?.title}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${Formatter.formatPrice(item.product!.price!)}x ${
                            item.quantity!} = ${Formatter.formatPrice(item.product!.price! * item.quantity!)}"),

                            LinkButton(
                              onPressed: (){
                                BlocProvider.of<CartCubit>(context).removeFromCart(
                                  item.product!
                                );
                              },
                              text:"Delete",
                              color: Colors.red,
                              )
                        ],
                      ),
                      trailing: InputQty(
                        maxVal: 99,
                        initVal: item.quantity!, // product initial quantity
                        minVal: 1,
                        onQtyChanged: (value){
                          BlocProvider.of<CartCubit>(context).addToCart(
                            item.product!, value.toInt());
                        },
                      ),
                      );
                    },
                  
                );
  }
}