import 'package:ecommerce_frontend/Data/models/category/category_model.dart';
import 'package:ecommerce_frontend/Data/models/products/product_model.dart';
import 'package:ecommerce_frontend/logic/cubits/category_product_cubit/category_product_cubit.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/sign_up_provider.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/sign_up_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/home/home_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/products/category_product_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/products/products_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Routes{
  static Route ? onGenerateRoute(RouteSettings settings){
    switch(settings.name){

      case LoginScreen.routeName: return CupertinoPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => LoginProvider(context),
          child: const LoginScreen())
        );

        case SignUpScreen.routeName: return CupertinoPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => SignUpProvider(context),
          child: const SignUpScreen())
        );

        case HomeScreen.routeName: return CupertinoPageRoute(
          builder: (context) => HomeScreen(),
          );

        case SplashScreen.routeName: return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
          );

        case ProductsDetailScreen.routeName: return CupertinoPageRoute(
          builder: (context) =>  ProductsDetailScreen(
            productModel: settings.arguments as ProductModel,
          ),
          );

          case CartScreen.routeName: return CupertinoPageRoute(
          builder: (context) =>  const CartScreen(),
          );

          case CategoryProductScreen.routeName: return CupertinoPageRoute(
          builder: (context) =>  BlocProvider(
            create: (context) => CategoryProductCubit(settings.arguments as
             CategoryModel),
            child: const CategoryProductScreen()),
          );


        default: return null;


    }
  }
}