import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'supplies_event.dart';
part 'supplies_state.dart';

class SuppliesBloc extends Bloc<SuppliesEvent, SuppliesState> {
  SuppliesBloc() : super(SuppliesInitial()) {
    on<SuppliesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
