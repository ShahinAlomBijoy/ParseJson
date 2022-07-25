import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('https://blazorapi.creativeartstechnologies.com/api/Product'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Product> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

class Product{
  final int id;
  final String name;
  final String description;
  final String imageURL;
  final int price;
  final int qty;
  final int categoryId;
  final String categoryName;


  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.price,
    required this.qty,
    required this.categoryId,
    required this.categoryName
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,

      imageURL: json['imageURL'] as String,
      price: json['price'] as int,
      qty: json['qty'] as int,
      categoryId: json['categoryId'] as int,

      categoryName: json['categoryName'] as String,
    );
  }

}
