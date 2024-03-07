import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:splashscreen/src/constants/colors.dart';
import 'package:splashscreen/src/constants/image.dart';
import 'package:splashscreen/src/constants/texts.dart';
import 'package:splashscreen/src/domain/models/splashmodel.dart';
import 'package:splashscreen/src/presentation/widgets/splashview.dart';

class MyPageControllers extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;
  final pages = [
    SplashView(
        models: SplashScreenModel(myPageOneImage, myOnePageTextOne,
            myOnePageTextTwo, myOnePageTextThree, myPageOneColor, 300 , 300)),
    SplashView(
        models: SplashScreenModel(myPageTwoImage, myTwoPageTextOne,
            myTwoPageTextTwo, myTwoPageTextThree, myPageTwoColor, 340 , 600)),
    SplashView(
        models: SplashScreenModel(myPageThreeImage, myThreePageTextOne,
            myThreePageTextTwo, myThreePageTextThree, myPageThreeColor , 300, 400))
  ];
  void onPageChangedCallBack(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() => controller.jumpToPage(page: 2);
  animated() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
