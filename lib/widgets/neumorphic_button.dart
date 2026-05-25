import 'package:flutter/material.dart';

class NeumorphicButton extends StatelessWidget {
  final Widget child;
  final double size;
  final VoidCallback onTap;

  // Optional parameters to configure the button for use on dark backgrounds
  final Color? backgroundColor;
  final List<BoxShadow>? shadows;
  final EdgeInsets? padding;

  const NeumorphicButton({
    super.key,
    required this.child,
    required this.size,
    required this.onTap,
    this.backgroundColor,
    this.shadows,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: padding,
        decoration: BoxDecoration(
          // Use background color if provided (for dark backgrounds),
          // otherwise fallback to a generic off-white suitable for light mode
          color: backgroundColor ?? const Color(0xFFE0E5EC),
          shape: BoxShape.circle,
          // Use provided shadows (for dark backgrounds), otherwise fallback to the default light mode shadows
          boxShadow:
              shadows ??
              const [
                // Standard light shadows (lit from top-left)
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, -5),
                  blurRadius: 10,
                ),
                // Default dark shadows (for depth)
                BoxShadow(
                  color: Color(0xFFA3B1C6),
                  offset: Offset(5, 5),
                  blurRadius: 10,
                ),
              ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
