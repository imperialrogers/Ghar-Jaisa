import 'package:flutter/material.dart';

import '../../../models/orders.dart';
import '../../account/services/account_services.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;

  const OrderDetailsScreen({super.key, required this.order});

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
                  widget.order.id,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            //
            //
            for (int i = 0; i < widget.order.products.length; i++)
              Row(
                children: [
                  Image.network(
                    widget.order.products[i].images[0],
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.order.products[i].name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Qty: ${widget.order.quantity[i]}',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "${widget.order.products[i].price} X ${widget.order.quantity[i]} = ${widget.order.products[i].price * widget.order.quantity[i]}",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            //
            //

            Column(
              children: [
                // const Align(
                //   widthFactor: 4.5,
                //   heightFactor: 2,
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'Quantity: Half',
                //     style: TextStyle(fontSize: 13, color: Colors.black54),
                //   ),
                // ),

                const SizedBox(
                  height: 30,
                ),

                Row(
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
                        'GST pre-included',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Row(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
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
                      padding:
                          const EdgeInsets.only(right: 20, top: 5.0, bottom: 2),
                      child: Text(
                        "₹${widget.order.totalPrice}",
                        style: const TextStyle(
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
