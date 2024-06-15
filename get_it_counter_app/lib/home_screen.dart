import 'package:flutter/material.dart';
import 'package:get_it_counter_app/counter_service.dart';
import 'package:get_it_counter_app/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final counterService = getIt<CounterService>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(child: Text(counterService.counter.toString())),
            const SizedBox.square(dimension: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionChip.elevated(
                    label: const Text('Decrement'),
                    onPressed: () => setState(() {
                          counterService.decrement();
                        })),
                const SizedBox.square(dimension: 10),
                ActionChip.elevated(
                    label: const Text('Increment'),
                    onPressed: () => setState(() {
                          counterService.increnment();
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
