import 'package:flutter/material.dart';
import 'package:project_s4/features/account/services/account_services.dart';
import '../widgets/bottom_sheet.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit-profile';
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final AccountServices accountServices = AccountServices();
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _addressController = TextEditingController();

  bool _isLoading = false;

  void updateCredentials(
    BuildContext context,
    String fname,
    String lname,
    String address,
  ) async {
    accountServices.updateCredentials(context, fname, lname, address);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 16.0),
                      Text(
                        'Profile Picture',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Center(
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  'https://yt3.googleusercontent.com/ifZJFKoXaasijKlvMxM43d1lXCsvTjJgujLvEWCvv68e8rHKSg2OmixwdRBp_L_50uQBviQOHA=s900-c-k-c0x00ffffff-no-rj'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) =>
                                          BottomShhetWidget()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      Text(
                        'First Name',
                        style: theme.textTheme.titleLarge,
                      ),
                      TextFormField(
                        controller: _fnameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your First Name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your First Name',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Last Name',
                        style: theme.textTheme.titleLarge,
                      ),
                      TextFormField(
                        controller: _lnameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Last Name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Last Name',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Address',
                        style: theme.textTheme.titleLarge,
                      ),
                      TextFormField(
                        controller: _addressController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Address',
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.4,
                          height: size.height * 0.055,
                          child: ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(40),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  updateCredentials(
                                      context,
                                      _fnameController.text,
                                      _lnameController.text,
                                      _addressController.text);
                                  // Implement update functionality
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  // Simulating update with delay
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  });
                                }
                              },
                              child: const Text('Update'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
