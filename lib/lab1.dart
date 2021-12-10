class Mixin
{
  void _privateFunc()
  {
    print("call of private func");
  }

  Function call() => _privateFunc;

  void checkJob(String job)
  {
    assert(job.startsWith("prog"), "you are not a programmer");
  }
}

class Person
{
  int _age;
  String _name;

  Person(this._name, this._age);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  @override
  String toString()
  {
    return "Person [Name: $_name, Age: $_age]";
  }
}

class Employee extends Person with Mixin
{
  String job;

  static Employee defaultEmployee = Employee("", 0, "");

  Employee(String name, int age, this.job): super(name, age);
  factory Employee.factory()
  {
    return defaultEmployee;
  }
}

double execute(Function executor, {required int number, int num = 2})
{
  return executor(number, num);
}