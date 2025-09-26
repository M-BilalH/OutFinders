import 'package:flutter/material.dart';
import 'package:outfinders/home_widget/product_card.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: SafeArea(child: GridView.count(crossAxisCount: 2,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(),
        ),
      ],
      )),
    );
  }
}