
import 'package:floor/floor.dart';
import 'package:persistences_types/floor/models/car.dart';

@dao
abstract class CarDAO{

  @Query("SELECT * FROM Car")
  Future<List<Car>> findAll();

  @insert
  Future<int> insertCar(Car car);

  @delete
  Future<int> deleteCar(Car car);
}