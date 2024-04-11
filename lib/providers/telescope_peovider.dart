import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/db_helper.dart';
import 'package:flutter_application_2/models/telescope.dart';
import 'package:flutter_application_2/utils/constants.dart';

import '../models/brand.dart';
import '../models/image_model.dart';

class TelescopeProvider with ChangeNotifier {
  List<Brand> brandList = [];
  List<Telescope> telescopeList = [];

  Future<void> addBrand(String name) async {
    final brand = Brand(name: name);
    return DbHelper.addBrand(brand);
  }

  getAllBrands(){
    DbHelper.getAllBrand().listen((snapshot) {
      brandList = List.generate(snapshot.docs.length, (index) => Brand.fromJson(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

   getAllTelescope(){
    DbHelper.getAllTelescope().listen((snapshot) {
      telescopeList = List.generate(snapshot.docs.length, (index) => Telescope.fromJson(snapshot.docs[index].data()));
      notifyListeners();
    });
  }



  Future<ImageModel> uploadImage(String imageLocalPath) async {
    final String imageName = 'image_${DateTime.now().millisecondsSinceEpoch}';
    final photoRef = FirebaseStorage.instance.ref().child('$telescopeImageDirectory$imageName');
    final uploadTask = photoRef.putFile(File(imageLocalPath));
    final snapshot = await uploadTask.whenComplete(()=> null);
    final url  = await snapshot.ref.getDownloadURL();
    return ImageModel(
      imageName: imageName,
      directoryName: telescopeImageDirectory,
      downloadUrl: url
    );
  }

  Future<void> addTelescope(Telescope telescope){
    return DbHelper.addTelescope(telescope);
  }
}