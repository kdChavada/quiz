class DayQuizModel {
  bool? success;
  String? message;
  List<QuizData>? quizData;

  DayQuizModel({this.success, this.message, this.quizData});

  DayQuizModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['quiz_data'] != null) {
      quizData = <QuizData>[];
      json['quiz_data'].forEach((v) {
        quizData!.add(QuizData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (quizData != null) {
      data['quiz_data'] = quizData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizData {
  int? day;
  List<Questions>? questions;

  QuizData({this.day, this.questions});

  QuizData.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? file;
  int? level;
  int? question;

  Questions({this.file, this.level, this.question});

  Questions.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    level = json['level'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['level'] = level;
    data['question'] = question;
    return data;
  }
}