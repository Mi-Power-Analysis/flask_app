import 'package:flusk_app/analysisDetail.dart';
import 'package:flusk_app/home.dart';
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
];

class RouteMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }}