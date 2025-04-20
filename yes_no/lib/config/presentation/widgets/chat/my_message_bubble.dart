import 'package:flutter/material.dart';

class MyMesaggeBubble extends StatelessWidget {

    final String message;


  const MyMesaggeBubble({
    super.key, 
    required this.message
  });



  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'Hola, ¿cómo estás?',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}