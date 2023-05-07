// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_conditional_assignment

import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../search/screens/search_screen.dart';

class FoodSearchBar extends StatefulWidget {
  const FoodSearchBar({super.key});

  @override
  State<FoodSearchBar> createState() => _FoodSearchBarState();
}

class _FoodSearchBarState extends State<FoodSearchBar> {
  String listen = "";
  // bool _isListening = false;
  void navigateToSearchScreen(String query) {
    // ignore: unnecessary_null_comparison
    if (query == null) query = " ";
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    // final speech = stt.SpeechToText();
    // double _buttonSize = 60;
    // double _borderRadius = 30;

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            // controller: _searchController,
            onFieldSubmitted: navigateToSearchScreen,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 251, 240, 228),
              hintText: 'What do you want to order?',
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 215, 162, 93)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Color.fromARGB(255, 155, 93, 0),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        // Container(
        //   // decoration: BoxDecoration(
        //   //   color: const Color.fromARGB(255, 251, 240, 228),
        //   //   shape: BoxShape.rectangle,
        //   //   borderRadius: BorderRadius.circular(16),
        //   // ),
        //   // child: IconButton(
        //   //   color: const Color.fromARGB(255, 198, 123, 12),
        //   //   alignment: Alignment.center,
        //   //   icon: const Icon(
        //   //     Icons.mic,
        //   //     size: 26,
        //   //   ),
        //   //   onPressed: () {},
        //   // ),
        //   child: GestureDetector(
        //     onTapUp: (details) {
        //       speech.stop();
        //       setState(() {
        //         _isListening = false;
        //         _buttonSize = 50.0;
        //         _borderRadius = 25.0;
        //       });
        //     },
        //     onTapDown: (details) async {
        //       final isAvailable = await speech.initialize();
        //       if (isAvailable) {
        //         setState(() {
        //           _isListening = true;
        //           _buttonSize = 60.0;
        //           _borderRadius = 30.0;
        //         });
        //         await speech.listen(
        //           onResult: (result) {
        //             listen = result.recognizedWords;
        //           },
        //         );
        //       }
        //     },
        //     //  child:  Icon(Icons.mic,color: _isListening ? Colors.blue : Colors.white,)
        //     child: AnimatedContainer(
        //       duration: const Duration(milliseconds: 150),
        //       width: _buttonSize,
        //       height: _buttonSize,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(_borderRadius),
        //       ),
        //       child: Icon(
        //         _isListening ? Icons.mic : Icons.mic_none_rounded,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        //   // child: IconButton(
        //   //   icon: const Icon(
        //   //     Icons.mic,
        //   //     color: Colors.white,
        //   //   ),
        //   //   onPressed: () {
        //   //     // logic for mic button
        //   //   },
        //   // ),
        // ),
      ],
    );
  }
}
