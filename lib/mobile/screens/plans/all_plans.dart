import 'package:flutter/material.dart';

class AllPlansScreen extends StatelessWidget {
  const AllPlansScreen({Key? key}) : super(key: key);
  static const String routeName = 'AllPlansScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('AllPlansScreen'),
      ),
    );
  }
}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AllPlansScreen extends StatefulWidget {
//   static const String routeName = 'AllPlansScreen';
//   @override
//   _AllPlansScreenState createState() => _AllPlansScreenState();
// }
//
// class _AllPlansScreenState extends State<AllPlansScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _imageUrlController = TextEditingController();
//   final List<String> _selectedAttractions = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Customize Trip'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _imageUrlController,
//               decoration: InputDecoration(labelText: 'Image URL'),
//             ),
//             SizedBox(height: 16.0),
//             Text('Select Attractions'),
//             SizedBox(height: 8.0),
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('cities').doc('Cairo').collection('places')
//                   .snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 }
//                 return Wrap(
//                   spacing: 8.0,
//                   children:
//                       snapshot.data!.docs.map((DocumentSnapshot document) {
//                     return ChoiceChip(
//                       label: Text(document['name']),
//                       selected: _selectedAttractions.contains(document.id),
//                       onSelected: (bool selected) {
//                         setState(() {
//                           if (selected) {
//                             _selectedAttractions.add(document.id);
//                           } else {
//                             _selectedAttractions.remove(document.id);
//                           }
//                         });
//                       },
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 String title = _titleController.text.trim();
//                 String description = _descriptionController.text.trim();
//                 String imageUrl = _imageUrlController.text.trim();
//                 String userId = FirebaseAuth.instance.currentUser!.uid;
//                 List<String> attractionIds = _selectedAttractions.toList();
//                 String itineraryId = await createNewItinerary();
//                 await addNewCustomizedTrip(title, description, imageUrl, userId,
//                     itineraryId, attractionIds);
//                 Navigator.pop(context);
//               },
//               child: Text('Save Trip'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<String> createNewItinerary() async {
//     DocumentReference itineraryRef =
//         await FirebaseFirestore.instance.collection('itineraries').add({});
//     return itineraryRef.id;
//   }
//
//   Future<void> addNewCustomizedTrip(
//       String title,
//       String description,
//       String imageUrl,
//       String userId,
//       String itineraryId,
//       List<String> attractionIds) async {
//     FirebaseFirestore.instance.collection('customized_trips').add({
//       'title': title,
//       'description': description,
//       'imageUrl': imageUrl,
//       'userId': userId,
//       'itineraryId': itineraryId,
//       'attractionIds': attractionIds,
//     });
//   }
// }
