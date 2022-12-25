import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text = 'Button',
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}