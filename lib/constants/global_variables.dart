import 'package:flutter/material.dart';

String uri = 'http://10.0.0.99:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);

  static var selectedNavBarColor = const Color.fromRGBO(255, 153, 0, 1);

  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<String> categoriesList = [
    "Main Course",
    "Biryani",
    "South Indian & Mini Meal",
    "Starters",
    "Choice Of Dal",
    "Breads",
    "Rice",
    "Chinese",
    "Burgers and Sandwiches"
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': "Main Course",
      'image': 'assets/images/maincourse.jpeg',
    },
    {
      'title': "Biryani",
      'image': 'assets/images/biryani.jpeg',
    },
    {
      'title': "South Indian & Mini Meal",
      'image': 'assets/images/minimeal.jpeg',
    },
    {
      'title': "Starters",
      'image': 'assets/images/starters.jpeg',
    },
    {
      'title': "Choice Of Dal",
      'image': 'assets/images/dal.jpeg',
    },
    {
      'title': "Breads",
      'image': 'assets/images/breads.jpeg',
    },
    {
      'title': "Rice",
      'image': 'assets/images/rice.jpeg',
    },
    {
      'title': "Chinese",
      'image': 'assets/images/chinese.jpeg',
    },
    {
      'title': "Burgers and Sandwiches",
      'image': 'assets/images/burger.jpg',
    },
  ];
}
