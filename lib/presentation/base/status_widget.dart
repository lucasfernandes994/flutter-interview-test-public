import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/resources/styles.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';

class StatusWidget extends StatelessWidget {
  final String? status;

  const StatusWidget({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: status == Status.alive
                    ? Colors.green
                    : status == Status.dead
                        ? Colors.red
                        : Colors.grey),
          ),
          SizedBox(width: 4),
          Text(
            'Status: ${status ?? Status.unknown}',
            style: Styles.label,
          ),
        ],
      );
}
