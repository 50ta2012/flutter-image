import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _getImagePicker(ImageSource source, {BuildContext? context}) async {
    List<XFile>? imageFileList;
    final ImagePicker _picker = ImagePicker();

    try {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        imageFileList = pickedFile == null ? null : [pickedFile];
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void doTest() async {
    await GallerySaver.saveImage("https://i.imgur.com/AD3MbBi.jpeg");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Hello Wrold",
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                  onPressed: () => doTest(), child: const Text('save')),
              FloatingActionButton(
                  onPressed: () {
                    _getImagePicker(ImageSource.gallery, context: context);
                  },
                  child: const Icon(Icons.camera)),
            ],
          ),
        ));
  }
}
