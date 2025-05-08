import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker imagePicker = ImagePicker();

  Future<File?> pickImage(ImageSource source) async {
    XFile? xFile = await imagePicker.pickImage(source: source);
    if (xFile != null) {
      return File(xFile.path);
    }
    return null;
  }

  Future<List<File>?> pickMultiImage() async {
    List<XFile> photos = await imagePicker.pickMultiImage();
    if (photos.isNotEmpty) {
      return photos.map((photo) => File(photo.path)).toList();
    }

    return null;
  }
}
