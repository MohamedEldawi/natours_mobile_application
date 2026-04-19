import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:meta/meta.dart';
import 'package:natours_application/Features/payment/data/repo/payment_repo.dart';
import 'package:natours_application/core/networking/api_result.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo _paymentRepo;
  PaymentCubit(this._paymentRepo) : super(PaymentInitial());
  String? _clientSecret;

  Future<void> _getClientSecret(String tourId) async {
    emit(ClientSecretLoading());
    final response = await _paymentRepo.getClientSecret(tourId);
    response.when(
      success: (clientSecret) => _clientSecret = clientSecret,
      failure: (error) {
        _clientSecret = null;
        emit(ClientSecretError(error.message));
      },
    );
  }

  Future<void> _initPaymentSheet() async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: _clientSecret!,
          merchantDisplayName: 'Natours',
        ),
      );
    } catch (e) {
      emit(ClientSecretError('Failed to initialize payment sheet: $e'));
    }
  }

  Future<void> _presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      emit(PaymentSuccess());
    } catch (e) {
      emit(ClientSecretError('Failed to present payment sheet: $e'));
    }
  }

  Future<void> pay({required String tourId}) async {
    await _getClientSecret(tourId);
    if (_clientSecret != null) {
      await _initPaymentSheet();
      await _presentPaymentSheet();
    }
  }
}
