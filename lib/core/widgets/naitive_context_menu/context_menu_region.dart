import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef ContextMenuBuilder = Widget Function(
  BuildContext context,
  Offset offset,
);

/// Shows and hides the context menu based on user gestures.
///
/// By default, shows the menu on right clicks and long presses.
class ContextMenuRegion extends StatefulWidget {
  /// Creates an instance of [ContextMenuRegion].
  const ContextMenuRegion({
    super.key,
    this.enableLeftClick = false,
    required this.contextMenuBuilder,
    required this.child,
  });

  /// Builds the context menu.
  final ContextMenuBuilder contextMenuBuilder;

  final bool enableLeftClick;

  /// The child widget that will be listened to for gestures.
  final Widget child;

  @override
  State<ContextMenuRegion> createState() => _ContextMenuRegionState();
}

class _ContextMenuRegionState extends State<ContextMenuRegion> {
  Offset? _longPressOffset;

  final ContextMenuController _contextMenuController = ContextMenuController();

  static bool get _longPressEnabled {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return true;
      case TargetPlatform.macOS:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
    }
  }

  // Обработчик для левой кнопки мыши
  void _onLeftClick(PointerDownEvent event) {
    if (widget.enableLeftClick && event.buttons == kPrimaryMouseButton) {
      _show(event.position);
    }
  }

  void _onSecondaryTapUp(TapUpDetails details) {
    _show(details.globalPosition);
  }

  void _onTap() {
    if (!_contextMenuController.isShown) {
      return;
    }
    _hide();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    _longPressOffset = details.globalPosition;
  }

  void _onLongPress() {
    assert(_longPressOffset != null);
    _show(_longPressOffset!);
    _longPressOffset = null;
  }

  void _show(Offset position) {
    _contextMenuController.show(
      context: context,
      contextMenuBuilder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _hide,
                child: Container(color: Colors.transparent),
              ),
            ),
            widget.contextMenuBuilder(context, position),
          ],
        );
      },
    );
  }

  void _hide() {
    _contextMenuController.remove();
  }

  @override
  void dispose() {
    _hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onLeftClick,
      child: widget.enableLeftClick
          ? widget.child
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onSecondaryTapUp: _onSecondaryTapUp,
              onTap: _onTap,
              onLongPress: _longPressEnabled ? _onLongPress : null,
              onLongPressStart: _longPressEnabled ? _onLongPressStart : null,
              child: widget.child,
            ),
    );
  }
}
