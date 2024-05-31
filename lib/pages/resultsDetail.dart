import 'package:cached_network_image/cached_network_image.dart';
import 'package:flusk_app/controller/analysisController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResultsDetailPage extends StatefulWidget {
  const ResultsDetailPage({Key? key}) : super(key: key);

  @override
  State<ResultsDetailPage> createState() => _ResultsDetailPageState();
}

class _ResultsDetailPageState extends State<ResultsDetailPage> {
  AnalysisController controller = Get.put(AnalysisController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                          Text(controller.selectedResults.value.title ??"", style: const TextStyle(fontSize: 30)),
                          const SizedBox(height: 10),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.selectedResults.value.images?.length,
                              itemBuilder: (context, index){
                            return CachedNetworkImage(
                              imageUrl: controller.selectedResults.value.images?[index] ?? "",
                              placeholder: (context, url) =>Lottie.asset("assets/lottie/progressIndicator.json"),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            );
                          }),
                        ],
                      ),
              ),
        ),
        ),
      );
  }
}
