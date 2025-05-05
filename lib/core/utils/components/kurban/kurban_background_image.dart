import 'package:flutter/material.dart';

class KurbanBackgroundImage extends StatelessWidget {
  final List<Color> linearGradientColors;
  final String photoUrl;
  final double? width;
  final double? height;

  const KurbanBackgroundImage(
      {super.key,
      required this.linearGradientColors,
      required this.photoUrl,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: linearGradientColors)
          .createShader(rect),
      blendMode: BlendMode.darken,
      child: Image.network(
        photoUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green.shade700, Colors.green.shade900])),
        ),
      ),
    );
  }
}
