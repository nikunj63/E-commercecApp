
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_state.dart';

import '../../../Data/repositeries/cart_repository.dart';
import '../user_cubit/user_cubit.dart';
import 'cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final UserCubit _userCubit;
  CartCubit (this._userCubit) : super( CartInitialState() ) {
    // Listening to userCubit
    _userCubit.stream.listen((state){
      if(state is UserLoggedInState){
        _initialize(state.userMdoel.sId!);
      }
    });
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
}