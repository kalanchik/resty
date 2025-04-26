import 'package:flutter/material.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';

class CollectionRequest extends StatelessWidget {
  const CollectionRequest({
    super.key,
    required this.request,
  });

  final RequestItem request;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.0,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: switch (request.method) {
              HttpMethodGet() => Colors.green,
              HttpMethodPost() => Colors.amber,
            },
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(request.method.toCurl()),
          ),
        ),
        Text(
          request.name,
        ),
      ],
    );
  }
}
