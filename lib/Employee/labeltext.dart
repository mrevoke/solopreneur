import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const LabeledTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.18 / 3;

    return Container(
      color: Color.fromARGB(255, 251, 254, 255),
      width: MediaQuery.of(context).size.width * 0.23,
      height: containerHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: containerHeight,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: containerHeight / 10 * 3,
                ),
                labelText: labelText,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
