
import 'package:dio/dio.dart';
import 'package:ecommerce_frontend/Data/models/products/product_model.dart';
import 'package:ecommerce_frontend/core/api.dart';

class ProductRepository {

  final _api = Api();

  Future<List<ProductModel>> fetchAllProducts() async{
    try {

      Response response = await _api.sendRequest.get("/product");

        ApiResponse apiResponse = ApiResponse.fromResponse(response);

        if(!apiResponse.sucess){
          throw apiResponse.message.toString();
        }
        return(apiResponse.data as List<dynamic>).map((json) => 
        ProductModel.fromJson(json)).toList();
        

    } catch (ex) {
      rethrow;
    }
  }



  Future<List<ProductModel>> fetchProductsByCategory(String categoryId) async{
    try {

      Response response = await _api.sendRequest.get("/product/category/$categoryId");

        ApiResponse apiResponse = ApiResponse.fromResponse(response);

        if(!apiResponse.sucess){
          throw apiResponse.message.toString();
        }
        return(apiResponse.data as List<dynamic>).map((json) => 
        ProductModel.fromJson(json)).toList();
        

    } catch (ex) {
      rethrow;
    }
  }
  

}