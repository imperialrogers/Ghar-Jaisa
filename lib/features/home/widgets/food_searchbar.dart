import 'package:flutter/material.dart';

class FoodSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 251, 240, 228),
              hintText: 'What do you want to order?',
              hintStyle: TextStyle(color: Color.fromARGB(255, 215, 162, 93)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Color.fromARGB(255, 155, 93, 0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 251, 240, 228),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            color: Color.fromARGB(255, 198, 123, 12),
            alignment: Alignment.center,
            icon: Icon(
              Icons.format_list_bulleted_sharp,
              size: 26,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
