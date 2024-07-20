import "package:cloud_firestore/cloud_firestore.dart";

abstract class FirestoreService {
  // Add a new document with a generated ID
  Future<String> addDocument(String collectionName, Map<String, dynamic> data);

  // Set a document with a specific ID
  Future<void> setDocument(
      String collectionName, String docId, Map<String, dynamic> data);

  // Get a document
  Future<Map<String, dynamic>?> getDocument(
      String collectionName, String docId);

  // Update a document
  Future<void> updateDocument(
      String collectionName, String docId, Map<String, dynamic> data);

  // Delete a document
  Future<void> deleteDocument(String collectionName, String docId);

  // Query documents
  Future<List<QueryDocumentSnapshot>> queryDocuments(
      String collectionName, String field, dynamic value);
}
