import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final List<TextInputFormatter>? Inputformatter;
  Function(String)? onChanged;

  String? Function(String?)? validator;
  TextEditingController? controller;

  TextFieldWidget(
      {Key? key,
      this.maxLines = 1,
      required this.label,
      required this.text,
      this.validator,
      this.controller,
      this.Inputformatter,
      this.onChanged})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller?.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          inputFormatters: widget.Inputformatter,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: widget.maxLines,
        )
      ],
    );
  }
}
