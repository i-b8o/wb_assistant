import 'package:bloc/bloc.dart';
import 'package:storage_repo/storage_repo.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  WBApiRepository wbApiRepository = WBApiRepository();
  StorageRepository storageRepository = StorageRepository();
  HomeBloc() : super(HomeInitial()) {
    on<BottomNavItemPushedEvent>((event, emit) async {
      int index = event.index;
      if (index == 0) {
        emit(HomeInitial());
      } else if (index == 1) {
        emit(SupplyState());
      } else if (index == 2) {
        emit(AlarmState());
      } else if (index == 3) {
        try {
          String key = await storageRepository.getApiKey();
          IncomeResponse incomeResponse = await wbApiRepository.getV1Incomes(
              "2017-03-25T21:00:00.000Z", key);
          int statusCode = incomeResponse.statusCode;
          if (statusCode == 200) {
            emit(SettingsState(200, incomeResponse.incomes));
          } else {
            emit(SettingsState(statusCode, incomeResponse.incomes));
          }
        } catch (e) {
          print("HomeBloc error: $e");
        }
      }
    });
  }
}
