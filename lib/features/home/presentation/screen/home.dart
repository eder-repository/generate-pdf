import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_pdf/core/shared/widgets/f_text_form_field.dart';
import 'package:invoice_pdf/features/home/presentation/bloc/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Facturero'),
              const SizedBox(
                height: 20,
              ),
              FTextFormField(
                  controller: bloc.nameController,
                  hintText: 'Ingrese sus nombre'),
              const SizedBox(
                height: 20,
              ),
              const FTextFormField(hintText: 'Ingrese sus apellidos'),
              const SizedBox(
                height: 20,
              ),
              const FTextFormField(
                  hintText: 'Ingrese los meses del contrato',
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 20,
              ),
              const FTextFormField(
                  hintText: 'Ingrese su sueldo',
                  textInputType: TextInputType.number),
              CupertinoButton(
                  child: const Text('Generar factura'),
                  onPressed: () => bloc.add(const HomeEvent.started()))
            ],
          ),
        ),
      ),
    );
  }
}
