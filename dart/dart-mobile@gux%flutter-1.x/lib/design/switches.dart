
import 'package:flutter/material.dart';

class IconSwitch extends StatefulWidget {

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  IconData? activeIconData;
  IconData? inactiveIconData;
  final Color thumbColor;

  IconSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.thumbColor = Colors.white,
    this.activeIconData,
    this.inactiveIconData,
  }) : super(key: key);

  @override
  _IconSwitchState createState() => _IconSwitchState();
}

class _IconSwitchState extends State<IconSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _thumbAlignment;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.value ? 1.0 : 0.0,
    );
    _thumbAlignment = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant IconSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: 64.0,
            height: 32.0, // Adjust size as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), // Half of height for perfect circle thumb
              color: widget.value ? widget.activeColor : widget.inactiveColor,
            ),
            child: Align(
              alignment: _thumbAlignment.value,
              child: Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.value ? widget.activeColor : widget.inactiveColor,
                    width: 2.0,
                  ),
                  color: widget.thumbColor,
                ),
                child: Center(
                  child: widget.value ?
                  Icon(widget.activeIconData, size: 24, color: widget.activeColor) :
                  Icon(widget.inactiveIconData, size: 24, color: widget.inactiveColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget {

  final bool value;
  final ValueChanged<bool> onChanged;

  ThemeSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  ThemeSwitchState createState() => ThemeSwitchState();
}

class ThemeSwitchState extends State<ThemeSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _thumbAlignment;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.value ? 1.0 : 0.0,
    );
    _thumbAlignment = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant ThemeSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: 64.0,
            height: 32.0, // Adjust size as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), // Half of height for perfect circle thumb
              image: DecorationImage(
                image: widget.value ?
                AssetImage('asset/image/theme/dark_background.png') :
                AssetImage('asset/image/theme/light_background.png'),
              ),
            ),
            child: Align(
              alignment: _thumbAlignment.value,
              child: Container(
                width: 31.0,
                height: 31.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(
                  //   color: widget.value ? widget.activeColor : widget.inactiveColor,
                  //   width: 2.0,
                  // ),
                  // color: widget.thumbColor,
                ),
                child: Center(
                  child: widget.value ?
                  Image.asset('asset/image/theme/dark_icon.png') :
                  Image.asset('asset/image/theme/light_icon.png'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}