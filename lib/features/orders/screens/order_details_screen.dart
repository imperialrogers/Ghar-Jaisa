import 'package:flutter/material.dart';

import '../../../models/orders.dart';
import '../../account/services/account_services.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String orderNumber;

  const OrderDetailsScreen({super.key, required this.orderNumber});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
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

  void getOrderDetails() {
    for (int i = 0; i < orderss!.length; i++) {}
  }

  List<String>? orderName;
  List<String>? orderQ;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(thickness: 0.002),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 7),
              child: Align(
                widthFactor: 2.7,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Order Details',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            const Divider(thickness: 1),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      height: 25,
                      width: 25,
                      'assets/images/veg.png',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.orderNumber,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const Align(
                  widthFactor: 4.5,
                  heightFactor: 2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Quantity: Half',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5.0, bottom: 5),
                      child: Text(
                        '1 x ₹120',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 5.0, bottom: 5),
                      child: Text(
                        '₹120',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5.0, bottom: 2),
                      child: Text(
                        'Item total',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 5.0, bottom: 2),
                      child: Text(
                        '₹120',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5.0, bottom: 2),
                      child: Text(
                        'Taxes',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 5.0, bottom: 2),
                      child: Text(
                        '₹5',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5.0, bottom: 2),
                      child: Text(
                        'Delivery Charge',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 5.0, bottom: 2),
                      child: Text(
                        'Free',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 5.0, bottom: 2),
                      child: Text(
                        'Grand Total',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 5.0, bottom: 2),
                      child: Text(
                        '₹125.0',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
