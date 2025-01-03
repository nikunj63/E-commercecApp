import 'package:ecommerce_frontend/logic/cubits/product_cubits/product_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/product_cubits/product_state.dart';
import 'package:ecommerce_frontend/presentation/widgets/product_listView.dart';
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


        return ProductListView(products: state.products);
      }
    );
  }
}