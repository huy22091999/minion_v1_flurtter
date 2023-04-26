import 'package:flutter/material.dart';
import 'package:minion_v1/data/model/note.dart';
import 'package:provider/provider.dart';

import 'note_bloc.dart';
import 'note_event.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 56,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tracking"),
        ),
        body: Provider<NoteBloc>.value(
          value: NoteBloc(),
          child: Column(
            children: const <Widget>[AddNoteWidget(), ListNoteWidget()],
          ),
        ),
      ),
    );
  }
}

class AddNoteWidget extends StatefulWidget {
  const AddNoteWidget({Key? key}) : super(key: key);

  @override
  State<AddNoteWidget> createState() => _AddNoteWidgetState();
}

class _AddNoteWidgetState extends State<AddNoteWidget> {
  TextEditingController noteText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NoteBloc bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        children: [
          TextField(
              minLines: 4,
              maxLines: 10,
              controller: noteText,
              style: const TextStyle(fontSize: 18, color: Colors.black),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                hintText: "Ngày hôm nay bạn đã làm gì?",
              )),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    backgroundColor: const Color.fromARGB(255, 13, 92, 148),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                    minimumSize: const Size.fromHeight(
                        40), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () => {
                        if (noteText.text.trim().isNotEmpty)
                          {
                            bloc.event.add(AddNoteEvent(noteText.text)),
                            noteText.text = ""
                          }
                      },
                  child: const Text("Thêm tracking"))),
        ],
      ),
    );
  }
}

class ListNoteWidget extends StatelessWidget {
  const ListNoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Consumer<NoteBloc>(
            builder: (context, bloc, child) => StreamBuilder<List<Note>>(
                stream: bloc.streamNotes,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Text(snapshot.data![index].content.toString());
                        },
                      );
                    case ConnectionState.none:
                    default:
                      return const Text("Không có dữ liệu hiển thị");
                  }
                })),
      ),
    );
  }
}
