import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class user_image_picker extends StatefulWidget {

 user_image_picker(this._imgpick);

  final void Function(File Picked_img) _imgpick;
  @override
  State<user_image_picker> createState() => _user_image_pickerState();
}

class _user_image_pickerState extends State<user_image_picker> {
      File? _pickedImage;
  Future _pickImage() async {
    final pickedImageFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
    widget._imgpick(File(pickedImageFile.path));
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _pickedImage!=null ? FileImage(_pickedImage!):null,
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.image),
          onPressed: _pickImage,
          label: Text(
            "Add Image",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
