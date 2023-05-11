import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_storage_app/cloudPage.dart';

class HomePage extends StatelessWidget {
  final List<File> files = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadPage(files: files),
                  ),
                );
              },
              child: Text('Upload'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: files.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadPage(files: files),
                        ),
                      );
                    },
              child: files.isEmpty
                  ? Text('No Files Uploaded')
                  : Text('Submit to Drive'),
            ),
          ],
        ),
      ),
    );
  }
}
