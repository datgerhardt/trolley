import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImgCamera extends StatefulWidget {
  const ImgCamera({Key? key}) : super(key: key);

  @override
  _ImgCameraState createState() => _ImgCameraState();
}

class _ImgCameraState extends State<ImgCamera> {
  final ImagePicker _picker = ImagePicker();
  final ButtonStyle style = ElevatedButton.styleFrom(
    primary: Colors.black,
    padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
  );

  chooseImg(ImageSource source) async {
    final XFile? photo = await _picker.pickImage(source: source);
    return photo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 200,
            //   width: 100,
            //   color: Colors.black,
            //   child: Icon(
            //     Icons.upload,
            //     color: Colors.white,
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child:
                  Text("Trolley", style: Theme.of(context).textTheme.headline6),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  chooseImg(ImageSource.camera);
                },
                child: Text(" Snap"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  chooseImg(ImageSource.gallery);
                },
                child: Text("Upload Image"),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(" Sign Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
