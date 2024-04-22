import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/// flutter pub add image_picker For Image Picker And Also See Configuration  in pubspec.yaml
import 'package:image_picker/image_picker.dart';

///flutter pub add image_cropper For Image  Cropper And Also See Configuration  in pubspec.yaml
import 'package:image_cropper/image_cropper.dart';

class KNPImagePicker{
  static Future<File?> pickImage({
    bool pickFromGallery = false,
    bool isCropper = false,
    Color? cropperColor ,
  }) async {
    XFile? imagePicker = pickFromGallery
        ? await ImagePicker().pickImage(source: ImageSource.gallery)
        : await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagePicker != null) {
      if (isCropper) {
        CroppedFile? cropImage = await ImageCropper().cropImage(
          sourcePath: imagePicker.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
              toolbarColor: cropperColor??Theme.of(Get.context!).colorScheme.primary,
              toolbarTitle: "Cropper",
              activeControlsWidgetColor: cropperColor??Theme.of(Get.context!).colorScheme.primary,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
            ),
            IOSUiSettings(
              title: 'Cropper',
            ),
          ],
          compressQuality: 40,
        );
        if (cropImage != null) {
          return File(cropImage.path);
        } else {
          return null;
        }
      }
      else {
        return File(imagePicker.path);
      }
    }
    else {
      return null;
    }
  }
}