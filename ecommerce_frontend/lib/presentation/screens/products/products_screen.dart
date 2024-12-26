import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_frontend/Data/models/products/product_model.dart';
import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/logic/srevices/formatter.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class ProductsDetailScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductsDetailScreen({
    super.key,
    required this.productModel,
    });

  static const routeName = "product_details";

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("${widget.productModel.title}"),
      ),
      body: SafeArea(
        child: ListView(
          children: [


            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder( 
                itemCount: widget.productModel.image?.length?? 0,
                slideBuilder: (index){

                  String url = widget.productModel.image![index];

                  return CachedNetworkImage(
                    imageUrl: url,
                    );

                  
                },
                ),
            ),

            const GapWidget(),

            Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget. productModel.title}",style: TextStyles.heading3,),
                  Text(Formatter.formatPrice(widget.productModel.price!),
                  style: TextStyles.heading2,),

                  const GapWidget(size: 10,),

                  PrimaryButton(
                    onPressed: (){},
                    text: "Add to Cart"
                    ),

                  const GapWidget(size:10),

                  Text("Description", style: TextStyles.body2.copyWith
                  (fontWeight: FontWeight.bold),),
                  Text("${widget.productModel.description}", 
                  style:TextStyles.body1,
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}