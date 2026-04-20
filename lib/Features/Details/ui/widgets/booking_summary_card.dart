import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/Features/payment/logic/cubit/payment_cubit.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:natours_application/core/widgets/app_text_button.dart';

class BookingSummaryCard extends StatelessWidget {
  final String tourId; // Replace with actual tour ID
  final double price;
  final int stops;

  const BookingSummaryCard({
    super.key,
    required this.price,
    required this.stops,
    required this.tourId,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${price.toStringAsFixed(0)}',
                        style: TextStyles.font24DarkBlue500Weight,
                      ),
                      TextSpan(
                        text: ' / person',
                        style: TextStyles.font13Grey400Weight,
                      ),
                    ],
                  ),
                ),
                Text(
                  '$stops stops included',
                  style: TextStyles.font12LightGrey400Weight,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48.h,
            child: BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                return AppTextButton(
                  buttonText: 'Book Now',
                  textStyle: TextStyles.font14White400Weight,
                  buttonWidth: 100.w,
                  borderRadius: 28.r,
                  isLoading: state is PaymentLoading,

                  onPressed: () {
                    context.read<PaymentCubit>().pay(tourId: tourId);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
