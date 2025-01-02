import '../../../Data/models/products/product_model.dart';

abstract class CategoryProductState {
  final List<ProductModel> products;
  CategoryProductState(this.products);
}

class CategoryProductInitialState extends CategoryProductstate {
  CategoryProductInitialState() : super([]);
}

class CategoryProductLoadingState  extends CategoryProductState{
  CategoryProductLoadingState(super.products);
}

class CategoryProductLoadedState  extends CategoryProductState{
  CategoryProductLoadedState(super.products);
}

class CategoryProductErrorState  extends CategoryProductState{
  final String  message;
  CategoryProductErrorState(this.message,super.products);
}