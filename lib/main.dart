import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/screens/theme_screen.dart';
import 'provider/provider_example_one.dart';
import 'provider/provider_theme_change.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// =====================================================
  // This code is for single-provider.
// =====================================================
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(create: (_) => ProviderExampleOne(),
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: ProviderExampleOneScreen(),
//     ));
//   }
// }

// ==================================================
// // This code is for multi-provider.
// =====================================================
  @override
  Widget build(BuildContext context) {
    // final _providerThemeChange = Provider.of(context);

    return MultiProvider(
        providers: [
          // This array is for declaring the provider classes.
          ChangeNotifierProvider(create: (_) => ProviderExampleOne()),
          ChangeNotifierProvider(create: (_) => ProviderThemeChange())
        ],
        child: Builder(builder: (BuildContext context) {
          final providerThemeChange = Provider.of<ProviderThemeChange>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: providerThemeChange.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: ThemeScreen(),
          );
        }));
  }
}
