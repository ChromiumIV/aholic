import 'dart:convert';

import 'package:flutter/material.dart';

class AhlAvatar extends StatelessWidget {
  const AhlAvatar({
    Key? key,
    required this.encodedImageData,
    this.size = 42,
  }) : super(key: key);

  final String encodedImageData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Image.memory(
        width: size,
        height: size,
        base64Decode(encodedImageData),
      ),
    );
  }
}
