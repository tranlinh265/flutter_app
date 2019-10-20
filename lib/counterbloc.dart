import 'package:rxdart/rxdart.dart';

abstract class CounterBloc {
  Observable<int> get counterObservable;

  void increment();

  void decrement();

  void reset();

  void dispose();
}

class CounterBlocImp implements CounterBloc {
  int count = 0;
  BehaviorSubject<int> _behaviorSubject;

  CounterBlocImp({this.count}) {
    _behaviorSubject = new BehaviorSubject<int>.seeded(this.count);
  }

  Observable<int> get counterObservable => _behaviorSubject.stream;

  void _sinkAddValue(int value) {
    _behaviorSubject.sink.add(value);
  }

  void increment() {
    _sinkAddValue(++count);
  }

  void reset() {
    count = 0;
    _sinkAddValue(count);
  }

  void decrement() {
    _sinkAddValue(--count);
  }

  void dispose() {
    _behaviorSubject.close();
  }
}
