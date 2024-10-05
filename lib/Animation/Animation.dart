import '../Export/AllExport.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation({required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(AniProps.opacity, 0.0.tweenTo(1.0), duration: 500.milliseconds)
      ..tween(AniProps.translateY, (-30.0).tweenTo(0.0),
          duration: 500.milliseconds, curve: Curves.easeIn);

    return PlayAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      builder: (context, value, child) {
        return Opacity(
          opacity: value.get(AniProps.opacity),
          child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
