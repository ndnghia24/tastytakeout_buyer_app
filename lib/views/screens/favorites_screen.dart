import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastytakeout_user_app/view_models/FavoritesScreenViewModel.dart';
import 'package:tastytakeout_user_app/views/screens/food_detail_screen.dart';

// import 'package:tastytakeout_user_app/views/screens/food_details_screen.dart';
import 'package:tastytakeout_user_app/views/widgets/custom_app_bar.dart';
import 'package:tastytakeout_user_app/views/widgets/item_food_extra.dart';

import '../widgets/custom_drawer.dart';

class FavoritesScreenBinding extends Bindings {
  @override
  void dependencies() {}
}

class FavoritesScreen extends StatelessWidget {
  final FavoritesScreenViewModel _viewModel =
      Get.put(FavoritesScreenViewModel());

  @override
  Widget build(BuildContext context) {
    _viewModel.fetchFavoriteFood();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Yêu thích',
        // Add necessary onPressed callbacks for the app bar icons
      ), // Replace with your custom app bar implementation
      drawer: CustomDrawer(),
      body: Obx(() {
        if (_viewModel.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: _viewModel.foodList.value.length,
            itemBuilder: (context, index) {
              final food = _viewModel.foodList.value[index];
              return InkWell(
                onTap: () {
                  Get.to(FoodDetailScreen());
                },
                child: FoodCard(
                  foodName: food.name,
                  // description: food.description,
                  imagePath: food.imageUrls[0],
                  price: food.price.toString(),
                  shopName: food.shopName,
                  // Pass shopName to FoodCard
                  onTap: () {
                    print("Tapped on ${food.name}");
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
