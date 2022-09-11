import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invoice_pdf/features/home/data/services/pdf_api.dart';
import 'package:invoice_pdf/features/home/data/services/pdf_invoice_api.dart';
import 'package:pdf/widgets.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<_Started>(_generateInvoice);
  }

  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _totalController;
  late final TextEditingController _salaryController;
  late final TextEditingController _numberCiController;

  TextEditingController get nameController => _nameController;

  TextEditingController get numberCiController => _numberCiController;

  TextEditingController get lastnameController => _lastNameController;

  TextEditingController get totalController => _totalController;

  TextEditingController get salaryController => _salaryController;

  void init() {
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _totalController = TextEditingController();
    _salaryController = TextEditingController();
    _numberCiController = TextEditingController();
  }

  Future<void> _generateInvoice(_Started event, Emitter<HomeState> emit) async {
    final pdfFile = await PdfInvoiceApi.generate(
        name: _nameController.text,
        lastname: lastnameController.text,
        ci: _numberCiController.text);
    PdfApi.openFile(pdfFile);
  }
}
