import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, {super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(AniProps.opacity, 0.0.tweenTo(1.0), duration: 500.milliseconds)
      ..tween(
        AniProps.translateY,
        (-30.0).tweenTo(0.0),
        duration: 500.milliseconds,
        curve: Curves.easeOut,
      );

    return PlayAnimationBuilder<Movie>(
      tween: tween,
      delay: (500 * delay).round().milliseconds, // ✅
      duration: tween.duration,
      builder: (context, value, _) {
        return Opacity(
          opacity: value.get(AniProps.opacity),
          child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY)),
            child: child,
          ),
        );
      },
    );
  }
}
