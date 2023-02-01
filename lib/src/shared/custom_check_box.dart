import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      shadowColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      labelPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      onPressed: () => onChanged(!value),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      disabledColor: const Color(0xFFF8F8F8),
      backgroundColor: const Color(0xFFF8F8F8),
      label: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: const Color(0xFFDADADA),
            width: 2,
          ),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 20,
              )
            : null,
      ),
    );
  }
}
