import 'package:flutter/material.dart';



class SentenceTextField extends StatefulWidget {
  @override
  _SentenceTextField createState() => _SentenceTextField();
}

class _SentenceTextField extends State<SentenceTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _controller,
          maxLines: null, // Allows the text field to grow as more lines are added
          minLines: 5, // Sets a minimum height for the text field
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[850],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 2.0,
              ),
            ),
            labelText: 'Enter your sentence(s)',
            labelStyle: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
            alignLabelWithHint: true, // Aligns the label with the hint text
            contentPadding: EdgeInsets.all(16.0),
          ),
        ),
        const SizedBox(height: 20),
        
      ],
    );
  }
}