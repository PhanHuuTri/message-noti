import 'package:demo_noti/firebase_options.dart';
import 'package:demo_noti/routers/go_router_adapter.dart';
import 'package:demo_noti/services/notification_service.dart';
import 'package:demo_noti/themes/dark_theme.dart';
import 'package:demo_noti/themes/light_theme.dart';
import 'package:demo_noti/themes/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // nếu có file firebase_options.dart
    // nếu KHÔNG có file này (mobile only) thì dùng: await Firebase.initializeApp();
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await initializeLocalNotifications();

  final extra = <RouteBase>[
    // Ví dụ: SettingsFeature.routes(), ProductFeature.routes(), ...
  ];
  final router = buildGoRouter(
    extraRoutes: extra,
    observers: [
      // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   // Ví dụ guard login cực gọn
    //   // final loggedIn = true; // Lấy từ DI/state thực tế
    //   final wantsProfile = state.matchedLocation.startsWith('/profile');
    //   if (wantsProfile) {
    //     return '/home';
    //   }
    //   return null;
    // },
  );

  final nav = GoNav(router); // Adapter implement Navigation

  runApp(MyApp(router: router, nav: nav));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router, required this.nav});

  final GoRouter router;
  final GoNav nav;
  @override
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            themeMode: themeManager.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
          );
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   late FirebaseMessaging _firebaseMessaging;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _firebaseMessaging = FirebaseMessaging.instance;

//     // Request permission for iOS
//     _firebaseMessaging.requestPermission();

//     // Get the token for this device
//     _firebaseMessaging.getToken().then((String? token) {
//       assert(token != null);
//       print("Firebase Messaging Token: $token");
//     });

//     // Handle foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Received a message while in the foreground!');
//       print('Message data: ${message.data}');

//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('App opened from notification: ${message.notification?.title}');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Switch(
//               value: Provider.of<ThemeManager>(context).isDarkMode,
//               onChanged: (value) {
//                 Provider.of<ThemeManager>(context, listen: false).toggleTheme();
//               },
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
