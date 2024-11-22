import 'package:flutter/material.dart';
import 'package:loda_attendance/core/utils/color_manager.dart';

import '../../../core/utils/styles_manager.dart';

defaultFormField({
  required TextEditingController controller,
  required String label,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      label: Text(label),
    ),
  );
}

defaultButton(String label) => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(
            ColorManager.primary,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyleManager.getButtonTextStyle(),
        ),
      ),
    );
