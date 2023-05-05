// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/loader.dart';
//import 'package:project_s4/features/home/widgets/food_searchbar.dart';
import 'package:project_s4/features/orders/screens/order_details_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:intl/intl.dart';

import '../../../models/orders.dart';
import '../../account/services/account_services.dart';

class OrdersHistoryScreen extends StatefulWidget {
  static const routeName = '/orders-history';

  const OrdersHistoryScreen({super.key});

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  List<Order>? orderss;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orderss = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  // String formattedDate =
  //     DateFormat('dd MMM yyyy @ h:mm a').format(DateTime.now()).toString();

  final List<String> status = [
    "Cooking",
    "In Delivery",
    "Delivered",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Order History',
            style: TextStyle(
                color: Color.fromARGB(200, 50, 53, 51),
                fontWeight: FontWeight.w600,
                fontSize: 19),
          ),
        ),
        toolbarHeight: 55,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: orderss == null
          ? const Loader()
          : ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: orderss!.length,
              itemBuilder: (BuildContext context, int index) {
                // Build a card for each order item
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrderDetailsScreen(orderNumber: orderss![index].id),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 135,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: const EdgeInsets.all(11.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    orderss![index].products[0].images[0],
                                    fit: BoxFit.cover,
                                    height: 60,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, top: 35),
                                child: Image.asset(
                                  width: 18,
                                  'assets/images/veg.png',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Text(
                                        '${orderss![index].products[0].name} X ${orderss![index].quantity}',
                                        softWrap: true,
                                        // overflow: ,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    const Text('Dharwad-Hubli Locality',
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(status[orderss![index].status],
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        backgroundColor: Colors.black12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54)),
                              )
                            ],
                          ),
                          const DottedLine(dashColor: Colors.black26),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Text(
                                  "${DateFormat().format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        orderss![0].orderedAt),
                                  )}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(200, 50, 53, 51),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Text(
                                  "₹ ${orderss![index].totalPrice}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
