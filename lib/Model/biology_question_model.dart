class BiologyQuestionModel {
  bool? success;
  String? message;
  List<BiologyQuizData>? biologyQuizData;

  BiologyQuestionModel({this.success, this.message, this.biologyQuizData});

  BiologyQuestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['biology_quiz_data'] != null) {
      biologyQuizData = <BiologyQuizData>[];
      json['biology_quiz_data'].forEach((v) {
        biologyQuizData!.add(new BiologyQuizData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.biologyQuizData != null) {
      data['biology_quiz_data'] =
          this.biologyQuizData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BiologyQuizData {
  int? levelId;
  List<Questions>? questions;

  BiologyQuizData({this.levelId, this.questions});

  BiologyQuizData.fromJson(Map<String, dynamic> json) {
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