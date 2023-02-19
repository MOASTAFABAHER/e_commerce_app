import 'package:e_commerce_app/config/toast_config.dart';
import 'package:e_commerce_app/enums/toast_status.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/payment/ref_screen.dart';
import 'package:e_commerce_app/views/payment/visa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/Payment_cubit/cubit/payment_cubit.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()
        ..getOrderRegistrationID(
            price: "", firstName: "", lastName: "", email: "", phone: "")
        ..getPaymentRequest("", "", "", "", ""),
      child: SafeArea(
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentRefCodeSuccessStates) {
              ToastConfig.showToast(
                  msg: 'Sucsses get ref code ',
                  toastStates: ToastStates.Success);
              AppNavigator.appNavigator(context, const ReferenceScreen(),
                  isFinished: true);
            }
            if (state is PaymentRefCodeErrorStates) {
              ToastConfig.showToast(
                  msg: 'Error', toastStates: ToastStates.Error);
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                                Border.all(color: Colors.black87, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  'https://cdn-icons-png.flaticon.com/128/4090/4090458.png'),
                              SizedBox(height: 15.h),
                              Text(
                                'Payment with Ref code',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          AppNavigator.appNavigator(context, VisaScreen(),
                              isFinished: true);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                  'https://cdn-icons-png.flaticon.com/128/349/349221.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Payment with visa',
                                style: TextStyle(
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
