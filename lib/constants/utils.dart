// import 'package:file_picker/file_picker.dart';
// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showSnackBar(BuildContext context, String text, int x) {
  // int x = 0;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: (x == 0)
                  ? Color(0xFFC72C41)
                  : Color.fromARGB(255, 34, 145, 67),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (x == 0) ? "OH SHOOT!\n" : "SUCCESS\n",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                "assets/bubbles.svg",
                height: 48,
                width: 40,
                color: (x == 0)
                    ? Color(0xFF801336)
                    : Color.fromARGB(255, 20, 93, 50),
              ),
            ),
          ),
          Positioned(
            top: -15,
            left: 0,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/back.svg",
                  height: 40,
                  color: (x == 0)
                      ? Color(0xFF801336)
                      : Color.fromARGB(255, 20, 93, 50),
                  alignment: Alignment.center,
                ),
                Positioned(
                  top: 10,
                  right: 11,
                  child: SvgPicture.asset(
                    (x == 0)
                        ? "assets/types/failure.svg"
                        : "assets/types/success.svg",
                    height: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
