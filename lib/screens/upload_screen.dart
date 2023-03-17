import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:upload_files/models/file_model.dart';
import 'package:upload_files/widgets/app_text.dart';
import 'package:upload_files/widgets/upload_button.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({Key? key}) : super(key: key);

  final List<String> dragFiles = [
    'Prototype recording 03.mp4',
    'Prototype recording 04.mp4',
    'Prototype recording 05.mp4',
  ];

  final Map<String, FileModel> uploadingFiles = {
    'Prototype recording 01.mp4':
        FileModel('Prototype recording 01.mp4', 20, 20),
    'Prototype recording 02.mp4':
        FileModel('Prototype recording 02.mp4', 40, 16),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 300, right: 300, top: 20, bottom: 20),
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0.5, 5.0))
                ]),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            text: 'Upload and attach files',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            textColor: Colors.black,
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset('assets/icons/diamond-star.png'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AppText(
                        text: 'Upload and attach files to this project.',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 170,
                        decoration: DottedDecoration(
                            shape: Shape.box,
                            color: Colors.black.withOpacity(0.6),
                            strokeWidth: 2.0,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Icon(
                                  Icons.file_present_sharp,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 80,
                                ),
                                const Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.cloud_upload,
                                      color: Colors.black,
                                      size: 30,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Click to upload',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.7)),
                                    )),
                                const AppText(
                                  text: 'or drag and drop',
                                  fontSize: 18,
                                )
                              ],
                            ),
                            const AppText(
                              text: 'Maximum file size 50 MB',
                              fontSize: 15,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 250,
                        child: SingleChildScrollView(
                          child: Column(
                            children: uploadingFiles.entries
                                .map((file) => Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      padding: const EdgeInsets.all(15),
                                      height: 95,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: (file.value.uploadedFileSize!
                                                                .toDouble() /
                                                            file.value
                                                                .totalFileSize!
                                                                .toDouble())
                                                        .round() ==
                                                    1
                                                ? Colors.black.withOpacity(0.6)
                                                : Colors.grey.withOpacity(0.3),
                                            width: 1.5),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1.0,
                                                    color: Colors.grey
                                                        .withOpacity(0.3))),
                                            child: const Icon(
                                                Icons.local_movies_outlined),
                                          ),
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AppText(
                                                      text: file.key,
                                                      textColor: Colors.black
                                                          .withOpacity(0.7),
                                                      fontSize: 16,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {},
                                                        child: const Icon(
                                                            Icons.close))
                                                  ],
                                                ),
                                                AppText(
                                                  text:
                                                      '${file.value.uploadedFileSize!.round()} MB',
                                                  textColor: Colors.black
                                                      .withOpacity(0.6),
                                                  fontSize: 14,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: SizedBox(
                                                          height: 10,
                                                          child: LinearProgressIndicator(
                                                              valueColor: const AlwaysStoppedAnimation<
                                                                      Color>(
                                                                  Colors.black),
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .withOpacity(
                                                                          0.3),
                                                              value: (file.value
                                                                      .uploadedFileSize!
                                                                      .toDouble()) /
                                                                  (file.value
                                                                      .totalFileSize!
                                                                      .toDouble())),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    AppText(
                                                      text:
                                                          '${((file.value.uploadedFileSize!.toDouble()) / (file.value.totalFileSize!.toDouble()) * 100).round()}%',
                                                      textColor: Colors.black
                                                          .withOpacity(0.6),
                                                      fontSize: 15,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: 0,
                    left: 0,
                    bottom: 100,
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.3),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 60,
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: const UploadButton(
                              text: 'Cancel',
                              textColor: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: const UploadButton(
                              text: 'Upload files',
                              buttonColor: Colors.black,
                              textColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 270,
            left: 1050,
            top: 200,
            child: ListView(
              shrinkWrap: true,
              children: [
                for (String file in dragFiles)
                  Container(
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: AppText(
                        text: file,
                        textColor: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
