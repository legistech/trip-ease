import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../Presentation/home page/driver_home_screen.dart';
import 'driver_register.dart';
import 'package:photo_view/photo_view.dart';

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  Map<String, String> imageTitles = {}; // Store uploaded image titles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D2D50),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF67DCE5)),
          iconSize: 28,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const RegisterDriver()),
            );
          },
        ),
        title: const Text(
          'Upload Documents',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24,
            color: Color(0xFFCACACA),
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            _buildUploadOption(context, 'Upload CNIC Picture', 'cnic'),
            const SizedBox(height: 20),
            _buildImageTitle('cnic'),
            const SizedBox(height: 100),
            _buildUploadOption(context, 'Upload License Picture', 'license'),
            const SizedBox(height: 20),
            _buildImageTitle('license'),
            const SizedBox(height: 100),
            _buildUploadOption(context, 'Upload Car Document Picture', 'car'),
            const SizedBox(height: 20),
            _buildImageTitle('car'),
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DriverHomeScreen()),
                      );
                    },
                    child: const Text(
                      'next',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 14,
                        color: Color(0xFF67DCE5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadImage(String folderName) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = await pickedFile.readAsBytes();
      final fileName =
          '${DateTime.now()}.png'; // You can modify the file name as needed

      final storageRef =
          FirebaseStorage.instance.ref().child('$folderName/$fileName');
      final uploadTask = storageRef.putData(file);

      final TaskSnapshot uploadSnapshot = await uploadTask;

      if (uploadSnapshot.state == TaskState.success) {
        setState(() {
          imageTitles[folderName] = _extractTitleFromImagePath(pickedFile.path);
        });
      }
    }
  }

  String _extractTitleFromImagePath(String imagePath) {
    final segments = imagePath.split('/');
    final fileName = segments.last;
    return fileName;
  }

  Widget _buildImageTitle(String folderName) {
    final imageTitle = imageTitles[folderName] ?? '';

    return GestureDetector(
      onTap: () {
        if (imageTitle.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageViewScreen(imagePath: imageTitle)),
          );
        }
      },
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF67DCE5)),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            imageTitle,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 14,
              color: Color(0xFF67DCE5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadOption(
      BuildContext context, String labelText, String folderName) {
    return GestureDetector(
      onTap: () {
        _uploadImage(folderName);
      },
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF67DCE5)),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            labelText,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 18,
              color: Color(0xFF67DCE5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageViewScreen extends StatelessWidget {
  final String imagePath;

  const ImageViewScreen({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image View'),
      ),
      body: PhotoView(
        imageProvider: AssetImage(
          imagePath,
        ),
      ),
    );
  }
}
