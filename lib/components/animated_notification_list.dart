import 'package:flutter/material.dart';

class AnimatedNotificationList extends StatefulWidget {
  final List<Widget> children;
  final Duration delay;

  const AnimatedNotificationList({
    Key? key,
    required this.children,
    this.delay = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  State<AnimatedNotificationList> createState() =>
      _AnimatedNotificationListState();
}

class _AnimatedNotificationListState extends State<AnimatedNotificationList> {
  int visibleItems = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    while (visibleItems < widget.children.length) {
      await Future.delayed(widget.delay);
      if (mounted) {
        setState(() {
          visibleItems++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: visibleItems,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return AnimatedListItem(
          child: widget.children[index],
        );
      },
    );
  }
}

class AnimatedListItem extends StatelessWidget {
  final Widget child;

  const AnimatedListItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        // Ensure opacity value is clamped between 0.0 and 1.0
        final clampedOpacity = value.clamp(0.0, 1.0);

        return Transform.translate(
          offset: Offset(0, -50 * (1 - value)),
          child: Transform.scale(
            scale: value,
            child: Opacity(
              opacity: clampedOpacity,
              child: child,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: child,
      ),
    );
  }
}
