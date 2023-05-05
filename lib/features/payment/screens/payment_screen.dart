import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/bottom_bar.dart';
import 'package:project_s4/features/cart/services/cart_services.dart';
import 'package:project_s4/features/orders/screens/orders_history_screen.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payments-screen';
  final String totalAmount;
  const PaymentScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  //RAZORPAY SETUP******************************************/

  Razorpay razorpay = Razorpay();

  //Opening razorpay

  void openCheckout(String email, String phone) {
    var options = {
      "key": "rzp_test_kts0naJ8Vehrog",
      "amount": "${widget.totalAmount}",
      "name": "FOOD DELIVERY SUBSYSTEM",
      "description": "TOTAL AMOUNT",
      "prefill": {
        "contact": phone,
        "email": email,
      },
      "external": {
        "wallets": ["paytm"],
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //Handling results

  void handlePaymentSuccess(PaymentSuccessResponse res) {
    final CartServices cartServices = CartServices();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;
    try {
      print("here");
      cartServices.placeOrder(
        context: context,
        address: "jihjklhjkl",
        totalSum: (double.parse(widget.totalAmount) / 100),
      );
      Navigator.pushNamed(context, BottomBar.routeName);
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    showSnackBar(context, "ORDER SUCCESSFUL");
  }

  void handlePaymentError(PaymentFailureResponse res) {
    showSnackBar(context, "ORDER FAILURE");
  }

  void handleExternalWallet(ExternalWalletResponse res) {
    showSnackBar(context, "EXTERNAL WALLET");
  }

  //****************************************************** */

  @override
  void initState() {
    super.initState();
    // paymentItems.add(PaymentItem(
    //     amount: widget.totalAmount,
    //     label: 'Total Amount',
    //     status: PaymentItemStatus.final_price));

    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Payment Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Razorpay button pressed
                  final userProvider =
                      Provider.of<UserProvider>(context, listen: false);
                  final user = userProvider.user;
                  openCheckout(
                    user.email,
                    user.phone.toString(),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                icon: Image.asset(
                  "assets/images/razorpay.png",
                  height: 30.0,
                  width: 30.0,
                ),
                label: const Text(
                  "Pay with Razorpay",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Paytm button pressed
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                icon: Image.asset(
                  "assets/images/paytm.png",
                  height: 30.0,
                  width: 30.0,
                ),
                label: const Text(
                  "Pay with Paytm",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Google Pay button pressed
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                icon: const Icon(Icons.payment, color: Colors.blue),
                label: const Text(
                  "Pay with Google Pay",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
