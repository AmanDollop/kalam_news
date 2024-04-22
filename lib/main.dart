import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/scroll_behavior.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:kalam_news_publication/app/theme/theme_data/theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/routes/app_pages.dart';

void main() {
   const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark, // For Android(M and greater): (dark icons)
      systemNavigationBarIconBrightness: Brightness.dark
  );
  WidgetsFlutterBinding.ensureInitialized();

  late StreamSubscription streamSubscription;

  AC().getNetworkConnectionType();
  streamSubscription = AC().checkNetworkConnection();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => ResponsiveSizer(
          builder: (buildContext, orientation, screenType) => GestureDetector(
            onTap: () => KNPMethods.unFocsKeyBoard(),
            child: GetMaterialApp(
              title: "Application",
              theme: AppThemeData.kNPThemeData(fontFamily: 'HelveticaNeue'),
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              defaultTransition: Transition.zoom,
              debugShowCheckedModeBanner: false,
              scrollBehavior: ListScrollBehavior(),
            ),
          ),
        ),
      ),
    );
  });

}

/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class AadharImageValidator extends StatefulWidget {
  @override
  _AadharImageValidatorState createState() => _AadharImageValidatorState();
}

class _AadharImageValidatorState extends State<AadharImageValidator> {
  File? _imageFile;

  Future<void> _getImage() async {
      final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _validateAadharImage();
    }
  }

  Future<void> _validateAadharImage() async {
    if (_imageFile != null) {
      // Use the image package to decode the image
      final image = img.decodeImage(await _imageFile!.readAsBytes());

      // Placeholder validation logic (replace with your actual validation)
      bool isValidAadharImage = _validateImageContents(image);

      if (isValidAadharImage) {
        print('Aadhar image is valid.');
      } else {
        print('Aadhar image is not valid.');
      }
    }
  }

  bool _validateImageContents(img.Image? image) {
    // Placeholder logic - check for Aadhar card features
    // Replace this with your actual validation logic
    if (image != null) {
      // Example: Check if the image contains the UIDAI logo
      // This is just a placeholder, you should implement a more robust validation
      final hasUIDAILogo = _checkForUIDAILogo(image);
      return hasUIDAILogo;
    }
    return false;
  }

  bool _checkForUIDAILogo(img.Image image) {
    const logoX = 10;
    const logoY = 10;

    final pixel = image.getPixelSafe(logoX, logoY); // Use getPixelSafe to handle out-of-bounds pixels

    // Extract RGB values from the color object
    final r = pixel.r.toInt();
    final g = pixel.g.toInt();
    final b = pixel.b.toInt();

    // Example check: If the color at the logo position is close to white, it may be the UIDAI logo
    final isUIDAILogo = _isColorCloseToWhite(r, g, b);

    return isUIDAILogo;
  }

  bool _isColorCloseToWhite(int r, int g, int b) {
    // Check if a color is close to white based on RGB values
    // Threshold values for white (adjust as needed)
    const thresholdR = 200;
    const thresholdG = 200;
    const thresholdB = 200;

    return r > thresholdR && g > thresholdG && b > thresholdB;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aadhar Image Validator'),
      ),
      body: Center(
        child: _imageFile == null
            ? Text('Select an image to validate.')
            : Image.file(_imageFile!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Aadhar Image Validator',
    home: AadharImageValidator(),
  ));
}*/

