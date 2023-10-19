import 'dart:async';

import 'package:vanilla_bloc/counter_event.dart'; // stream controllers, streams and sinks

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();

  /// Sink int value into BLoc (INPUT)
  StreamSink<int> get _inCounter => _counterStateController.sink;

  /// Stream int value out of BLoC (OUTPUT)
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  /// Sink Event vale into BLoC (INPUT)
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  /// Map event to action and state
  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    }
    if (event is DecrementEvent) {
      _counter--;
    }
    // Add value to sink
    _inCounter.add(_counter);
  }

  /// Close / clean up stream controllers to prevent memory leaks
  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
