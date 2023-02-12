import 'dart:async';
import 'dart:io';

import 'package:e_commerce_app/bloc/Payment/cubit/payment_cubit.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../service/local/sp__keys.dart';
import '../../service/local/sp_helper.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({Key? key}) : super(key: key);

  @override
  State<VisaScreen> createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()
        ..getPaymentRequest('10', 'mostafaa', 'baher', 'test', '01000694166'),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(actions: [
                IconButton(
                  onPressed: () {
                    paymentExitApp(context);
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                  ),
                )
              ]),
              body: WebView(
                initialUrl:
                    'https://accept.paymob.com/api/acceptance/iframes/730756?payment_token=${SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.finalToken)}',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  // _controller.complete(webViewController);
                },
                // onProgress: (int progress) {
                //   print('WebView is loading (progress : %)');
                // },
                // javascriptChannels: <JavascriptChannel>{
                //   _toasterJavascriptChannel(context),
                // },
                // navigationDelegate: (NavigationRequest request) {
                //   if (request.url.startsWith('https://www.google.com/')) {
                //     print('blocking navigation to }');
                //     return NavigationDecision.prevent;
                //   }
                //   print('allowing navigation to ');
                //   return NavigationDecision.navigate;
                // },
                // onPageStarted: (String url) {
                //   print('Page started loading: ');
                // },
                // onPageFinished: (String url) {
                //   print('Page finished loading: ');
                // },
                // gestureNavigationEnabled: true,
                // backgroundColor: const Color(0x00000000),
              ),
            ),
          );
        },
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }

  // to exit from app
  void paymentExitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Are you sure completed the pay',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                AppNavigator.appNavigator(context, RegisterScreen(),
                    isFinished: true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
