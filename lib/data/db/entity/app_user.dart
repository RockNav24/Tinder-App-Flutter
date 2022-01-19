import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppUser {
  String id;
  String name;
  List filters;
  String profilePhotoPath;
  String bio = "";

  AppUser(
      {@required this.id,
      @required this.name,
      this.filters,
      @required this.profilePhotoPath});

  AppUser.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    name = snapshot['name'];
    filters = snapshot['filters'];
    profilePhotoPath = snapshot['profile_photo_path'];
    bio = snapshot.get('bio') ?? '';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'filters': filters,
      'profile_photo_path': profilePhotoPath,
      'bio': bio
    };
  }
}
