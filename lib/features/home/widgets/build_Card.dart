// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/loader.dart';
import '../../../models/product.dart';
import '../../search/services/search_service.dart';
import './food_detail_sheet.dart';

class buildCard extends StatefulWidget {
  const buildCard({
    super.key,
  });

  @override
  State<buildCard> createState() => _buildCardState();
}

class _buildCardState extends State<buildCard> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await searchServices.fetchAllProduct(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (products == null)
        ? const Loader()
        : SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12),
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(
                width: 35,
              ),
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Column(
                  children: [
                    GestureDetector(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(25)),
                        child: Image.network(
                          products![index].images[0],
                          width: 250,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            builder: (BuildContext context) {
                              return FractionallySizedBox(
                                heightFactor: 0.7,
                                child: FoodDetailSheet(
                                  product: products![index],
                                ),
                              );
                            },
                            elevation: 5,
                            isScrollControlled: true);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        products![index].name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      '₹${products![index].price.toString()}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
