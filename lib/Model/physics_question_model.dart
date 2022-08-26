class PhysicsQuestionModel {
  bool? success;
  String? message;
  List<PhysicQuiz>? physicQuiz;

  PhysicsQuestionModel({this.success, this.message, this.physicQuiz});

  PhysicsQuestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['Physic_Quiz'] != null) {
      physicQuiz = <PhysicQuiz>[];
      json['Physic_Quiz'].forEach((v) {
        physicQuiz!.add(new PhysicQuiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.physicQuiz != null) {
      data['Physic_Quiz'] = this.physicQuiz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhysicQuiz {
  int? levelId;
  List<Questions>? questions;

  PhysicQuiz({this.levelId, this.questions});

  PhysicQuiz.fromJson(Map<String, dynamic> json) {
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