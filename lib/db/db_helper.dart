import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/brand.dart';
import '../models/telescope.dart';

class DbHelper{
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionAdmin = "Admins";
  static const String collectionBrand = "Brands";
  static const String collectionTelescope = "Telescopes";


  static Future<bool> isAdmin(String uid) async{
    final snapshot = await _db.collection(collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }

  static Future<void> addBrand(Brand brand) async{
    final doc = await _db.collection(collectionBrand).doc();
    brand.id = doc.id;
    return doc.set(brand.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllBrand() => _db.collection(collectionBrand).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllTelescope() => _db.collection(collectionTelescope).snapshots();

  static Future<void> addTelescope(Telescope telescope) async {
    final doc = await _db.collection(collectionTelescope).doc();
    telescope.id = doc.id;
    return doc.set(telescope.toJson());
  }
  
}