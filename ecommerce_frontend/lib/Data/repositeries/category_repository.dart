
import 'package:dio/dio.dart';
import 'package:ecommerce_frontend/Data/models/category/category_model.dart';
import 'package:ecommerce_frontend/core/api.dart';

class CategoryRepository {

  final _api = Api();

  Future<List<CategoryModel>> fetchAllCategories() async{
    try {

      Response response = await _api.sendRequest.get("/category");

        ApiResponse apiResponse = ApiResponse.fromResponse(response);

        if(!apiResponse.sucess){
          throw apiResponse.message.toString();
        }
        return(apiResponse.data as List<dynamic>).map((json) => 
        CategoryModel.fromJson(json)).toList();
        

    } catch (ex) {
      rethrow;
    }
  }
  

}