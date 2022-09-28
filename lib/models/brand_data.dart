import 'package:flutter/material.dart';

class Brand {
  final String title;
  final String image;
  final Color color;
  Brand({
    required this.title,
    required this.image,
    required this.color,
  });
}

List<Brand> BRAND_DATA = [
  Brand(
    title: 'Tecno',
    image: '',
    color: Colors.amber,
  ),
  Brand(
    title: 'Samsung',
    image: '',
    color: Colors.red,
  ),
  Brand(
    title: 'Dior',
    image: '',
    color: Colors.blue,
  ),
  Brand(
    title: 'Gucci',
    image: '',
    color: Colors.green,
  ),
  Brand(
    title: 'Valentino',
    image: '',
    color: Colors.yellow,
  ),
  Brand(
    title: 'Itel',
    image: '',
    color: Colors.orange,
  ),
  Brand(
    title: 'Windows',
    image: '',
    color: Colors.amber,
  ),
  Brand(
    title: 'Tecno',
    image: '',
    color: Colors.teal,
  ),
];
