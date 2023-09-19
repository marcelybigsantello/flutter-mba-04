import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistences_types/commons/list_item.dart';

import '../../commons/constants.dart';
import '../daos/car_dao.dart';
import '../models/car.dart';
import 'form_car.dart';

class ListCarsWidget extends StatefulWidget {
  const ListCarsWidget({super.key});

  @override
  State<ListCarsWidget> createState() => _ListCarsWidgetState();
}

class _ListCarsWidgetState extends State<ListCarsWidget> {
  List<Car> cars = [];
  CarDAO? dao;

  @override
  void initState(){
    super.initState();
  }

  //CRUD
   _insertCar(Car car) async{
    if(dao != null){
      await dao!.insertCar(car);
      await _getAllCars();
    }
  }

  @override
  Widget build(BuildContext context) {
    const title = carros;
    final addRoute = FormCarWidget(); 

    return Scaffold(
      appBar: AppBar(
          title: title,
          actions: [IconButton(
            icon: addIcon, 
            onPressed: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => addRoute)).then((carro) => _insertCar(carro));
          })]),
          body: buildList(context),

      );
  }
  
  _getAllCars() async{
    if (dao != null){
      final result = await dao!.findAll();
      setState(() {
        cars = result;
      });
    }
  }

  Widget buildList(BuildContext context){
    return StreamBuilder(stream: FirebaseFirestore.instance.collection("cars").snapshots(),
     builder: (context, snapshot){
      if (!snapshot.hasData) return  const LinearProgressIndicator();
      if (snapshot.data == null) {
        return Container(child: const Text("Nenhum carro encontrado!!"));
      } else {
        return buildListView(context, snapshot.data!.docs);
      }

     });
     //      FutureBuilder(future:_getAllCars(),
  }
  
  Widget buildListView(BuildContext context, List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshots) {
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: snapshots.map((data) => _buildItem(context, data)).toList()
    );
  }

  Widget _buildItem(BuildContext context, QueryDocumentSnapshot data){
    Car car = Car.fromSnapshot(data);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListItemWidget(leading: "", title: car.name, subtitle: car.brand, 
      onLongPress: (){

      }));

  }

}