import 'package:ecommerce_frontend/Data/models/user/user_model.dart';
import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/cart_cubit/cart_state.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_state.dart';
import 'package:ecommerce_frontend/presentation/screens/user/edit_profile_screen.dart';
import 'package:ecommerce_frontend/presentation/widgets/cart_list_view.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:ecommerce_frontend/presentation/widgets/link_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  static const routeName = "order_detail";

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Order"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            BlocBuilder<UserCubit,UserState>(
              builder: (context , state){

                if (state is UserLoadingState) {
                  return const CircularProgressIndicator();
                }

                if (state is UserLoggedInState) {
                  UserModel user = state.userModel;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Details", style:TextStyles.body2.copyWith(fontWeight: FontWeight.bold)),
                      const GapWidget(),
                      Text("${user.fullName}", style: TextStyles.heading3),
                      Text("Email: ${user.email}", style: TextStyles.body2,),
                      Text("Phone: ${user.phoneNumber}", style: TextStyles.body2,),
                      Text("Address: ${user.address}, ${user.city}, ${user.state},", style: TextStyles.body2,),

                      LinkButton(
                        onPressed: (){
                          Navigator.pushNamed(context, EditProfileScreen.routeName);
                        },
                        text: "Edit Profile",
                        )
                    ],
                  );
                }

                if (state is UserErrorState) {
                  return Text(state.message);
                }

                return const SizedBox();

              }
            ),

            const GapWidget(size: 10,),
            Text("Items", style:TextStyles.body2.copyWith(
              fontWeight: FontWeight.bold)),
              const GapWidget(),



            BlocBuilder<CartCubit,CartState>(
              builder: (context , state){
                if (state is CartLoadingState && state.items.isEmpty) {
                  return const CircularProgressIndicator();
                }

                if (state is CartErrorState && state.items.isEmpty) {
                  return Text(state.message);
                }

                return CartListView(
                  items: state.items,
                  shrinkwrap: true,
                  noScroll: true,
                  );
              },
            ),

            const GapWidget(size: 10,),
            Text("Payment", style:TextStyles.body2.copyWith(
              fontWeight: FontWeight.bold)),

              RadioListTile(
                value: "pay-on-Delivery", 
                groupValue: "var" ,
                contentPadding: EdgeInsets.zero,
                onChanged: (value){},
                title:const  Text("Pay on Deliver"),
                ),

                RadioListTile(
                value: "pay-now", 
                groupValue: "var", 
                 contentPadding: EdgeInsets.zero,
                onChanged: (value){},
                title: const Text("Pay Now"),
                ),


          ],
        )
      ),
    );
  }
}