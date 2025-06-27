import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';

class KurbanBackgroundImage extends StatefulWidget {
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
  State<KurbanBackgroundImage> createState() => _KurbanBackgroundImageState();
}

class _KurbanBackgroundImageState extends State<KurbanBackgroundImage> {
  late S lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.linearGradientColors)
          .createShader(rect),
      blendMode: BlendMode.darken,
      child: Image.network(
        widget.photoUrl,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) => loadingProgress ==
                null
            ? child
            : Container(
                width: widget.width ?? double.infinity,
                height: widget.height ?? 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black87,
                      Colors.black54,
                      Colors.black87
                    ])),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white.withValues(alpha: .8)),
                          backgroundColor: Colors.white.withValues(alpha: .2),
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (loadingProgress.expectedTotalBytes != null)
                        Text(
                          "${((loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!) * 100).toInt()}%",
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: .6),
                              fontSize: 12),
                        )
                    ],
                  ),
                ),
              ),
        errorBuilder: (context, error, stackTrace) => Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.black87,
                Colors.grey.shade800,
                Colors.black87
              ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.broken_image_outlined,
                  size: 48,
                  color: Colors.white.withValues(alpha: .7),
                ),
                const SizedBox(height: 12),
                Text(
                  lang.imageNotLoaded,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: .8),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
