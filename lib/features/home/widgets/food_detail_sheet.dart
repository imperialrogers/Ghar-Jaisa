import 'package:flutter/material.dart';

import '../../../models/product.dart';
import './food_title_widget.dart';

class FoodDetailSheet extends StatefulWidget {
  final Product product;
  const FoodDetailSheet({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FoodDetailSheetState createState() => _FoodDetailSheetState();
}

class _FoodDetailSheetState extends State<FoodDetailSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.cancel,
                textDirection: TextDirection.rtl,
                color: Colors.black45,
                size: 35,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.product.images[0],
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Align(
              heightFactor: 0,
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                width: 20,
                'assets/images/veg.png',
              ),
            ),
          ),
          FoodTitleWidget(
            productName: widget.product.name,
            productPrice: '₹ ${widget.product.price}',
            productDescription: widget.product.description,
          ),
        ],
      ),
    );
  }
}
