import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<BottomNavItemPushedEvent>((event, emit) {
      int index = event.index;
      if (index == 0) {
        emit(HomeInitial());
      } else if (index == 1) {
        emit(SupplyState());
      } else if (index == 2) {
        emit(AlarmState());
      } else if (index == 3) {
        emit(SettingsState());
      }
    });
  }
}
