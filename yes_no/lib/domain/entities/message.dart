enum FromWho { me, his }
class Message {
  String text;
  String? imageUrl;
  FromWho fromWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });

}