import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: false,
      title: const Row(
        children: [
          AvatarWidget(
            imageUrl: 'public/images/pizza.png', // Left Avatar image
            isLeft: true,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          SizedBox(width: 10),
            
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DELIVER TO',
                style: TextStyle(
                  color: Color(0xFFFC6E2A),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Halal lab office',
                style: TextStyle(
                  color: Color(0xFF676767),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: const [
        AvatarWidget(
          imageUrl: 'public/images/pizza.png', // Right Avatar image
          isLeft: false,
          backgroundColor: Color(0xFF181C2E),
        ),
      ],
    ),
    backgroundColor: Colors.white, // Tambahkan ini untuk background putih
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Hey Halal, ',
                  style: TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: 'Good Afternoon!',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildSearchBar(context),
          const SizedBox(height: 20),
          const Text('All Categories', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          _buildCategoryList(),
          const SizedBox(height: 20),
          const Text('Open Restaurants', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          _buildRestaurantGrid(),
        ],
      ),
    ),
  );
}


  Widget _buildSearchBar(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(SearchPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Row(
          children: [
            Icon(Icons.search, color: Color(0xFF676767)),
            SizedBox(width: 10),
            Text(
              'Search dishes, restaurants',
              style: TextStyle(color: Color(0xFF676767)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryCard(
            label: 'Gudeg',
            imageUrl: 'public/images/pizza.png', // Gudeg image
            onTap: () {
              print('Gudeg button tapped');
            },
          ),
          CategoryCard(
            label: 'Hot Dog',
            imageUrl: 'public/images/pizza.png', // Hot Dog image
            onTap: () {
              print('Hot Dog button tapped');
            },
          ),
          CategoryCard(
            label: 'Burger',
            imageUrl: 'public/images/pizza.png', // Burger image
            onTap: () {
              print('Burger button tapped');
            },
          ),
          CategoryCard(
            label: 'Pizza',
            imageUrl: 'public/images/pizza.png', // Pizza image
            onTap: () {
              print('Pizza button tapped');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantGrid() {
    return GridView.count(
      crossAxisCount: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        RestaurantCard(
          name: 'Restaurant 1',
          imageUrl: 'public/images/rest1.jpg', 
        ),
        RestaurantCard(
          name: 'Restaurant 2',
            imageUrl: 'public/images/rest2.jpg', // Pizza image
        ),
        RestaurantCard(
          name: 'Restaurant 3',
            imageUrl: 'public/images/rest3.jpg', // Pizza image
        ),
        RestaurantCard(
          name: 'Restaurant 4',
          imageUrl: 'public/images/rest4.png', // Restaurant 4 image
        ),
        RestaurantCard(
          name: 'Restaurant 5',
          imageUrl: 'public/images/rest5.jpg', // Restaurant 5 image
        ),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final bool isLeft;
  final Color backgroundColor;

  const AvatarWidget({
    Key? key,
    required this.imageUrl,
    required this.isLeft,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isLeft ? 10.0 : 0,
        right: isLeft ? 0 : 10.0,
      ),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        backgroundImage:
            AssetImage(imageUrl), // Use AssetImage for local assets
        radius: 20.0,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final String imageUrl;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.label,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage(imageUrl), // Use AssetImage for local assets
              radius: 20.0,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const RestaurantCard({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 20, // Ukuran tinggi dikurangi dari 225 ke 180
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl, // Gunakan Image.asset untuk aset lokal
                height: 120, // Ukuran gambar juga diperkecil
                width: 327,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Text(
                name,
                style: const TextStyle(fontSize: 18), // Ukuran teks sedikit diperkecil
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background to white
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.black), // Set title color to black for contrast
        ),
        backgroundColor: Colors.white, // Set the AppBar background to white
        iconTheme: const IconThemeData(color: Colors.black), // Set icon color to black
        actions: const [
          AvatarWidget(
            imageUrl: 'public/images/pizza.png', // Avatar image
            isLeft: false,
            backgroundColor: Color(0xFF181C2E),
          ),
          SizedBox(width: 10), // Space between avatar and right edge
        ],
        elevation: 0, // Remove the AppBar shadow for a clean look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Search bar with avatar button
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Color(0xFF676767)),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search dishes, restaurants',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: Color(0xFF676767)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Space between search bar and avatar
                AvatarWidget(
                  imageUrl: 'public/images/pizza.png', // Avatar image
                  isLeft: false,
                  backgroundColor: Color(0xFF181C2E),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Placeholder text or other content
            const Center(
              child: Text('This is the search page content'),
            ),
          ],
        ),
      ),
    );
  }
}
