import 'package:flutter/material.dart';

class WaterJugTextFormFieldWidget extends StatelessWidget {
  const WaterJugTextFormFieldWidget({
    super.key,
    required TextEditingController controller,
    required Function(String) onChanged,
    required this.hintText,
    required this.labelText,
  })  : _controller = controller,
        _onChanged = onChanged;

  final TextEditingController _controller;
  final Function(String value) _onChanged;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        label: Text(labelText),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        hintText: hintText,
      ),
      onChanged: _onChanged,
    );
  }
}
