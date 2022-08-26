class GeologyQuestionModel {
  bool? success;
  String? message;
  List<GeologyQuiz>? geologyQuiz;

  GeologyQuestionModel({this.success, this.message, this.geologyQuiz});

  GeologyQuestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['Geology_Quiz'] != null) {
      geologyQuiz = <GeologyQuiz>[];
      json['Geology_Quiz'].forEach((v) {
        geologyQuiz!.add(new GeologyQuiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.geologyQuiz != null) {
      data['Geology_Quiz'] = this.geologyQuiz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GeologyQuiz {
  int? levelId;
  List<Questions>? questions;

  GeologyQuiz({this.levelId, this.questions});

  GeologyQuiz.fromJson(Map<String, dynamic> json) {
    levelId = json['levelId'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['levelId'] = this.levelId;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? question;
  List<Options>? options;

  Questions({this.question, this.options});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? option;
  bool? isAnswer;

  Options({this.option, this.isAnswer});

  Options.fromJson(Map<String, dynamic> json) {
    option = json['option'];
    isAnswer = json['isAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option'] = this.option;
    data['isAnswer'] = this.isAnswer;
    return data;
  }
}