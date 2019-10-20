abstract class HomeModel{
  int plush();

  int minus();

  int reset();
}

class HomeModelImp implements HomeModel{
  int _counter = 0;

  @override
  int minus() {
    return --_counter;
  }

  @override
  int plush() {
    return ++_counter;
  }

  @override
  int reset() {
    _counter = 0;
    return _counter;
  }

}