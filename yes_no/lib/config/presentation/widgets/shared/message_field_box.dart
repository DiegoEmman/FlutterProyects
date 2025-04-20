import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
        width: 1,
      ),
    );

    final inputDecoration = InputDecoration(
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        hintText: 'Type a message',
        fillColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        suffixIcon: IconButton(
          onPressed: () {
            print('Send message: ${controller.text}');
            controller.clear();
            focusNode.requestFocus();

          },
          icon: const Icon(Icons.send_outlined),
        ),
      );



    
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: controller,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        controller.clear();
        focusNode.requestFocus();
      },
        
      
    );
  }
}