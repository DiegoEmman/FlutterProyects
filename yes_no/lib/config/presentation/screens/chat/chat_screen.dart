import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no/config/presentation/providers/chat_providers.dart';
import 'package:yes_no/config/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no/config/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no/domain/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: Colors.black,
        backgroundColor: colors.primary.withValues(alpha: 0.5),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://studiofutbol.com.ec/wp-content/uploads/2023/01/FnubAW9XkAYvnDR.jpg',
            ),
          ),
        ),
        title: const Text('Leo Messi', style: TextStyle(color: Colors.white),),
      ),
      body: _ChatView()
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.scrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];
                    return (message.fromWho == FromWho.his)
                        ? HisMessageBubble(message: message,)
                        : MyMesaggeBubble(message: message);
                  },
              ),
            ),
             MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value),),
          ],
        )
      ),
    );
  }
}

class MessageFieldBox extends StatefulWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        width: 1,
      ),
    );

    final inputDecoration = InputDecoration(
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      hintText: 'Type a message',
      fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = _controller.value.text;
          if (textValue.trim().isNotEmpty) {
            widget.onValue(textValue);
            _controller.clear();
            _focusNode.requestFocus(); // Mantén el foco después de enviar
          }
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      focusNode: _focusNode,
      controller: _controller,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          widget.onValue(value);
          _controller.clear();
          _focusNode.requestFocus(); // Mantén el foco después de enviar
        }
      },
    );
  }
}