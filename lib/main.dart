import 'package:flutter/material.dart';
import 'package:product_card/product_card.dart';
import 'package:product_card/product_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Consumer<ProductState>(
                builder: (context, productState, _) => ProductCard(
                  imageUrl:
                      "https://cdn-prod.medicalnewstoday.com/content/images/articles/308/308796/mixed-fruits.jpg",
                  name: "Buah-buahan Mix 1 kg",
                  price: "Rp 25.000",
                  quantity: productState.quantity,
                  notification:
                      (productState.quantity > 5) ? "Diskon 100%" : null,
                  onIncTap: () {
                    productState.quantity++;
                  },
                  onDecTap: () {
                    productState.quantity--;
                  },
                  onAddCartTap: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//https://cdn-prod.medicalnewstoday.com/content/images/articles/308/308796/mixed-fruits.jpg
