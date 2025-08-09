import 'package:app/core/common/screen/no_connection_screen.dart';
import 'package:app/core/service/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketiApp extends StatelessWidget {
  const MarketiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityService.instance.isConnected,
      builder: (_, isConnected, __) {
        return isConnected ? _buildMainApp() : _buildNoConnectionApp();
      },
    );
  }

  Widget _buildMainApp() {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Marketi App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Marketi App')),
          body: Center(child: const Text('Welcome to Marketi App')),
        ),
        builder: (context, widget) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Builder(
              builder: (context) {
                ConnectivityService.instance.init();
                return widget!;
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoConnectionApp() {
    return const MaterialApp(
      title: 'No Connection',
      debugShowCheckedModeBanner: false,
      home: NoConnectionScreen(),
    );
  }
}
