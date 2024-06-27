import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_disease_app/core/helpers/spacing.dart';
import 'package:plant_disease_app/core/theming/colors.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, this.image});
  final File? image;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String responseMessage = '';

  Future<void> uploadFile(File? image) async {
    var url = 'http://127.0.0.1:5000/predict_image';
    print('image??? ${image.toString()}');
    if (image == null) return;

    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode({
          'image': base64Image,
        }),
      );

      if (response.statusCode == 200) {
        print('File uploaded successfully');
        print('Response: ${response.body}');
      } else {
        print('Failed to upload file. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception during file upload: $e');
    }
  }

  @override
  void initState() {
    // _uploadImage(widget.image);
    uploadFile(widget.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // IconButton(onPressed: (onPressed), icon: icon)
          verticalSpace(100),
          Container(
            width: double.infinity,
            height: 400.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.5),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3)),
              ],
            ),
            child: Image.file(
              height: 50.h,
              widget.image!,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpace(50),
          Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Coffe agjhagagjag',
                    style: TextStyle(
                        color: ColorsManager.mainGreen, fontSize: 25.sp),
                  ),
                  verticalSpace(20),
                  Text(
                    'Coffe : .04545454',
                    style: TextStyle(
                        color: ColorsManager.mainGreen, fontSize: 25.sp),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
