import 'package:flutter/material.dart';

class DefaultOutlinedButton extends StatelessWidget {
  const DefaultOutlinedButton({
    required this.label,
    required this.onPressed,
    this.height,
    this.width,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size(
          width ?? screenSize.width,
          height ?? screenSize.height * 0.06,
        ),
      ),
      onPressed: () {
        if (!isLoading) onPressed();
      },
      child: isLoading
          ? SizedBox(
              height: screenSize.height * 0.035,
              width: screenSize.height * 0.035,
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : Text(label),
    );
  }
}
