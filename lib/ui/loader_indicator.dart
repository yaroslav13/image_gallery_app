import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:imagegallerytest/resources/app_colors.dart';

class LoadingIndicator extends StatefulWidget {
  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  static const _loaderDotSize = 6.0;
  static const _loaderPadding = 2.0;
  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 275),
    );
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
    _sizeAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_curve);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _loaderDotSize * 4 + _loaderPadding * 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: _loaderPadding),
            height: _loaderDotSize * _sizeAnimation.value,
            width: _loaderDotSize * _sizeAnimation.value,
            decoration: BoxDecoration(
              color:
                  AppColors.onPrimary.withOpacity(_sizeAnimation.value - 0.7),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: _loaderPadding),
            height: _loaderDotSize * (2.5 - _sizeAnimation.value),
            width: _loaderDotSize * (2.5 - _sizeAnimation.value),
            decoration: BoxDecoration(
              color:
                  AppColors.onPrimary.withOpacity((1.8 - _sizeAnimation.value)),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: _loaderPadding),
            height: _loaderDotSize * _sizeAnimation.value,
            width: _loaderDotSize * _sizeAnimation.value,
            decoration: BoxDecoration(
              color:
                  AppColors.onPrimary.withOpacity(_sizeAnimation.value - 0.7),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
