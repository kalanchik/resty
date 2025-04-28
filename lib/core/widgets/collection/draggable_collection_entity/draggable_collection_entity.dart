import 'package:flutter/material.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';

class DraggableCollectionEntity extends StatelessWidget {
  const DraggableCollectionEntity({
    super.key,
    required this.entity,
    required this.feedbackBuilder,
    required this.childWhenDraggingBuilder,
    required this.child,
  });

  final CollectionEntity entity;
  final WidgetBuilder feedbackBuilder;
  final WidgetBuilder childWhenDraggingBuilder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<CollectionEntity>(
      data: entity,
      feedback: Material(
        color: Colors.transparent,
        child: feedbackBuilder(context),
      ),
      childWhenDragging: childWhenDraggingBuilder(context),
      child: child,
    );
  }
}
