import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/logic/cubits/product_cubits/product_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/product_cubits/product_state.dart';
import 'package:ecommerce_frontend/logic/srevices/formatter.dart';
import 'package:ecommerce_frontend/presentation/screens/products/products_screen.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context , state) {

        if (state is ProductLoadingState && state.products.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProductErrorState && state.products.isEmpty) {
          return  Center(
            child: Text(state.message),
          );
        }


        return ListView.builder(
          itemCount: state.products.length ,
          itemBuilder: (context , index){

            final product = state.products[index];
        
            return CupertinoButton(
              onPressed: (){
                Navigator.pushNamed(context, ProductsDetailScreen.routeName,
                arguments:product,
                );
              },
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                      
                  CachedNetworkImage(
                    width: MediaQuery.of(context).size.width / 1.9,
                    imageUrl: "${product.image?[0]}"
                    
                    ),
                      
                    const SizedBox(width: 10,),
                      
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${product.title}", style: TextStyles.body1.copyWith
                          (fontWeight:FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          Text("${product.description}", style: TextStyles.body2.
                          copyWith(color:AppColors.textLight),maxLines: 2,
                           overflow: TextOverflow.ellipsis,),
                          const GapWidget(),
                          Text(Formatter.formatPrice(product.price!),style: TextStyles.heading3,),
                        ],
                      ),
                    ),
                    
                ],
              ),
            );
          }
          );
      }
    );
  }
}