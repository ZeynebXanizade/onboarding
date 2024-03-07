import 'package:flutter/material.dart';
import 'package:splashscreen/src/constants/colors.dart';
import 'package:splashscreen/src/domain/models/splashmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
    required this.models,
  });
  final SplashScreenModel models;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size.height;
    return Container(
      color: models.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            width: models.width,
            height: models.height,
            image: AssetImage(
              models.image,
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  models.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  models.subTitle,
                  style: const TextStyle(fontSize: 18, color: myWhiteColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Text(
            models.counterText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 130,
          )
        ],
      ),
    );
  }
}
