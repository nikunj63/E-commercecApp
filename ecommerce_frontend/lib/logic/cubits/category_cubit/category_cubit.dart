import 'package:ecommerce_frontend/Data/models/category/category_model.dart';
import 'package:ecommerce_frontend/Data/repositeries/category_repository.dart';
import 'package:ecommerce_frontend/logic/cubits/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
 CategoryCubit(): super( CategoryInitialState() ) {
  _initialize();
}
final _categoryRepository = CategoryRepository();


void _initialize() async {
emit( CategoryLoadingState (state.categories) );

try {
List<CategoryModel> categories = await _categoryRepository.
fetchAllCategories();
emit( CategoryLoadedState (categories) );
}

catch(ex) {
emit( CategoryErrorState (ex.toString(), state. categories) );
}
}
}