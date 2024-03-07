import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splashscreen/src/constants/colors.dart';
import 'package:splashscreen/src/presentation/getX/controllers/pagecontroller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MyPageControllers();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            onPageChangeCallback: (activePageIndex) =>
                controller.onPageChangedCallBack(activePageIndex),
            liquidController: controller.controller,
            pages: controller.pages,
            slideIconWidget: const Icon(Icons.arrow_back_ios_new_rounded),
            enableSideReveal: true,
          ),
          //circle
          Positioned(
              bottom: 50,
              child: OutlinedButton(
                  onPressed: () => controller.animated(),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: myDarkColor),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(28),
                      foregroundColor: myWhiteColor),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                        color: myDarkColor, shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_forward_ios),
                  ))),
          //skip
          Positioned(
              top: 40,
              right: 20,
              child: TextButton(
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  onPressed: () => controller.skip())),

          // 3 noqteler
          Obx(
            () =>  Positioned(
                bottom: 20,
                child: AnimatedSmoothIndicator(
                    effect: const WormEffect(
                        activeDotColor: myDarkColor, dotHeight: 5),
                    activeIndex: controller.currentPage.value,
                    count: 3)),
          )
        ],
      ),
    );
  }
}
