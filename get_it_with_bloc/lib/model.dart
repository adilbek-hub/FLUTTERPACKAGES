class Person {
  const Person(this.name, this.age, this.city);
  final String name;
  final int age;
  final String city;
}

Person p1 = const Person('John', 30, 'New York');
Person p2 = const Person('Jane', 25, 'London');
Person p3 = const Person('Jack', 40, 'Paris');

List<Person> persons = [p1, p2, p3];
