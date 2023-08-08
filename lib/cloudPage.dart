// ignore_for_file: file_names

import 'dart:io';

import 'package:cloud_storage_app/customSnack.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
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
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
                radius: 25,
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 150,
          title: const Text(
            'Welcome, back',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 150,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Services",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (_files.isEmpty) {
                        _uploadFile();
                        Future.delayed(Duration(seconds: 5), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              content: CustomSnackBar(),
                            ),
                          );
                        });
                      } else {
                        _saveToDrive();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            content: CustomSnackBar(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      height: 250,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5FEFD),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.5,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                'assets/folders.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Text(
                                "Upload Files",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CloudPage(files: _files),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      height: 250,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFF6DBFF),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                'assets/storage.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: Text(
                                  "View Files",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 250,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF3E1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.0,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'assets/menu.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Text(
                                "Category",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 250,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFffabab),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.0,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'assets/delete.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Text(
                                "Recently Deleted",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 2),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recently Uploaded',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        Container(),
      ]),
    );
// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (_files.isNotEmpty)
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 padding: const EdgeInsets.all(10),
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 children: _files
//                     .map((file) => Card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Expanded(
//                                 child: Image.file(
//                                   file,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   file.path.split('/').last,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ).p(16))
//                     .toList(),
//               ),
//             ),
//           SizedBox(
//             height: 50,
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: _files.isEmpty ? _uploadFile : _saveToDrive,
//                 child: Text(_files.isEmpty ? 'Pick a file' : 'Save to Drive'),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CloudPage(files: _files),
//             ),
//           );
//         },
//         child: const Icon(Icons.cloud),
//       ),
//     );
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
