import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedpreferences/model/settings.dart';
import 'package:sharedpreferences/providers/notification_state_provider.dart';
import 'package:sharedpreferences/providers/shared_preference_provider.dart';
import 'package:sharedpreferences/utils/notification_state.dart';
import 'package:sharedpreferences/utils/page_size_number.dart';
import 'package:sharedpreferences/widgets/maximum_page_size_field.dart';
import 'package:sharedpreferences/widgets/notification_field.dart';
import 'package:sharedpreferences/widgets/save_button.dart';
import 'package:sharedpreferences/widgets/signature_field.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final maximumPageSizeController = TextEditingController();
  final signatureController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      ()async{
        if (mounted) {
          context.read<SharedPreferenceProvider>().getSetting();
          final setting = context.read<SharedPreferenceProvider>().setting;

          if(setting!=null){
            maximumPageSizeController.text = setting.pagenumber.toString();
            signatureController.text = setting.signature.toString();
            context.read<NotificationStateProvider>().notificationState = setting.notificationEnable? NotificationState.enable : NotificationState.disable;
            
          }
        }
      }
    );
  }
  @override
  void dispose() {
    maximumPageSizeController.dispose();
    signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Setting Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const NotificationField(),
              MaximumPageSizeField(controller: maximumPageSizeController),
              SignatureField(controller: signatureController),
              SaveButton(onPressed: () => saveAction()),
            ],
          ),
        ),
      ),
    );
  }

  void saveAction() async {
    final natificationstate = context
        .read<NotificationStateProvider>()
        .notificationState;
    final inotificationEnable = natificationstate.isEnable;
    final maximumpage = int.tryParse(maximumPageSizeController.text);
    final signature = signatureController.text;
    final Setting setting = Setting(
      notificationEnable: inotificationEnable,
      pagenumber: maximumpage ?? maximumPageSizeNumbers.first,
      signature: signature,
    );

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final sharedPreferencesProvider = context.read<SharedPreferenceProvider>();
    await sharedPreferencesProvider.saveSetting(setting);

    scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(sharedPreferencesProvider.message)),
    );
  }
}
