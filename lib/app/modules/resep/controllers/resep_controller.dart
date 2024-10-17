import 'package:get/get.dart';
import 'package:myapp/app/data/models/recipe.dart';
import 'package:myapp/app/data/services/recipe_controller.dart';

class RecipeController extends GetxController {
  var isLoading = true.obs;
  var recipes = <Result>[].obs; // List to hold Result objects
  final ApiService _apiService = ApiService(); // Instance of your ApiService

  @override
  void onInit() {
    fetchRecipes(); // Fetch recipes when controller is initialized
    super.onInit();
  }

  void fetchRecipes() async {
    try {
      isLoading(true);
      final response = await _apiService.fetchRecipes(); // Fetch from ApiService
      recipes.value = (response as List).map((json) => Result.fromJson(json)).toList(); // Map to Result
    } catch (e) {
      // Handle any errors here
      print("Error fetching recipes: $e");
    } finally {
      isLoading(false);
    }
  }
}
