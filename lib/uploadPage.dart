import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:cloud_storage_app/cloudPage.dart';
import 'package:velocity_x/velocity_x.dart';

class UploadPage extends StatefulWidget {
  final List<File> files;

  UploadPage({required this.files});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  bool uploading = false;

  void _uploadFiles() {
    setState(() {
      uploading = true;
    });

    // TODO: Implement file uploading logic here

    setState(() {
      uploading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CloudPage(files: widget.files),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: widget.files
                  .map((file) => Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.file(
                                file,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                file.path.split('/').last,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).p(16))
                  .toList(),
            ),
          ),
          ElevatedButton(
            onPressed: uploading ? null : _uploadFiles,
            child:
                uploading ? CircularProgressIndicator() : Text('Save to Drive'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CloudPage(files: widget.files),
            ),
          );
        },
        child: Icon(Icons.cloud),
      ),
    );
  }
}
