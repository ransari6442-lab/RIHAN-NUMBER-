import 'package:flutter/material.dart';

class GlowingBall extends StatefulWidget {
  final String number;
  final double size;

  const GlowingBall({
    super.key,
    required this.number,
    this.size = 90,
  });

  @override
  State<GlowingBall> createState() => _GlowingBallState();
}

class _GlowingBallState extends State<GlowingBall>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scale = Tween<double>(
      begin: 0.92,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scale.value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                colors: [
                  Colors.white,
                  Color(0xffF5F5F5),
                  Color(0xffDDDDDD),
                ],
              ),
              border: Border.all(
                color: Colors.red,
                width: 7,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.8),
                  blurRadius: 30,
                  spreadRadius: 6,
                ),
              ],
            ),
            child: Center(
              child: Text(
                widget.number,
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
