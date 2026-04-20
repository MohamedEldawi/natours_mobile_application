part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class ClientSecretLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

final class ClientSecretError extends PaymentState {
  final String message;
  ClientSecretError(this.message);
}
