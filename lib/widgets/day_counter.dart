import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/detail_provider.dart';

class DayCounter extends StatelessWidget {
  const DayCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DetailProvider>();

    return Row(
      children: [ 
        IconButton(
          onPressed: provider.decreaseDays,
          icon: const Icon(Icons.remove),
        ),
        Text("${provider.days}", style: const TextStyle(fontSize: 18)),
        IconButton(
          onPressed: provider.increaseDays,
          icon: const Icon(Icons.add),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.access_time),
        const SizedBox(width: 4),
        Text("${provider.days} Days"),
      ],
    );
  }
}
