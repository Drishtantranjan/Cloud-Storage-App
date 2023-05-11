// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key, required List<File> files});

  @override
  // ignore: library_private_types_in_public_api
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final List<File> _files = [];

  void _uploadFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _files.add(File(result.files.single.path!));
      });
    }
  }

  void _saveToDrive() {
    // Code to save file to drive
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Files'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_files.isNotEmpty)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(10),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: _files
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
                                  style: const TextStyle(
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
          SizedBox(
            height: 50,
            child: Center(
              child: ElevatedButton(
                onPressed: _files.isEmpty ? _uploadFile : _saveToDrive,
                child: Text(_files.isEmpty ? 'Pick a file' : 'Save to Drive'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CloudPage(files: _files),
            ),
          );
        },
        child: const Icon(Icons.cloud),
      ),
    );
  }
}

class CloudPage extends StatelessWidget {
  final List<File> files;

  const CloudPage({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cloud'),
      ),
      body: files.isEmpty
          ? const Center(
              child: Text('No files uploaded yet'),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: files
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
                                style: const TextStyle(
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
    );
  }
}
