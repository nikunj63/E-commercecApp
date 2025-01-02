import 'package:ecommerce_frontend/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_frontend/presentation/screens/home/category_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/home/profile_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/home/user_feed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubits/cart_cubit/cart_state.dart';
import '../cart/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "home" ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  List<Widget>  screens = const [
    UserFeedScreen(),
    CategoryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-commerce App"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, CartScreen.routeName);
            },
             icon:  BlocBuilder<CartCubit , CartState>(
               builder: (context, state) {
                 return Badge(
                  label: Text("${state.items.length}"),
                  isLabelVisible: (state is CartLoadingState) ? false:true,
                  child: const Icon(CupertinoIcons.cart_fill));
               }
             ),
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ]
      ),
    );
  }
}