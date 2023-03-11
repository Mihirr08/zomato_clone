
import 'package:dio/dio.dart';
import 'package:zomato_ui/services/dio_singleton.dart';

class FoodListingProvider {
  DioHelper dioHelper = DioHelper();

  getFood() async{
      Response response = await dioHelper.getMethod(baseUrl: "https://dummyjson.com", endPoint: "/products");
      return response.data;
  }

}