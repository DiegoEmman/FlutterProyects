import 'package:yes_no/domain/entities/message.dart';


class YesNoModel{


  String answer;
  String imageUrl;
  bool forced;

  YesNoModel({
    required this.answer,
    required this.imageUrl,
    required this.forced,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) {
    return YesNoModel(
      answer: json['answer'],
      imageUrl: json['image'],
      forced: json['forced'],
    );
  }


  Message toMessageEntity(){
    if (answer == 'yes'){
        answer = 'Sí';
    }else if (answer == 'maybe'){
        answer = 'Tal vez';
    }else if (answer == 'no'){
        answer = 'No';
    }
    final message = Message(
      text: answer,
      imageUrl: imageUrl,
      fromWho: FromWho.his,
    );
    return message;
  }

}