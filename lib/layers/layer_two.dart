import 'package:flutter/material.dart';
import 'package:hope/layers/config.dart';

class LayerTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity:
          0.6, // Adjust opacity between 0.0 (fully transparent) and 1.0 (fully opaque)
      child: Container(
        width: 399,
        height: 584,
        decoration: const BoxDecoration(
          color: layerTwoBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0),
            bottomRight: Radius.circular(60.0),
            bottomLeft: Radius.circular(60.0),
          ),
        ),
      ),
    );
  }
}
