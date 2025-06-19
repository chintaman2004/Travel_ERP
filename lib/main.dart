import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'router/app_router.dart';

const supabaseUrl = 'https://nqicoicatrcwutiswoxn.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5xaWNvaWNhdHJjd3V0aXN3b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAzMjAwNDUsImV4cCI6MjA2NTg5NjA0NX0.ZExnZuPIhy5-ZQuOgAew8AfZ9b5PE1YDL5zLrPQpR4I';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Travel Management ERP',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
