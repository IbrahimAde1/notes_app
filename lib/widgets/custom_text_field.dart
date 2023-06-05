import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.maxline = 1,
    required this.title,
    required this.onsaved,
    this.initialValue,
    required this.onChanged,
  });

  final String title;
  final String? initialValue;
  final void Function(String?) onsaved;
  final void Function(String?) onChanged;

  final int maxline;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: widget.initialValue,
        validator: (val) {
          if (val?.isEmpty ?? true) {
            return 'this field is required';
          } else {
            return null;
          }
        },
        onChanged: widget.onChanged,
        onSaved: widget.onsaved,
        onFieldSubmitted: widget.onsaved,
        maxLines: widget.maxline,
        decoration: InputDecoration(
            hintText: widget.title,
            hintStyle: TextStyle(color: ThemeData.dark().colorScheme.secondary),
            enabledBorder: circleBorder(const Color(0xffffffff)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }

  OutlineInputBorder circleBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: color ?? const Color(0xffffffff)));
  }
}
