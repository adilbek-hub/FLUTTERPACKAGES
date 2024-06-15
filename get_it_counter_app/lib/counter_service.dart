class CounterService {
  int _counter = 0;
  int get counter => _counter;
  void increnment() => _counter += 1;
  void decrement() => _counter -= 1;
}
