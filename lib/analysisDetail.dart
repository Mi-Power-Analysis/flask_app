import 'package:cached_network_image/cached_network_image.dart';
import 'package:flusk_app/analysisController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(title: Text("Simple Flask Detail"),),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(controller.selectedAnalysis.value.title ??"", style: const TextStyle(fontSize: 30)),
              Text(controller.selectedAnalysis.value.description ??""),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.selectedAnalysis.value.images?.length,
                  itemBuilder: (context, index){
                    return CachedNetworkImage(
                      imageUrl: controller.selectedAnalysis.value.images?[index] ?? "",
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
