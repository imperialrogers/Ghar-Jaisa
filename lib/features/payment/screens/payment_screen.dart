import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import 'package:project_s4/features/cart/services/cart_services.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class PaymentsScreen extends StatefulWidget {
  static const routeName = '/payments-screen';

  final String totalAmount;
  const PaymentsScreen({
    super.key,
    required this.totalAmount,
  });

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final CartServices cartServices = CartServices();
  //***************************************RAZORPAY SETUP******************************************/

  Razorpay razorpay = Razorpay();

  //Opening razorpay

  void openCheckout(
    String phone,
    String email,
  ) {
    var options = {
      "key": "rzp_test_kts0naJ8Vehrog",
      "amount": "${widget.totalAmount}",
      "name": "FOOD DELIVERY COMPANY",
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
    try {
      cartServices.placeOrder(
        context: context,
        totalSum: double.parse(widget.totalAmount),
      );

      paymentItems.add(PaymentItem(
          amount: widget.totalAmount,
          label: 'Total Amount',
          status: PaymentItemStatus.final_price));
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void handlePaymentError(PaymentFailureResponse res) {
    showSnackBar(context, "PAYMENT FAILURE");
  }

  void handleExternalWallet(ExternalWalletResponse res) {
    showSnackBar(context, "EXTERNAL WALLET");
  }

  //***************************************PAYTM SETUP******************************************/

  //***************************************GPAY SETUP******************************************/

  void onGooglePayResult(res) {
    cartServices.placeOrder(
      context: context,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  //SCREEN UI
  //Variables

  List<PaymentItem> paymentItems = [];

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
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            '',
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final userProvider =
                        Provider.of<UserProvider>(context, listen: false);
                    // Handle Razorpay button pressed
                    openCheckout(userProvider.user.phone.toString(),
                        userProvider.user.email);
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
                    height: 70.0,
                    width: 50.0,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
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
                    height: 70.0,
                    width: 50.0,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
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
                  icon: Image.asset(
                    "assets/images/gpay.png",
                    height: 70.0,
                    width: 50.0,
                  ),
                  label: const Text(
                    "Pay with Google Pay",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              GooglePayButton(
                onPressed: () {},
                paymentConfigurationAsset: 'gpay.json',
                onPaymentResult: onGooglePayResult,
                paymentItems: paymentItems,
                height: 50,
                type: GooglePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
