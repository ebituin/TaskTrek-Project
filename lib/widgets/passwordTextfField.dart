import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;

  const PasswordTextField({Key? key, this.controller, this.label}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12), // leave space for label
          child: SizedBox(
            width: 300,
            height: 40,
            child: TextField(
              controller: widget.controller,
              obscureText: _obscureText,
              cursorColor: AppColors.accentColor,
              cursorHeight: 15,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.accentColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.accentColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(
                      size: 20,
                      _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppColors.accentColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          left: 12,
          top: 0,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              widget.label ?? 'No label',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
