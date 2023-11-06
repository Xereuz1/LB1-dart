import 'Person.dart';
import 'Positions.dart';
import 'dart:io';

class Employee extends Person{
  int posNum;
  String? history;
  String department;

  Employee(): posNum = 0, department = "a1", super();
  Employee.test(this.department, this.posNum, name, surname, patronimic, [history]):super();

  @override
  String correctName(){
    String? input = stdin.readLineSync();
    if(input != null && input.isNotEmpty && !input.contains(RegExp(r'[0-9]'))) {
      return input;
    }
    else {
      print("Error, incorrect input, try again");
      return correctName();
    }
  }
  @override
  String correctInput(){
    String? input = stdin.readLineSync();
    if(input != null && input.isNotEmpty) {
      return input;
    }
    else {
      print("Error, incorrect input, try again");
      return correctInput();
    }
  }
  @override
  String correctDepart(){
    String? input = stdin.readLineSync();
    if(input != null && input.isNotEmpty && input.contains(RegExp(r'[0-9]'))) {
      return input;
    }
    else {
      print("Error, incorrect input, try again");
      return correctDepart();
    }
  }
  @override
  void nullEmployee(){
    name = "";
    surname = "";
    patronymic = "";
    history = "";
    department = "";
  }
  @override
  void addEmployee(){
    print("Enter name:");
    name = correctName();

    print("Enter surname:");
    surname = correctName();

    print("Enter patronymic:");
    patronymic = correctName();

    print("Enter number of position:\n (0)Director, (1)Head, (2)Engineer, (3)Handyman");
    int tempPos = int.parse(correctInput());
    if(tempPos >= 0 && tempPos < position.length){
      posNum = tempPos;
    }
    else{
      nullEmployee();
      print("Out of range, try again");
      return;
    }

    print("Enter department:");
    department = correctDepart();

    print("Enter history of career changes in the company:");
    history = correctInput();

    print("--------Done--------");

  }
  @override
  void changePosition(){
    print("Choose the Employer(starts from 0):");
    showEmployers();
    int tmp = int.parse(correctInput());
    print("Enter number of new position:\n (0)Director, (1)Head, (2)Engineer, (3)Handyman");
    int newPos = int.parse(correctInput());
    if(newPos >=0 && newPos < position.length){
      (employers[tmp] as Employee).posNum = newPos;
      print("--------Done--------");
    }
    else{
      print("Error, try again");
      return;
    }
  }
  @override
  void changeDepartment(){
    print("Choose the Employer(starts from 0):");
    showEmployers();
    int tmp = int.parse(correctInput());
    print("Enter the new department:");
    String newDepart = correctDepart();
    (employers[tmp] as Employee).department = newDepart;
    print("--------Done--------");
  }
  @override
  void demoteORpromoteWorker(){
    print("Choose the Employer(starts from 0):");
    showEmployers();
    int employerChoosed = int.parse(correctInput());
    print("(0)Promote");
    print("(1)Demote");
    int option = int.parse(correctInput());
    switch(option){
      case 0:
        if((employers[employerChoosed] as Employee).posNum - 1 >= 0){
          (employers[employerChoosed] as Employee).posNum = (employers[employerChoosed] as Employee).posNum - 1;
          print("--------Done--------");
        }
        else{
          print("Try again");
          break;
        }
        break;
      case 1:
        if((employers[employerChoosed] as Employee).posNum +1 < position.length){
          (employers[employerChoosed] as Employee).posNum = (employers[employerChoosed] as Employee).posNum + 1;
          print("--------Done--------");
        }
        else{
          print("Try again");
          break;
        }
        break;
    }
  }
  @override
  void giveSalary(){
    print("Choose the Employer(starts from 0):");
    showEmployers();
    int employerChoosed = int.parse(correctInput());
    print(
        "You gave salary to worker at the rate of ${salary[(employers[employerChoosed] as Employee)
            .posNum]}");
  }
  @override
  void findPosDepart(){
    print("Choose the Employer(starts from 0):");
    showEmployers();
    int employerChoosed = int.parse(correctInput());
    print("Write line or word to find");
    String findHistory = correctInput();
    if((((employers[employerChoosed] as Employee).history as String)).contains(findHistory)){
      print("Work history: ${(employers[employerChoosed] as Employee).history as String}\nCONTAINS\n$findHistory");
    }
    else{
      print("Unable to find matches");
    }
  }
  @override
  void compareEmployers(){
    print("Choose first Employer(starts from 0):");
    showEmployers();
    int first = int.parse(correctInput());
    print("Choose second Employer(starts from 0):");
    showEmployers();
    int second = int.parse(correctInput());
    if((employers[first] as Employee).posNum > (employers[second] as Employee).posNum){
      print("Worker ${(employers[first] as Employee).name} lower in position than ${(employers[second] as Employee).name}");
    }
    else if((employers[first] as Employee).posNum < (employers[second] as Employee).posNum){
      print("Worker ${(employers[second] as Employee).name} lower in position than ${(employers[first] as Employee).name}");
    }
    else{
      print("Worker ${(employers[first] as Employee).name} and ${(employers[second] as Employee).name} has equal position");
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return "${super.toString()}Position: ${position[posNum]}\nHistory: $history\nDepartment: $department";
  }
}