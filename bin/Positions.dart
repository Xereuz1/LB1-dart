import 'Person.dart';
import 'Employee.dart';

List<String> position = ["Director", "Head", "Engineer", "Handyman"];
List<int> salary = [50000, 20000, 10000, 5000];
List<Person> employers = [];

void showEmployers(){
  for(int i = 0; i < employers.length; i++){
    print(employers[i]);
  }
  print("-"*20);
}