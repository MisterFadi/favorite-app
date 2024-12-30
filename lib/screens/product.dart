import 'package:favorites_app/screens/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorites.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              size: 30,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          return ListView.builder(
            itemCount: favoritesProvider.products.length,
            itemBuilder: (context, index) {
              final product = favoritesProvider.products[index];
              return ListTile(
                title: Text(product.name),
                trailing: IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () => favoritesProvider.toggleFavorite(product.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
