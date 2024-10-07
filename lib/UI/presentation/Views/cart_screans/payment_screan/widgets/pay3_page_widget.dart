import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/UI/presentation/Views/auth_screans/register_screan/widgets/customTextField.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/text_row.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:image_picker/image_picker.dart';

class Pay3PageWidget extends StatefulWidget {
  const Pay3PageWidget({
    Key? key,
    required this.firstController,
    required this.secondController,
    required this.thirdController,
    required this.fourthController,
    required this.onImageSelected,
  }) : super(key: key);

  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final TextEditingController fourthController;
  final ValueChanged<File?> onImageSelected;

  @override
  State<Pay3PageWidget> createState() => _Pay3PageWidgetState();
}

class _Pay3PageWidgetState extends State<Pay3PageWidget> {
  File? _image;

  Future _pickImg(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        widget.onImageSelected(_image); 
        GoRouter.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      GoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'مؤسسة حزمه',
                  style: arabicstyle1.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
          const TextRow(title: 'رقم المؤسسه'),
          CustomTextField(
            hintText: '',
            prefixIcon: const Icon(Icons.data_saver_on),
            controller: widget.firstController,
          ),
          const TextRow(title: 'رقم المحمول'),
          CustomTextField(
            hintText: '',
            prefixIcon: const Icon(Icons.data_saver_on),
            controller: widget.secondController,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Text(
                      'صورة الايصال',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width,
                                            50),
                                        padding: const EdgeInsets.all(16.0),
                                      ),
                                      onPressed: () {
                                        _pickImg(ImageSource.gallery);
                                      },
                                      child: const Text(
                                        'المعرض',
                                        style: arabicstyle2,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text('او', style: arabicstyle1),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width,
                                            50),
                                        padding: const EdgeInsets.all(16.0),
                                      ),
                                      onPressed: () {
                                        _pickImg(ImageSource.camera);
                                      },
                                      child: const Text(
                                        'الكاميرا',
                                        style: arabicstyle2,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(darkwhite),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: _image == null
                                  ? null
                                  : FileImage(_image!), 
                              child: _image == null
                                  ? const Icon(Icons.camera_alt)
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const TextRow(title: 'اسم البنك'),
                    CustomTextField(
                      hintText: '',
                      prefixIcon: const Icon(Icons.recommend_rounded),
                      controller: widget.thirdController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
