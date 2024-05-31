import 'package:flusk_app/pages/analysisDetail.dart';
import 'package:flusk_app/pages/home.dart';
import 'package:flusk_app/pages/resultsDetail.dart';
import 'package:get/get.dart';

appRoutes() => [
  GetPage(
    name: '/home',
    page: () => HomePage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/detail',
    page: () => AnalysisDetail(),
    middlewares: [RouteMiddleware()],
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/result',
    page: () => ResultsDetailPage(),
    middlewares: [RouteMiddleware()],
    transitionDuration: Duration(milliseconds: 500),
  ),
];

class RouteMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }}