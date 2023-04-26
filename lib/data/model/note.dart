class Note {
  late int _id;
  late String _content;

  Note.fromData(id, content) {
    _id = id;
    _content = content;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
    };
  }

  @override
  String toString() {
    return 'Note{id: $id, content: $content}';
  }
}
