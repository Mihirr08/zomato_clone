

import 'package:zomato_ui/Modules/Home_Page/food_listing_provider.dart';
import 'package:zomato_ui/baseWidgets/common_bloc/common_repo.dart';
import 'package:zomato_ui/models/food_listing_model.dart';

class FoodListingRepo extends CommonRepo {
  @override
  fetchData({data})  async{
    try{
      var response = await FoodListingProvider().getFood();
      FoodListingModel model = FoodListingModel.fromJson(response);
      return model;
    }catch (e){
      throw Exception(e.toString());
    }
  }

}