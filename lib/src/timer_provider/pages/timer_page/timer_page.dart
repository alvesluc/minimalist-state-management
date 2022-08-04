import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/storage_service/shared_preference_storage.dart';
import 'timer_page_controller.dart';
import 'widgets/buttons_container.dart';
import 'widgets/timer_text_widget.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final storageService = SharedPreferencesStorage();

  @override
  Widget build(BuildContext context) {
    // TODO: Change to ProxyProvider with StorageService
    return MultiProvider(
      providers: [
        Provider<TimerPageController>(
          create: (_) => TimerPageController(storageService),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Timer - Provider"),
        ),
        body: Center(
          child: Column(
            children: const [
              TimerTextWidget(),
              SizedBox(height: 20),
              ButtonsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
