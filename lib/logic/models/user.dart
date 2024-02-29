import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  int type;
  String name;
  String? surname;
  int city;
  String? avatar;
  String? description;
  String? instagram;
  String phone;
  String email;

  User({
    required this.uid,
    required this.type,
    required this.name,
    this.surname,
    required this.city,
    this.avatar,
    this.description,
    this.instagram,
    required this.phone,
    required this.email,
  });

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      uid: data?['uid'],
      type: data?['type'],
      name: data?['name'],
      surname: data?['surname'],
      city: data?['city'],
      avatar: data?['avatar'],
      description: data?['description'],
      instagram: data?['instagram'],
      phone: data?['phone'],
      email: data?['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "uid": uid,
      "type": type,
      "name": name,
      if (surname!= null) "surname": surname,
      "city": city,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (instagram != null) "instagram": instagram,
      "phone": phone,
      "email": email,
    };
  }
}
