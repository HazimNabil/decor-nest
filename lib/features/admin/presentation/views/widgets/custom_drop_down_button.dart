import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final String? currentValue;
  final String? hint;
  final List<String> values;

  const CustomDropDownButton({
    super.key,
    this.currentValue,
    required this.values,
    this.hint,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: _selectedValue,
        hint: widget.hint != null ? Text(widget.hint!) : null,
        elevation: 0,
        isExpanded: true,
        borderRadius: BorderRadius.circular(12),
        underline: const SizedBox.shrink(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        menuMaxHeight: 200,
        style: AppStyles.medium16(context),
        items: List.generate(
          widget.values.length,
          (index) => DropdownMenuItem(
            value: widget.values[index],
            child: Text(widget.values[index]),
          ),
        ),
        onChanged: (value) => setState(() => _selectedValue = value),
      ),
    );
  }
}
