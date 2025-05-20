import 'package:flutter/material.dart';
import 'package:tasktrek/styles/styles.dart';
import 'package:tasktrek/widgets/mediaSize.dart';

class PasswordFieldRow extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final Icon? icon;

  const PasswordFieldRow({
    this.label,
    this.hint,
    this.controller,
    this.icon,
    super.key,
  });

  @override
  State<PasswordFieldRow> createState() => _PasswordFieldRowState();
}

class _PasswordFieldRowState extends State<PasswordFieldRow> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: SizeConfig.scaleWidth(55)),
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
                height: SizeConfig.scaleHeight(38),
                width: SizeConfig.scaleWidth(258),
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: _obscure,
                  cursorColor: AppColors.accentColor,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.accentColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                    hintText: widget.hint,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
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
    );
  }
}
