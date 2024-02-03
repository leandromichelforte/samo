import 'package:flutter/material.dart';

class ErrorDialogWidget extends StatelessWidget {
  const ErrorDialogWidget({
    required this.errorMessage,
    super.key,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close_rounded,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(errorMessage),
      ],
    );
  }
}
