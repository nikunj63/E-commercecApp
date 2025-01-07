import 'dart:async';

import 'package:ecommerce_frontend/Data/models/cart/cart_item_model.dart';
import 'package:ecommerce_frontend/Data/models/order/orderModel.dart';
import 'package:ecommerce_frontend/Data/repositeries/order_repository.dart';
import 'package:ecommerce_frontend/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/order_cubit/order_state.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  final UserCubit _userCubit;
  final CartCubit _cartCubit;
  StreamSubscription? _userSubscription;
  
  OrderCubit(this._userCubit, this._cartCubit):super(OrderInitialState()){
    // initial value
    _handleUserState(_userCubit.state);

    // Listening to userCubit (for future updates)
    _userSubscription =_userCubit.stream.listen(_handleUserState);
  }

  void _handleUserState(UserState userState){
    if(userState is UserLoggedInState){
        _initialize(userState.userModel.sId!);
      }
      else if(userState is UserLoggedOutState){
        emit(OrderInitialState());
      }
  }

  final _orderRepository = OrderRepository();

  void _initialize(String userId)async{
    emit(OrderLoadingState(state.orders));
    try {
      final orders = await _orderRepository.fetchOrdersForUser(userId);
      emit(OrderLoadedState(orders));
      
    } catch (ex) {
      emit(OrderErrorState(ex.toString(), state.orders));
    }
  }

  Future<bool> createOrder({
    required List<CartItemModel> items,
    required String paymentMethod,
  })async{
    emit(OrderLoadingState(state.orders));
    try {

      if (_userCubit.state is! UserLoggedInState ) {
        return false;
      }

      OrderModel newOrder = OrderModel(
        items: items,
        user: (_userCubit.state as UserLoggedInState).userModel,
        status: (paymentMethod == "pay-on-delivery") ? "Order-placed" : 
        "payment-pending"
      );
      final order = await _orderRepository.createOrder(newOrder);

      List<OrderModel> orders = [order, ...state.orders ];

      emit(OrderLoadedState(orders));

      // clear the cart
      _cartCubit.ClearCart();

      return true;
      
    } catch (ex) {
      emit(OrderErrorState(ex.toString(), state.orders));
      return false;
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

}