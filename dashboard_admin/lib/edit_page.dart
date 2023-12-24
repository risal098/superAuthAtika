import 'package:dashboard_admin/dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");

    return File(file.path!).copy((newFile.path));
  }

  final singer = TextEditingController();
  final mytitle = TextEditingController();
  final getTitle = TextEditingController();
  final lyrics1 = TextEditingController();
  final lyrics2 = TextEditingController();
  final lyrics3 = TextEditingController();
  final myaudio1 = TextEditingController();
  final myaudio2 = TextEditingController();
  final myaudio3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView(children: [
          TextField(
            controller: singer,
            maxLines: null,
            decoration: InputDecoration(
                hintText: "Singer",
                label: Text("Singer"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: mytitle,
            maxLines: null,
            decoration: InputDecoration(
                hintText: "Title",
                label: Text("Title"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: getTitle,
            maxLines: null,
            decoration: InputDecoration(
                hintText: "GetTitle",
                label: Text("GetTitle"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: lyrics1,
            maxLines: null,
            decoration: InputDecoration(
                hintText: "Lyrics 1",
                label: Text("Lyrics 1"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: lyrics2,
            maxLines: null,
            decoration: InputDecoration(
                hintText: "Lyrics 2",
                label: Text("Lyrics 2"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: lyrics3,
            maxLines: null,
            decoration: InputDecoration(
                hintText: "Lyrics 3",
                label: Text("Lyrics 3"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // select audio 1

              InkWell(
                onTap: () async {
                  final result1 = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['mp3', 'wav'],
                  );
                  if (result1 == null) return;

                  final file1 = result1.files.first; //file yang di pick
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Audio is Added to The Queue"),
                          content: Text("Audio 1:\n${file1.name}"),
                        );
                      });
                  // openFile(file1);
                  print("Name: ${file1.name}");
                  // print("Bytes: ${file1.bytes}");
                  // print("Size: ${file1.size}");
                  // print("Extension: ${file1.extension}");
                  // print("Path: ${file1.path}");

                  // final newFile = await saveFilePermanently(file1);

                  // print("From Path: ${file.path!}");
                  // print("To Path: ${newFile.path}");
                },
                child: Container(
                  width: 180,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 6,
                        )
                      ]),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: AssetImage("images/select_file.jpg"),
                        width: 130,
                      ),
                      Text(
                        "Select Audio 1",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // select audio 2
              InkWell(
                onTap: () async {
                  final result2 = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['mp3', 'wav'],
                  );
                  if (result2 == null) return;

                  final file2 = result2.files.first; //file yang di pick
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Audio is Added to The Queue"),
                          content: Text("Audio 2:\n${file2.name}"),
                        );
                      });
                  // openFile(file2);
                  print("Name: ${file2.name}");
                  // print("Bytes: ${file2.bytes}");
                  // print("Size: ${file2.size}");
                  // print("Extension: ${file2.extension}");
                  // print("Path: ${file2.path}");

                  // final newFile = await saveFilePermanently(file2);

                  // print("From Path: ${file.path!}");
                  // print("To Path: ${newFile.path}");
                },
                child: Container(
                  width: 180,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 6,
                        )
                      ]),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: AssetImage("images/select_file.jpg"),
                        width: 130,
                      ),
                      Text(
                        "Select Audio 2",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // select audio 3
              InkWell(
                onTap: () async {
                  final result3 = await FilePicker.platform.pickFiles(
                      type: FileType.custom, allowedExtensions: ['mp3', 'wav']);

                  if (result3 == null) return;

                  final file3 = result3.files.first; //file yang di pick
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Audio is Added to The Queue"),
                          content: Text("Audio 3:\n${file3.name}"),
                        );
                      });
                  // openFile(file3);
                  print("Name: ${file3.name}");
                  // print("Bytes: ${file3.bytes}");
                  // print("Size: ${file3.size}");
                  // print("Extension: ${file3.extension}");
                  // print("Path: ${file3.path}");

                  // final newFile = await saveFilePermanently(file3);

                  // print("From Path: ${file.path!}");
                  // print("To Path: ${newFile.path}");
                },
                child: Container(
                  width: 180,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 6,
                        )
                      ]),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: AssetImage("images/select_file.jpg"),
                        width: 130,
                      ),
                      Text(
                        "Select Audio 3",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   children: [
          //     Text(""),
          //     Text(""),
          //     Text(""),
          //   ],
          // ),
          SizedBox(
            height: 10,
          ),
          // SUBMIT BUTTON
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
            child: Text("Submit"),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
