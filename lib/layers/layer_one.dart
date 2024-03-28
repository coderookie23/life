import 'package:flutter/material.dart';
import 'package:hope/layers/config.dart';

class LayerOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(60.0),
        bottomRight: Radius.circular(60.0),
        bottomLeft: Radius.circular(60.0), // Add bottom left curve
      ),
      child: Opacity(
        opacity: 0.6,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 654,
          color: layerOneBg.withOpacity(0.4),
        ),
      ),
    );
  }
}
