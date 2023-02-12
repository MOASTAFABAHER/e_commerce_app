import 'package:e_commerce_app/bloc/auth/firebase/cubit/firebase_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_social_circle_avtar.dart';

class SocialIconsComponent extends StatelessWidget {
  const SocialIconsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseCubit(),
      child: BlocConsumer<FirebaseCubit, FirebaseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = FirebaseCubit.get(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MySocialCircleAvtar(
                function: () {
                  cubit.signInWithFacebook();
                },
                urlImage:
                    'https://cdn-icons-png.flaticon.com/512/3128/3128304.png',
              ),
              SizedBox(
                width: 20.w,
              ),
              MySocialCircleAvtar(
                  urlImage:
                      'https://cdn-icons-png.flaticon.com/512/3128/3128310.png'),
              SizedBox(
                width: 20.w,
              ),
              MySocialCircleAvtar(
                  function: () {
                    cubit.signInWithGoogle();
                    print('click');
                  },
                  urlImage:
                      'https://as2.ftcdn.net/v2/jpg/05/43/15/21/1000_F_543152111_5AOLJw31Hs1TCsRHxVqAgTAaUl4xg2cg.jpg')
            ],
          );
        },
      ),
    );
  }
}
