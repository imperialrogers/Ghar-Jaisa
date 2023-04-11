import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/loader.dart';
import 'package:project_s4/features/search/services/search_service.dart';

import '../../../models/product.dart';
import '../../home/widgets/food_searchbar.dart';
import '../widgets/searched_product.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProducts();
  }

  fetchSearchedProducts() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          bottomOpacity: 0,
          forceMaterialTransparency: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: const FoodSearchBar(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: products == null
          ? const Loader()
          : products!.isEmpty
              ? const Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                        ),
                        Icon(
                          Icons.search,
                          size: 200,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                            height: 100,
                            width: 500,
                            child: Center(
                              child: Text(
                                  "Try Searching the item with a different keyword"),
                            )),
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: SearchedProduct(
                              product: products![index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
