import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: context.primaryColor,
      obscureText: widget.isPassword && !_isPasswordVisible,
      autofillHints: const [AutofillHints.email, AutofillHints.username],
      decoration: InputDecoration(
        filled: true,
        fillColor: context.surfaceColor,
        hintText: widget.hint,
        hintStyle: AppStyles.regular14(context),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: _buildBorder(Colors.transparent),
        enabledBorder: _buildBorder(Colors.transparent),
        focusedBorder: _buildBorder(context.primaryColor),
        suffixIcon: Visibility(
          visible: widget.isPassword,
          child: IconButton(
            onPressed: () =>
                setState(() => _isPasswordVisible = !_isPasswordVisible),
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: _isPasswordVisible
                  ? context.primaryColor
                  : context.subTextColor,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
