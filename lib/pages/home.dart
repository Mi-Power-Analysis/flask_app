import 'package:flusk_app/controller/analysisController.dart';
import 'package:flusk_app/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AnalysisController controller = Get.put(AnalysisController());
  String url = '';
  var data;
  String output = "Initial Output";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        title: Text("Analysis Walmart Sales", style: TextStyle(fontWeight: FontWeight.w500),),
      backgroundColor: Color(0xffEFEFEF),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: controller.fetchData(),
          builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: Lottie.asset("assets/lottie/progressIndicator.json", width: 70),
                );
              }else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }else{
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Lottie.asset("assets/lottie/homeLottie.json"),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.responseModel.value.analysis?.length,
                        itemBuilder: (context, index){
                          var  model = controller.responseModel.value.analysis?[index];
                          return GestureDetector(
                            onTap: (){
                              controller.selectedAnalysis.value = model!;
                              Get.toNamed("/detail");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: colors[index],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                                    child: Text(
                                      model?.title ?? "",
                                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
          },
        ),
      )
    );
  }
}
