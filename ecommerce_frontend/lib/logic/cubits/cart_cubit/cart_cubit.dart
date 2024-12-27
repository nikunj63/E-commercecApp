
import 'dart:async';

import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_state.dart';

import '../../../Data/repositeries/cart_repository.dart';
import '../user_cubit/user_cubit.dart';
import 'cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final UserCubit _userCubit;
  StreamSubscription? _userSubscription;

  CartCubit (this._userCubit) : super( CartInitialState() ) {
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
        emit(CartInitialState());
      }
  }

  final _cartRepository = CartRepository();
  void _initialize(String userId) async {
    emit( CartLoadingState(state.items) );
    try {
        final items = await _cartRepository.fetchCartForUser(userId);
         emit( CartLoadedState (items) );
    }
    catch(ex) {
    emit( CartErrorState (ex.toString(), state.items) );
      }
    }

    @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}