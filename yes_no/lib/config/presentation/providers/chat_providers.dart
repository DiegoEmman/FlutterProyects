import 'package:flutter/material.dart';
import 'package:yes_no/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  
  ScrollController scrollController = ScrollController();
  GetYesNoAnswer  getYesNoAnswer = GetYesNoAnswer();

  
  List<Message> messageList = [
    
    Message(
      text: 'Hola, ¿cómo estás?',
      fromWho: FromWho.me,
    ),
  ];


  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;


    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    );

    messageList.add(newMessage);

    if(text.endsWith('?')){
      hisMessageReplay();
    }

    moveScrolltoBottom();
    notifyListeners();
  }

  Future<void> moveScrolltoBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> hisMessageReplay() async {
    final hisResponse = await getYesNoAnswer.getAnswer();
    messageList.add(hisResponse);
    moveScrolltoBottom();
    notifyListeners();

  }


}