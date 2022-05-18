import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget portrait, thickPortrait, landscape;
  const ResponsiveWidget({
    Key? key,
    required this.portrait,
    required this.thickPortrait,
    required this.landscape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isPortrait =
          MediaQuery.of(context).orientation == Orientation.portrait;
      double aspectRatio = constraints.maxWidth / constraints.maxHeight;
      if (isPortrait) {
        return aspectRatio > 0.55
            ? SingleChildScrollView(child: thickPortrait)
            : SingleChildScrollView(child: portrait);
      }
      return landscape;
    });
  }
}
