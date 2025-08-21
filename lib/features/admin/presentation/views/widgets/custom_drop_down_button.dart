import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final String currentValue;
  final List<String> values;

  const CustomDropDownButton({
    super.key,
    required this.currentValue,
    required this.values,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  late String _selectedValue;

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
        elevation: 0,
        isExpanded: true,
        borderRadius: BorderRadius.circular(12),
        underline: const SizedBox.shrink(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        menuMaxHeight: 200,
        style: AppStyles.medium16(context),
        items: List.generate(
          widget.values.length,
          (index) => DropdownMenuItem(
            value: widget.values[index],
            child: Text(widget.values[index]),
          ),
        ),
        onChanged: (value) => setState(() => _selectedValue = value!),
      ),
    );
  }
}
