import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';

class PasswordTextFieldRow extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Icon icon;
  bool isPasswordVisible;
  final bool isPassword;
  double width;
  double height;
  final bool filled;
  PasswordTextFieldRow({
    required this.label,
    required this.hint,
    required this.controller,
    required this.icon,
    this.isPasswordVisible = false,
    this.isPassword = false,
    this.height = 0,
    this.width = 0,
    this.filled = false,
    super.key,
  });

  @override
  State<PasswordTextFieldRow> createState() => _PasswordTextFieldRowState();
}

class _PasswordTextFieldRowState extends State<PasswordTextFieldRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 50),
                Text(
                  widget.label ?? '',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon ?? SizedBox(),
                SizedBox(width: 10),
                SizedBox(
                  height: widget.height != 0 ? widget.height : 38,
                  width: widget.width != 0 ? widget.width : 258,
                  child: TextFormField(
                    validator: (value) {
                      if (widget.filled == true) {
                        if (value!.isEmpty) {
                          return 'Please enter a ${widget.label}';
                        }
                      }
                      return null;
                    },
                    controller: widget.controller,
                    obscureText: !widget.isPasswordVisible,
                    cursorColor: AppColors.accentColor,
                    decoration: InputDecoration(
                      suffixIcon:
                          widget.isPassword
                              ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.isPasswordVisible =
                                        !widget.isPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  widget.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.accentColor,
                                ),
                              )
                              : null,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      hintText: widget.hint,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: AppColors.accentColor,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: AppColors.accentColor,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: AppColors.accentColor,
                          width: 2.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.scaleHeight(10)),
          ],
        ),
      ),
    );
  }
}
