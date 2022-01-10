// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey[400],
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('chat')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('error');
                        } else if (!snapshot.hasData || snapshot.data == null) {
                          return Text('empty');
                        } else if (snapshot.connectionState ==
                            ConnectionState.active) {
                          List<DocumentSnapshot> _docs = snapshot.data!.docs;

                          List _users = _docs.map((e) => e["msg"]).toList();
                          //(e.data() as Map<String, dynamic>)
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                reverse: true,
                                itemCount: _users.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(

                                    child: Text(_users[index] ?? 'no name'),


                                  ///////////  delete by ali
                                    onTap: () async {

                                      Iterable<DocumentSnapshot<Object?>>
                                          toDelete;
                                      toDelete = _docs.where(
                                          (e) => (e["msg"] == _users[index]));

                                      await FirebaseFirestore.instance
                                          .collection("chat")
                                          .doc(toDelete.first.id)
                                          .delete()
                                          .then((_) {
                                        print("success");
                                      });
                                    },
                                    /////////// delete by ali


                                  );
                                }),
                          );
                        }
                        return LinearProgressIndicator();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: msg,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance
                               
                                .collection('chat')
                                .add({
                              'msg': msg.value.text,
                            }).catchError((e) => debugPrint(e.toString()));
                            msg.clear();
                          },
                          child: Text("send"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
