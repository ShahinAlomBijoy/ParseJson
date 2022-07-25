import 'package:flutter/cupertino.dart';
import 'package:parsejson/photo.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.product});

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: product.length,
      itemBuilder: (context, index) {
        return Image.network(product[index].imageURL);
      },
    );
  }
}