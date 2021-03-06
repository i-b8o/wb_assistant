import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
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

  final Uri url = Uri.parse(
      'https://seller.wildberries.ru/supplier-settings/access-to-api');
  void _launchUrl() async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            keyboardType: TextInputType.none,
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
              hintText: "???????????????? ???????? Api",
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
            text: "???????????????? ???????? API",
            press: () {
              onPressApi(context, apiController);
            },
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          TextField(
            keyboardType: TextInputType.none,
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
              hintText: "???????????????? ???????? ???????????? Api",
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
              text: "???????????????? ???????? ?? ???????????? API",
              press: () {
                onPressNewApi(context, apiNewController);
              }),
          SizedBox(
            height: size.height * 0.05,
          ),
          BtnThickPortrait(
              text: "?????????????????? ??????????",
              press: () {
                context.read<SettingsBloc>().add(Back());
              }),
          BtnThickPortrait(
              text: "??????????????",
              press: () {
                _launchUrl();
              }),
        ]);
      },
    );
  }
}
