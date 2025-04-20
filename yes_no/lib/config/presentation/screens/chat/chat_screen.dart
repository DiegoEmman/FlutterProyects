import 'package:flutter/material.dart';
import 'package:yes_no/config/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no/config/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no/config/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary.withValues(alpha: 0.5),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://oem.com.mx/tribunadesanluis/img/13923017/1715254152/BASE_LANDSCAPE/480/image.webp',
            ),
          ),
        ),
        title: const Text('Kokun '),
      ),
      body: _ChatView()
    );
  }

  

}

class _ChatView extends StatelessWidget {
  // const _ChatView({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {

                  return (index % 2 == 0)
                      ? const MyMesaggeBubble( 
                          message: 'Hola, ¿cómo estás?',
                        )
                      : const HisMessageBubble();
                },
              ),
            ),
            MessageFieldBox(),
          ],
        )
      ),

    );
  }
}