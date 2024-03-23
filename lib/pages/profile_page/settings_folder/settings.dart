import 'package:ecommerceapp/common/routes/names.dart';
import 'package:ecommerceapp/common/utils/constant.dart';
import 'package:ecommerceapp/global.dart';
import 'package:ecommerceapp/pages/application_page/bloc/app_bloc.dart';
import 'package:ecommerceapp/pages/application_page/bloc/app_event.dart';
import 'package:ecommerceapp/pages/profile_page/settings_folder/bloc/settings_bloc.dart';
import 'package:ecommerceapp/pages/profile_page/settings_folder/bloc/settings_state.dart';
import 'package:ecommerceapp/pages/profile_page/settings_folder/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    void removeUserData() {
      context.read<AppBlocs>().add(const TriggerAppEvent(0));
      Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
      Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
    }

    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            // ignore: avoid_unnecessary_containers
            return Container(
              child: Column(
                children: [
                  logoutButton(context, removeUserData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
