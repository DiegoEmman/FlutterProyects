import 'package:flutter/material.dart';

class HisMessageBubble extends StatelessWidget {
  const HisMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'lorem ipsum dolor sit amet',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        _ImageBubble(),
        const SizedBox(
          height: 10.0,
        ),

      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        'https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif',
        width: size.width * 0.75,
        height: 160.0,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
            width: size.width * 0.75,
            height: 160.0,
            child: Text('Loading...'),
            
          );
        },
      ),
      


    );
  }
}