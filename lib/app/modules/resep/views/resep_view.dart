import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/data/models/recipe.dart';
import 'package:myapp/app/modules/resep/controllers/resep_controller.dart';
import 'package:myapp/app/modules/resep/widget/recipe_item.dart';

class RecipeView extends GetView<RecipeController> {
  const RecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe List"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.recipes.isEmpty) {
          return const Center(child: Text("No recipes found"));
        }

        return ListView.builder(
          itemCount: controller.recipes.length,
          itemBuilder: (context, index) {
            final recipe = controller.recipes[index];
            return RecipeItem(
              recipe: recipe,
              height: 250, // Sesuaikan ukuran jika diperlukan
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            );
          },
        );
      }),
    );
  }
}
