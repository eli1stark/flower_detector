import 'dart:io';
import 'package:flower_detector/components/answer_text.dart';
import 'package:flower_detector/components/content_frame.dart';
import 'package:flower_detector/components/default_image.dart';
import 'package:flower_detector/components/home_frame.dart';
import 'package:flower_detector/components/output_image.dart';
import 'package:flower_detector/styles/spacers.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import '../components/header_text.dart';
import '../components/custom_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File _image;
  List _output;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  classifyImage(File image) async {
    List output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  pickImage(ImageSource source) async {
    var image = await ImagePicker().getImage(
      source: source,
    );
    if (image == null) return null;

    setState(() => _image = File(image.path));

    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return HomeFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpaceH50(),
          HeaderText(
            text: 'Detect Flowers',
          ),
          HeaderText(
            text: 'Custom Tensorflow CNN',
            color: Colors.black,
            fontSize: 18.0,
          ),
          SpaceH30(),
          ContentFrame(
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: _loading
                        ? DefaultImage()
                        : Container(
                            child: Column(
                              children: [
                                OutputImage(
                                  image: _image,
                                ),
                                SpaceH10(),
                                _output.isNotEmpty
                                    ? AnswerText(
                                        'Prediction is: ${_output[0]['label']}',
                                      )
                                    : AnswerText(
                                        'Prediction is: Unknown',
                                      ),
                                SpaceH20(),
                              ],
                            ),
                          ),
                  ),
                ),
                CustomButton(
                  text: 'Take a phote',
                  onTap: pickImage,
                  source: ImageSource.camera,
                ),
                SpaceH10(),
                CustomButton(
                  text: 'Camera Roll',
                  onTap: pickImage,
                  source: ImageSource.gallery,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
