import 'package:arc_player/controllers/audio_controller.dart';
import 'package:arc_player/views/player_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main() async {
  // Ensure Flutter bindings are initialized before calling native code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the background audio service
  // This keeps music playing when the screen is locked
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.arc_player.channel.audio',
    androidNotificationChannelName: 'Audio Playback',
    androidNotificationOngoing: true,
  );

  // Initialize Hive local database
  await Hive.initFlutter();

  // Open boxes to store our simple data
  await Hive.openBox('settings_box');
  await Hive.openBox('playback_box');

  runApp(ArcPlayerApp());
}

class ArcPlayerApp extends StatelessWidget {
  ArcPlayerApp({super.key});

  final AudioController audioController = AudioController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Arc Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F0F2),
        useMaterial3: true,
      ),
      home: const PlayerView(),
    );
  }
}
