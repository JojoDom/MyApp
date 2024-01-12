import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController controller,
    this.inputFormatters,
    this.hintText,  this.enabled, this.autofocus,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
   final bool? enabled;
   final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
     
      enabled: enabled,
      autofocus: autofocus ?? false,
      inputFormatters: inputFormatters,
      controller: _controller,
      
      cursorColor: const Color(0xFF2323360),
      style: const TextStyle(color:  Color(0xFF2323360), fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(        
        contentPadding: const EdgeInsets.all(8.0),
        
        labelStyle: const TextStyle(color: Color(0xFF8F92A1), fontSize: 14),
        hintText: hintText ?? '',
        hintStyle:
            TextStyle(color: Colors.grey[300],  fontSize: 16),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
       
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      
          
    );
  }
}
