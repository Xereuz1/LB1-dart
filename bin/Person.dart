/*import 'Positions.dart';*/
abstract class Person{
  String name;
  String surname;
  String patronymic;
  Person():name = "Name", surname = "Surname", patronymic = "Patronymic";
  /*Person.test(this.name, this.surname, this.patronymic);*/

  String correctName();
  String correctInput();
  String correctDepart();
  void nullEmployee();
  void addEmployee();
  void changePosition();
  void changeDepartment();
  void demoteORpromoteWorker();
  void giveSalary();
  void findPosDepart();
  void compareEmployers();

  @override
  String toString() {
    // TODO: implement toString
    return "Name: $name\nSurname: $surname\nPatronimic: $patronymic\n";
  }
}