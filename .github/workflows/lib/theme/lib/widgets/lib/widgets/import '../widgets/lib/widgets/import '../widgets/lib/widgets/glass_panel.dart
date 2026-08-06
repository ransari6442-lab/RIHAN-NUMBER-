import 'dart:ui';
import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const GlassPanel({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 12,
          sigmaY: 12,
        ),
        child: Container(
          padding: padding ?? const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.12),
                Colors.white.withOpacity(0.04),
              ],
            ),
            border: Border.all(
              color: Colors.purpleAccent.withOpacity(0.7),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purpleAccent.withOpacity(0.35),
                blurRadius: 35,
                spreadRadius: 3,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
