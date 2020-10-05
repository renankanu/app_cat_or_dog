import 'dart:io';

import 'package:appcatordog/app/widgets/base_button.dart';
import 'package:appcatordog/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.6,
        imageStd: 127.5);
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  void dispose() {
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCowboy,
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: kCowboy,
        brightness: Brightness.dark,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cats and Dogs ?',
                style: TextStyle(
                  color: kNeptune,
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                ),
              ),
              Center(
                child: _loading
                    ? Container(
                        width: 280,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/cat.png',
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Container(
                              height: 250,
                              child: Image.file(_image),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _output != null
                                ? Text(
                                    '${_output[0]['label']}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : Container(),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    BaseButton(
                      text: 'Take a photo',
                      textColor: Colors.white,
                      color: kMandy,
                      press: pickImage,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BaseButton(
                      text: 'Import from Gallery',
                      textColor: Colors.white,
                      color: kMandy,
                      press: pickGalleryImage,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//2:54
