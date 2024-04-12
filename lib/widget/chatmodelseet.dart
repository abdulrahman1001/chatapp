import 'package:chatapp/widget/editbuttomsheet.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/constatnt.dart'; // assuming constants are defined here
import 'package:chatapp/models/measgemodel.dart'; // assuming the message model is defined here
import 'package:flutter/services.dart';

class BottomSheetWidget extends StatelessWidget {
  final measgemodel measge;

  const BottomSheetWidget({super.key, required this.measge});

  // Function to delete a document based on a custom 'id' field
  Future<void> deleteDocumentByField(String fieldValue) async {
    try {
      // Query documents to find the actual Firestore document ID
      var querySnapshot = await FirebaseFirestore.instance
          .collection(databasemeasges)
          .where('id', isEqualTo: fieldValue) // 'id' is the field in Firestore
          .get();
      print(querySnapshot);

      // Check if documents are found
      if (querySnapshot.docs.isNotEmpty) {
        // Assuming you expect only one document with this unique ID
        String docId = querySnapshot.docs.first.id;
        // Delete the document with the obtained Firestore ID
        await FirebaseFirestore.instance
            .collection(databasemeasges)
            .doc(docId)
            .delete();
        print('Document successfully deleted! ID: $docId');
      } else {
        print('No document found with the id: $fieldValue');
      }
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  Future<void> deleteAllDocuments(String collectionPath) async {
    // Reference to the collection
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var collection = firestore.collection(collectionPath);
    var snapshots = await collection.get();

    // Batch write to delete all documents
    WriteBatch batch = firestore.batch();

    for (var doc in snapshots.docs) {
      batch.delete(doc.reference); // Add each document deletion to the batch
    }

    // Commit the batch
    await batch.commit();
    print("All documents in $collectionPath have been deleted.");
  }

  Future<void> editDocumentByField(String fieldValue,String text) async {
    try {
      // Query documents to find the actual Firestore document ID
      var querySnapshot = await FirebaseFirestore.instance
          .collection(databasemeasges)
          .where('id', isEqualTo: fieldValue) // 'id' is the field in Firestore
          .get();
      print(querySnapshot);

      // Check if documents are found
      if (querySnapshot.docs.isNotEmpty) {
        // Assuming you expect only one document with this unique ID
        String docId = querySnapshot.docs.first.id;
        // Delete the document with the obtained Firestore ID
        await FirebaseFirestore.instance
            .collection(databasemeasges)
            .doc(docId)
            .update({'text': text});
        ();
        print('Document successfully deleted! ID: $docId');
      } else {
        print('No document found with the id: $fieldValue');
      }
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: measge.text));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Copied to Clipboard')),
                );
              },
              icon: Icon(Icons.copy)),
          IconButton(
              onPressed: () {
                print('Attempting to delete message with ID: ${measge.id}');
                deleteDocumentByField(
                    measge.id); // Use custom 'id' field for deletion
              },
              icon: Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                deleteAllDocuments(databasemeasges);
              },
              icon: Icon(Icons.delete_forever)),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return editbuttomsheet(
                        onchange: (value) {
                          editDocumentByField(measge.id,value);
                        },
                          
                      );
                    });
              },
              icon: Icon(Icons.edit)),
        ],
      ),
    );
  }
}
