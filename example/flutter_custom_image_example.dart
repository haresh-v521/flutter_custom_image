import 'package:flutter/material.dart';
import 'package:flutter_custom_image/src/flutter_custom_image_base.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Row(
          children: [
            Expanded(
              child: ImageViewer(
                imagePath:
                    'https://img.freepik.com/premium-vector/cute-yellow-star_227413-13.jpg?w=740',
                boxFit: BoxFit.fill,
                imageType: ImageType.network,
                errorIcon: Icons.add_a_photo,
                topLeftRadius: 10,
                topRightRadius: 20,
                bottomLeftRadius: 30,
                bottomRightRadius: 40,
              ),
            ),
            Expanded(
              child: ImageViewer(
                  imagePath: 'assets/images/ic_sun.svg',
                  imageType: ImageType.svg,
                  errorIcon: Icons.ac_unit,
                  topRightRadius: 20),
            ),
            Expanded(
              child: ImageViewer(
                  imagePath: 'assets/images/ic_heart_eyes.png',
                  imageType: ImageType.network,
                  errorIconColor: Colors.blueGrey,
                  errorIcon: Icons.ac_unit,
                  width: 50,
                  height: 50),
            ),
          ],
        ),
      ),
    );
  }
}
