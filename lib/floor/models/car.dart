import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floor/floor.dart';

@entity
class Car {
  String name;
  String model;
  String brand;
  String year;

  //Representa o nosso id no firebase
  DocumentReference? reference;

  Car(this.name, this.model, this.brand, this.year);

  Map<String, dynamic> toJson() => {
    "name": name,
    "model": model,
    "brand": brand,
    "year": year,
  };

  Car.fromMap(Map<String, dynamic> map, {this.reference}) :
    name = map["name"],
    model = map["model"],
    brand=map["brand"],
    year=map["year"];

  //O que volta do banco de dados
  Car.fromSnapshot(QueryDocumentSnapshot snapshot) : this.fromMap(
    snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);

}
