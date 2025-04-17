import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  
  int counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          actions: [
              IconButton(
                color: Colors.deepPurple,
                iconSize: 30.0,
                onLongPress: () {
                  setState(() {
                    counter++;
                  });
                },
                highlightColor: Colors.purpleAccent,
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
              ),
          ], 

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$counter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
              Text(counter == 1 ? 'Click' : 'Clicks', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w100),),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton
            (
              icon: Icons.refresh,
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
            ),
            const SizedBox(height: 10,),
            CustomButton(
              icon: Icons.exposure_plus_1,
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
            ),
            const SizedBox(height: 10,),
            CustomButton(icon: Icons.exposure_minus_1,
              onPressed: () {
                setState(() {
                  if (counter > 0) {
                    counter--;
                  }
                });
              },
            ),
            const SizedBox(height: 10,),
          ],
        ),
      );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key, required this.icon, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
      );
  }
}