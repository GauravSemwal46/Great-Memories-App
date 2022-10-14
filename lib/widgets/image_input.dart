import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_places_app/helpers/app_colors.dart';
import 'package:flutter_places_app/helpers/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput({required this.onSelectImage, super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  XFile? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    await imageFile.saveTo('${appDir.path}/$fileName');
    widget.onSelectImage('${appDir.path}/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.greyColor),
          ),
          child: _storedImage != null
              ? Image.file(
                  File(_storedImage!.path),
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text(
                  AppConstants.noImageMessage,
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera),
            label: const Text(AppConstants.takePicture),
          ),
        ),
      ],
    );
  }
}
