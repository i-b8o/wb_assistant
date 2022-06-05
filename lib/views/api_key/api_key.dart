import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wb_assistant/bloc/settings/settings_bloc.dart';
import 'package:wb_assistant/views/components/btn_thick_portrait.dart';

class ApiKey extends StatelessWidget {
  ApiKey({Key? key}) : super(key: key);
  final TextEditingController apiController = TextEditingController();
  final TextEditingController apiNewController = TextEditingController();
  void onPressApi(BuildContext context, TextEditingController api) {
    if (api.text.isNotEmpty) {
      context.read<SettingsBloc>().add(ApiKeyPasted(api.text));
    }
  }

  void onPressNewApi(BuildContext context, TextEditingController api) {
    if (api.text.isNotEmpty) {
      context.read<SettingsBloc>().add(ApiNewKeyPasted(api.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            style: TextStyle(fontSize: size.height * 0.02),
            textAlignVertical: TextAlignVertical.center,
            controller: apiController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              hintText: "Вставьте ключ Api",
              contentPadding: EdgeInsets.symmetric(
                vertical: size.height * 0.03,
                horizontal: size.width * 0.01,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          BtnThickPortrait(
            text: "Добавить ключ API",
            press: () {
              onPressApi;
            },
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          TextField(
            style: TextStyle(fontSize: size.height * 0.02),
            textAlignVertical: TextAlignVertical.center,
            controller: apiNewController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              hintText: "Вставьте ключ нового Api",
              contentPadding: EdgeInsets.symmetric(
                vertical: size.height * 0.03,
                horizontal: size.width * 0.01,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          BtnThickPortrait(
              text: "Добавить ключ к новому API",
              press: () {
                onPressNewApi;
              }),
          SizedBox(
            height: size.height * 0.05,
          ),
          BtnThickPortrait(
              text: "Вернуться назад",
              press: () {
                context.read<SettingsBloc>().add(Back());
              }),
        ]);
      },
    );
  }
}
