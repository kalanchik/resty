import 'package:flutter/material.dart';
import 'package:postmanovich/domain/entity/request/request_response.dart';
import 'package:postmanovich/domain/entity/response/response_status_code.dart';

class ResponseInfoRow extends StatelessWidget {
  const ResponseInfoRow({
    super.key,
    required this.responseNotifier,
  });

  final ValueNotifier<RequestResponse?> responseNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: responseNotifier,
      builder: (context, value, _) {
        return Row(
          spacing: 16.0,
          children: [
            if (value != null && value.statusCode != null) ...{
              DecoratedBox(
                decoration: BoxDecoration(
                  color: switch (value.statusCode!) {
                    ResponseStatusCodeInfo() => Colors.blue,
                    ResponseStatusCodeSuccess() => Colors.green,
                    ResponseStatusCodeRedirect() => Colors.yellow,
                    ResponseStatusCodeClientError() => Colors.red,
                    ResponseStatusCodeServerError() => Colors.red,
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "${value.statusCode!.statusCode.toString()} ${value.statusCode!.statusName(context)}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            },
            if (value != null) ...{
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("${value.responseTime} ms"),
                ),
              ),
            }
          ],
        );
      },
    );
  }
}
