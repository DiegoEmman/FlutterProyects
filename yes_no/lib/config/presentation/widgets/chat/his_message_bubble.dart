import 'package:flutter/material.dart';
import 'package:yes_no/domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {
  
  final Message message;

  const HisMessageBubble({
    super.key, required this.message
  });

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
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        _ImageBubble(message: message,),
        const SizedBox(
          height: 10.0,
        ),

      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final Message message;
  const _ImageBubble({
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        message.imageUrl ?? 'https://i.pinimg.com/originals/3c/4b/0d/3c4b0d1f2a5e7f8a6e9f2a5e7f8a6e9f.jpg',
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