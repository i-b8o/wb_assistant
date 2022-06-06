import 'package:bloc/bloc.dart';

import 'package:storage_repo/storage_repo.dart';
import 'package:wb_api_repo/wb_api_repo.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final _storageRepo = StorageRepository();
  SettingsBloc() : super(SettingsInitial()) {
    on<ApiKeyPressed>((event, emit) {
      emit(ApiKeyState());
    });
    on<ApiKeyPasted>((event, emit) async {
      print("Pressed");
      await _storageRepo.setApiKey(event.key);
    });
    on<ApiNewKeyPasted>((event, emit) async {
      await _storageRepo.setApiKeyNew(event.key);
    });

    on<Back>((event, emit) async {
      emit(SettingsInitial());
    });
  }
}
