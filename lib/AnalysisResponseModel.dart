class AnalysisResponseModel {
  List<Analysis>? analysis;

  AnalysisResponseModel({this.analysis});

  AnalysisResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['analysis'] != null) {
      analysis = <Analysis>[];
      json['analysis'].forEach((v) {
        analysis!.add(new Analysis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.analysis != null) {
      data['analysis'] = this.analysis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Analysis {
  String? title;
  String? description;
  List<String>? images;

  Analysis({this.title, this.description, this.images});

  Analysis.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['images'] = this.images;
    return data;
  }
}