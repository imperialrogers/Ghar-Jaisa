import 'package:flutter/material.dart';

class VerificationCodePage extends StatefulWidget {
  static const routeName = 'ResetPassword';
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final double _boxSize = 50;
  String _code = '';

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  Widget _buildCodeBox(int index) {
    return Container(
      width: _boxSize,
      height: _boxSize,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            _code = _code + value;
            if (index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              // all boxes filled, do something with the code
              print('Verification code entered: $_code');
            }
          } else if (value.isEmpty && _code.isNotEmpty) {
            _code = _code.substring(0, _code.length - 1);
            if (index > 0) {
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 50),
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.orange,
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(height: 10),
            Text(
              'Enter the 4-digit verification code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Code sent to phone number.This code will be expired in 1 minute',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildCodeBox(index)),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: () {
          // validate the code or send it to the server for validation
          print('Verification code entered: $_code');
        },
        label: Text('Next'),
      ),
    );
  }
}
