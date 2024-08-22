import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyHomePage.routeNameImage: (context) => const MyHomePage(),
        ImageList.routeNameList: (context) => const ImageList(),
        UploadImage.routeNameUpload: (context) => const UploadImage(),
      },
      home: Scaffold(
        appBar: AppBar(title: const Text('Firebase Storage')),
        body: const UploadImage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeNameImage = "/image";

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? downloadUrl;
  List<String>? listImage;

  @override
  void initState() {
    super.initState();
    _downloadFile();
  }

  Future<void> _downloadFile() async {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('/images/ic_female_barbarian.png');
    try {
      final downloadUrl = await ref.getDownloadURL();
      setState(() {
        this.downloadUrl = downloadUrl;
        // listImage = lists as List<String>;
      });
      print('Downloading file: $listImage');
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: downloadUrl != null
            ? Image.network(downloadUrl!)
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class ImageList extends StatefulWidget {
  static const routeNameList = "/listImage";

  const ImageList({super.key});

  @override
  ImageListState createState() => ImageListState();
}

class ImageListState extends State<ImageList> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().child('images/').listAll();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      files.add({"url": fileUrl, "path": file.fullPath});
    });

    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Images"),
      ),
      body: FutureBuilder(
        future: _loadImages(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading images'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No images found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> image = snapshot.data![index];
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Image.network(image['url']),
                  title: Text(image['path']),
                ),
              ));
            },
          );
        },
      ),
    );
  }
}

class UploadImage extends StatefulWidget {
  static const routeNameUpload = "/upload";

  const UploadImage({super.key});

  @override
  UploadImageState createState() => UploadImageState();
}

class UploadImageState extends State<UploadImage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    String fileName = basename(_image!.path);
    Reference firebaseStorageRef = _storage.ref().child('uploads/$fileName');

    try {
      await firebaseStorageRef.putFile(_image!);
      String downloadURL = await firebaseStorageRef.getDownloadURL();
      print("Download URL: $downloadURL");
      ScaffoldMessenger.of(this.context)
          .showSnackBar(const SnackBar(content: Text('Upload Successful!')));
    } catch (e) {
      print("Upload Error: $e");
      ScaffoldMessenger.of(this.context)
          .showSnackBar(const SnackBar(content: Text('Upload Failed!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image == null
              ? const Text('No image selected.')
              : Image.file(_image!, height: 300),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Pick Image'),
          ),
          ElevatedButton(
            onPressed: _uploadImage,
            child: const Text('Upload Image'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ImageList.routeNameList);
            },
            child: const Text('List Images'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyHomePage.routeNameImage);
            },
            child: const Text('Image'),
          ),
        ],
      ),
    );
  }
}
