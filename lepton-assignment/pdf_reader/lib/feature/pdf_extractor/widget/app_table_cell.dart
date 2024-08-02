import 'package:flutter/material.dart';

class AppTableCell extends StatelessWidget {
  final String text;
  final bool? isHeading;
  const AppTableCell({
    super.key,
    required this.text,
    this.isHeading,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: (isHeading ?? false)
                ? const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  )
                : const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
          ),
        ],
      ),
    );
  }
}
