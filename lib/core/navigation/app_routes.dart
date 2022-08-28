import 'package:flutter/material.dart';
import 'package:invoice_pdf/core/navigation/routes.dart';
import 'package:invoice_pdf/features/home/presentation/screen/home.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      AppRoutes.home: (_) => const HomeScreen(),
    };
