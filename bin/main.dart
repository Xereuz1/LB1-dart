import 'Person.dart';
import 'Employee.dart';
import 'Positions.dart';
import 'dart:io';


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

void main(){
  while(true){
    print("-"*20);
    print("Please choose an option:");
    print("(1)Add new Employer data");
    print("(2)Show info about all Employers");
    print("(3)Change the position of Employer");
    print("(4)Change the department of Employer");
    print("(5)Promote/Demote worker");
    print("(6)Give salary to worker");
    print("(7)Find position/department in career history");
    print("(8)Compare workers by position");
    Person worker = Employee();
    int option = int.parse(correctInput());
    switch(option){
      case 1:
        worker.addEmployee();
        employers.add(worker);
        break;
      case 2:
        showEmployers();
        break;
      case 3:
        worker.changePosition();
        break;
      case 4:
        worker.changeDepartment();
        break;
      case 5:
        worker.demoteORpromoteWorker();
        break;
      case 6:
        worker.giveSalary();
        break;
      case 7:
        worker.findPosDepart();
        break;
      case 8:
        worker.compareEmployers();
        break;
    }
  }
}