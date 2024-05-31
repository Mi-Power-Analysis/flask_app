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
  List<Results>? results;

  Analysis({this.title, this.results});

  Analysis.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? title;
  String? description;
  List<String>? images;

  Results({this.title, this.description, this.images});

  Results.fromJson(Map<String, dynamic> json) {
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