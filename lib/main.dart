import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sosmed/app.dart';
import 'package:flutter_sosmed/features/feeds/view/controllers/feed_bloc/feed_bloc.dart';
import 'package:flutter_sosmed/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FeedBloc>(
          create: (_) => serviceLocator<FeedBloc>(),
        ),
      ],
      child: const App(),
    ),
  );
}
