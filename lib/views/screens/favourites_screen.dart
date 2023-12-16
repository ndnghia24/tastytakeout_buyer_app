import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  final title = 'Favourites'.obs;
}

class FavouritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavouritesController());
  }
}

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('FavouritesPage')),
      body: Center(
        child: Container(
          child: Text(Get.find<FavouritesController>().title.value),
        ),
      ),
    );
  }
}