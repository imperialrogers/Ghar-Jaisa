import 'package:flutter/material.dart';
import 'package:project_s4/constants/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMaps extends StatefulWidget {
  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  // final _control = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _streetController = TextEditingController();
  final _pincodeController = TextEditingController();
  bool _isLoading = false;

  void updateLocation(
    BuildContext context,
    String address,
    String street,
    String pincode,
  ) async {}
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
              'Location',
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: Text(
                      'Address',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _addressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Enter your Address',
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: Text(
                      'Street',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _streetController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Street name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Street name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: Text(
                      'Pincode',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _pincodeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Pincode';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Enter your Pincode',
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Center(
                    child: SizedBox(
                      width: size.width * 0.45,
                      height: size.height * 0.055,
                      child: ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(40),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              updateLocation(
                                  context,
                                  _streetController.text,
                                  _pincodeController.text,
                                  _addressController.text);
                              // Implement update functionality
                              setState(() {
                                _isLoading = true;
                              });
                              // Simulating update with delay
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  _isLoading = false;
                                });
                              });
                              goToGoogleMapsDirections();
                            } else {
                              showSnackBar(context, "ENTER FIEDLS");
                            }
                          },
                          child: const Text('View on Google Maps'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.32,
                  ),
                  Center(
                    child: SizedBox(
                      width: size.width * 0.7,
                      height: size.height * 0.065,
                      child: ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Proceed to Checkout',
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void goToGoogleMapsDirections() async {
    String end = _addressController.text +
        " " +
        _streetController.text +
        " " +
        _pincodeController.text;
    String locationEnd = Uri.encodeQueryComponent(end);

    String url =
        'https://www.google.com/maps/dir/?api=1&destination=$locationEnd';
    // ignore: deprecated_member_use
    await launch(url);
  }
}
