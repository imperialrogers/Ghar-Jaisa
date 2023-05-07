import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;

  const SingleProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(20),
          child: Container(
            height: 130,
            width: 160,
            child: Image.network(
              // cacheWidth: 150,
              // cacheHeight: 110,
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
    ;
  }
}
