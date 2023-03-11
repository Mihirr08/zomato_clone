import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:zomato_ui/Constants/route_constants.dart";
import 'package:zomato_ui/Modules/Home_Page/food_listing_repo.dart';
import 'package:zomato_ui/baseWidgets/common_bloc/common_cubit.dart';
import 'package:zomato_ui/models/food_listing_model.dart';
import '../../baseWidgets/TopSearchField.dart';
import '../base_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CommonCubit _foodListingCubit =
  CommonCubit(commonRepo: FoodListingRepo());

  List<Products> products = [];

  @override
  void initState() {
    super.initState();
    _foodListingCubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.searchScreen);
              },
              child: Hero(
                  tag: "topSearchField",
                  child: Material(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TopSearchField(
                          showSetting: true,
                          isText: true,
                          leadingIcon: Icon(
                            Icons.search,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          )),
                    ),
                  )),
            ),
            Expanded(
              child: BlocBuilder(
                bloc: _foodListingCubit,
                builder: (context, state) {
                  if (state is CommonStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CommonStateSuccess) {
                    FoodListingModel foodListingModel = state.successData;

                    products = foodListingModel.products ?? [];

                    if (kDebugMode) {
                      print(
                          "Data is ${foodListingModel.products?.first.title}");
                    }
                  } else if (state is CommonStateError) {
                    return Center(child: ElevatedButton(child: Text("Retry"),
                        onPressed: () {
                          _foodListingCubit.fetchData();
                        }),);
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return BaseCard(discount: products[index]
                          .discountPercentage?.toStringAsFixed(2),
                        key: ValueKey(index),
                        index: index,
                        title: products[index].title,
                        imageName: products[index].images,
                      );
                    },
                    itemCount: products.length,
                  );
                },
              ),
            )
          ]),
        ));
  }
}
