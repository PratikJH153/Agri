import 'package:agri/firebase/contracts/data_contracts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<String> addDocument(
      String collectionName, Map<String, dynamic> data) async {
    try {
      DocumentReference docRef =
          await _firestore.collection(collectionName).add(data);
      print("Document written with ID: ${docRef.id}");
      return docRef.id;
    } catch (e) {
      print("Error adding document: $e");
      return '';
    }
  }

  @override
  Future<void> setDocument(
      String collectionName, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).doc(docId).set(data);
      print("Document successfully written!");
    } catch (e) {
      print("Error writing document: $e");
    }
  }

  @override
  Future<Map<String, dynamic>?> getDocument(
      String collectionName, String docId) async {
    try {
      DocumentSnapshot docSnap =
          await _firestore.collection(collectionName).doc(docId).get();
      if (docSnap.exists) {
        print("Document data: ${docSnap.data()}");
        return docSnap.data() as Map<String, dynamic>?;
      } else {
        print("No such document!");
        return null;
      }
    } catch (e) {
      print("Error getting document: $e");
      return null;
    }
  }

  @override
  Future<void> updateDocument(
      String collectionName, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).doc(docId).update(data);
      print("Document successfully updated!");
    } catch (e) {
      print("Error updating document: $e");
    }
  }

  @override
  Future<void> deleteDocument(String collectionName, String docId) async {
    try {
      await _firestore.collection(collectionName).doc(docId).delete();
      print("Document successfully deleted!");
    } catch (e) {
      print("Error deleting document: $e");
    }
  }

  @override
  Future<List<QueryDocumentSnapshot>> queryDocuments(
      String collectionName, String field, dynamic value) async {
    try {
      QuerySnapshot querySnap = await _firestore
          .collection(collectionName)
          .where(field, isEqualTo: value)
          .get();
      print("Query returned ${querySnap.docs.length} documents");
      return querySnap.docs;
    } catch (e) {
      print("Error querying documents: $e");
      return [];
    }
  }
}
