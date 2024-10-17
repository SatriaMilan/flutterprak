import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.spoonacular.com/recipes';
  final String _apiKey = '929dd4a45e7a4252898a2398db071708';

  Future<List<dynamic>> fetchRecipes({int number = 10}) async {
    final url = Uri.parse('$_baseUrl/complexSearch?apiKey=$_apiKey&number=$number');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['results']; // Mengembalikan daftar hasil resep
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Error fetching recipes: $e');
    }
  }
}
