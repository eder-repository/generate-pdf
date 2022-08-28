import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_pdf/core/navigation/app_routes.dart';
import 'package:invoice_pdf/core/navigation/routes.dart';
import 'package:invoice_pdf/core/shared/theme/theme.dart';
import 'package:invoice_pdf/features/home/presentation/bloc/home/home_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..init(),
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        theme: InoviceTheme.theme,
        routes: appRoutes,
      ),
    );
  }
}
