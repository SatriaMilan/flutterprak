import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/data/models/recipe.dart';
import 'package:myapp/app/routes/app_pages.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
    this.showDetail = true,
    this.height,
    this.width,
    this.margin,
  });

  final Result recipe; // Menggunakan model Result dari API resep
  final bool showDetail;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke detail page atau action lain
        Get.toNamed(Routes.DETAIL_PAGE,
            arguments: recipe); // Misal navigasi ke detail page
      },
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height != null ? height! * 0.5 : 200,
              width: width,
              child: Stack(
                children: [
                  Container(
                    height: height != null ? height! * 0.5 : 200,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            recipe.image), // Mengambil gambar dari API
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        CupertinoIcons.bookmark,
                        size: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )),
                      child: Text(
                        recipe.title, // Menggunakan title dari API
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showDetail) ...[
              Text(
                recipe.title, // Menampilkan title dari resep
                style: Theme.of(context).textTheme.bodySmall,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "ID: ${recipe.id}", // Menampilkan ID resep dari API
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
