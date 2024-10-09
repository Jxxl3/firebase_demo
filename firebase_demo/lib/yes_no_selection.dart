import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_state.dart';

class AttendeeSelection extends StatelessWidget {
  const AttendeeSelection({
    super.key,
    required this.state,
    required this.onChanged,
  });

  final int state;
  final void Function(int count) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text('Number of attendees: '),
          SizedBox(
            width: 64,
            child: TextFormField(
              initialValue: state.toString(),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                final count = int.tryParse(value) ?? 0;
                onChanged(count);
              },
            ),
          ),
        ],
      ),
    );
  }
}