import 'package:chatapp/constatnt.dart';
import 'package:chatapp/models/measgemodel.dart';
import 'package:chatapp/widget/chatbuble.dart';
import 'package:chatapp/widget/textfildchatpage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
  
          final Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection(databasemeasges).orderBy('date',descending: true).snapshots();
final ScrollController controller = ScrollController();
String email= ModalRoute.of(context)!.settings.arguments as String;


    return StreamBuilder<QuerySnapshot>(
    
        stream: stream,
        builder: (context, snapshot) {
            List <measgemodel> measgelist=[];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
            for (var i in docs) {
              measgelist.add(measgemodel(
                text: i['text'], time: i['time'], 
                id: i['id'],
                email: i['email']

               ));
            }
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(colorback),
                  automaticallyImplyLeading: false,
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(myimg), Text(' chat')]),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(reverse: true,controller: controller,itemCount: measgelist.length,itemBuilder: (context, index) {

                        return measgelist[index].email==email?ChatBubble(messageList: measgelist[index]):

                        ChatBubbleFriend(messageList: measgelist[index],);
                      }),
                    ),
                    TextFieldChatPage(controllerScroll: controller,email: email,)
                  ],
                ));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
