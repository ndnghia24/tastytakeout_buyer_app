import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/DTO/FoodModel.dart';
import '../../helper/format_helper.dart' as formatHelper;

class FoodItemWidget extends StatelessWidget {
  final FoodModel food;

  FoodItemWidget({
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    String imageUrl = food.imageUrls.isNotEmpty
        ? food.imageUrls[0]
        : 'https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg';
    String name = food.name;
    String quantityText = ' X' + food.quantity.toString();
    String cost = formatHelper.formatMoney(food.price);

    return GestureDetector(
      child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: Colors.green[100],
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black, // Adjust color as needed
                                ),
                              ),
                              TextSpan(
                                text: quantityText, // Display quantity here
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.green, // Adjust color as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          cost, // Display cost here
                          style: TextStyle(
                            color: Colors.black87, // Adjust color as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right side with an image
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
