import 'package:cached_network_image/cached_network_image.dart';
import 'package:flusk_app/controller/analysisController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../color.dart';

class AnalysisDetail extends StatefulWidget {
  const AnalysisDetail({Key? key}) : super(key: key);

  @override
  State<AnalysisDetail> createState() => _AnalysisDetailState();
}

class _AnalysisDetailState extends State<AnalysisDetail> {
  AnalysisController controller = Get.put(AnalysisController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${controller.selectedAnalysis.value.title} Detay"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Lottie.asset("assets/lottie/analysisDetail.json"),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.selectedAnalysis.value.results?.length,
                  itemBuilder: (context, index){
                    var  model = controller.selectedAnalysis.value.results?[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: (){
                          controller.selectedResults.value = model!;
                          Get.toNamed("/result");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: analysisDetailColor[index],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                              child: Text(controller.selectedAnalysis.value.results?[index].title ??"",
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
                                textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
