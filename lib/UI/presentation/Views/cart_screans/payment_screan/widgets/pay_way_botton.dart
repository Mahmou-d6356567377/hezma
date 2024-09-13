import 'package:flutter/material.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class PayWayBotton extends StatelessWidget {
  const PayWayBotton({
    super.key,
    required this.title,
    required this.img,
    required this.id,
    required this.desc,
    required this.isSelected, // Pass whether this button is selected
  });

  final String title;
  final String? img;
  final String desc;
  final int id;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(backgroundcustomgreen2)
              : Colors.white, // Change color based on selection
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: isSelected
                    ? arabicstyle5.copyWith(fontSize: 10, color: Colors.white)
                    : arabicstyle2.copyWith(fontSize: 10),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  img != null && img!.isNotEmpty
                      ? Image.network(img!, height: 30, width: 30)
                      : const Icon(Icons.image, size: 30),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(desc, style: arabicstyle5.copyWith(fontSize: 8)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
