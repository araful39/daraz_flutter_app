import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<File?> compressImage(
  File imageFile, {
  int minDimension = 1080,  
  int quality = 90,        
  bool keepExif = false,   
}) async {
  log("----image file---${imageFile.path}");
  final dir = await path_provider.getTemporaryDirectory();
  final targetPath =
      '${dir.absolute.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  final result = await FlutterImageCompress.compressAndGetFile(
    imageFile.path,
    targetPath,
    minHeight: 1080, //you can play with this to reduce siz
    minWidth: 1080,
    quality: 90, // keep this high to get the original quality of image
  );

  if (result == null) {
    return null; // Compression failed
  }
  return File(result.path); // Return the compressed file
}
