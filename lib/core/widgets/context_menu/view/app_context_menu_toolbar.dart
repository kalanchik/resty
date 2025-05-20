import 'package:flutter/material.dart';

class AppContextMenuToolbar extends StatefulWidget {
  const AppContextMenuToolbar({
    super.key,
    required this.offset,
    required this.child,
  });

  final Offset offset;
  final Widget child;

  @override
  State<AppContextMenuToolbar> createState() => _AppContextMenuToolbarState();
}

class _AppContextMenuToolbarState extends State<AppContextMenuToolbar> {
  final GlobalKey _menuKey = GlobalKey();
  late Offset _adjustedOffset;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _adjustedOffset = widget.offset;
    WidgetsBinding.instance.addPostFrameCallback((_) => _adjustPosition());
  }

  void _adjustPosition() {
    final renderBox = _menuKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final menuSize = renderBox.size;
    final screenSize = MediaQuery.of(context).size;

    double newLeft = _adjustedOffset.dx;
    double newTop = _adjustedOffset.dy;

    // Корректировка по горизонтали
    if (newLeft + menuSize.width > screenSize.width) {
      newLeft = screenSize.width - menuSize.width;
    }
    if (newLeft < 0) newLeft = 0;

    // Корректировка по вертикали
    if (newTop + menuSize.height > screenSize.height) {
      newTop = screenSize.height - menuSize.height;
    }
    if (newTop < 0) newTop = 0;

    if (mounted) {
      setState(() {
        _adjustedOffset = Offset(newLeft, newTop);
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      left: _adjustedOffset.dx,
      top: _adjustedOffset.dy,
      child: Material(
        color: Colors.transparent,
        child: Opacity(
          opacity: _isInitialized ? 1.0 : 0.0,
          child: KeyedSubtree(
            key: _menuKey,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
