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

  Future<void> pay({required String tourId}) async {
    emit(PaymentLoading());
    final response = await _paymentRepo.getClientSecret(tourId);
    response.when(
      success: (clientSecret) async {
        _clientSecret = clientSecret;
        try {
          await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: _clientSecret!,
              merchantDisplayName: 'Natours',
            ),
          );
        } on StripeException catch (e) {
          emit(
            PaymentError(
              e.error.localizedMessage ?? 'Payment initialization failed',
            ),
          );
          return;
        } catch (_) {
          emit(PaymentError('An unexpected error occurred'));
          return;
        }
        try {
          await Stripe.instance.presentPaymentSheet();
          emit(PaymentSuccess());
        } on StripeException catch (e) {
          if (e.error.code == FailureCode.Canceled) {
            emit(PaymentCanceled());
          } else {
            emit(PaymentError(e.error.localizedMessage ?? 'Payment failed'));
          }
        } catch (_) {
          emit(PaymentError('An unexpected error occurred'));
        }
      },
      failure: (error) {
        _clientSecret = null;
        emit(PaymentError(error.message));
      },
    );
  }
}
