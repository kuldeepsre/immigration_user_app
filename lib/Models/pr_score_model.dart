class PrScoreModel {
  PrScoreModel(
    this.name,
    this.father,
    this.address,
    this.city,
    this.detail,
    this.mobile,
    this.applyFor,
    this.email,
    this.cityCourse,
    this.level,
    this.fieldOfStudy,
    this.passingYear,
    this.percentage,
    this.paasportNo,
    this.boardUniversity,
    this.aadharNo,
    this.testName,
    this.listening,
    this.reading,
    this.writing,
    this.speaking,
    this.overallBand,
    this.companyName,
    this.designation,
    this.from,
    this.to,
    this.travelHistory,
    this.anyRefusal,
    this.whenWhy,
    this.relativeAbroad,
    this.relativeAddress,
    this.finanical,
    this.fatherOccupation,
    this.motherOccupation,
    this.familyBackground,
  );

  String? name;
  String? father;
  String? address;
  String? city;
  String? detail;
  String? mobile;
  String? applyFor;
  String? email;
  String? cityCourse;
  String? level;
  String? fieldOfStudy;
  String? passingYear;
  String? percentage;
  String? paasportNo;
  String? boardUniversity;
  String? aadharNo;
  String? testName;
  String? listening;
  String? reading;
  String? writing;
  String? speaking;
  String? overallBand;
  String? companyName;
  String? designation;
  String? from;
  String? to;
  String? travelHistory;
  String? anyRefusal;
  String? whenWhy;
  String? relativeAbroad;
  String? relativeAddress;
  String? finanical;
  String? fatherOccupation;
  String? motherOccupation;
  String? familyBackground;

  PrScoreModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    father = json['father'];
    address = json['address'];
    city = json['city'];
    detail = json['detail'];
    mobile = json['mobile'];
    applyFor = json['applyFor'];
    email = json['email'];
    cityCourse = json['cityCourse'];
    level = json['level'];
    fieldOfStudy = json['fieldOfStudy'];
    passingYear = json['passingYear'];
    percentage = json['percentage'];
    paasportNo = json['paasportNo'];
    boardUniversity = json['boardUniversity'];
    aadharNo = json['aadharNo'];
    testName = json['testName'];
    listening = json['listening'];
    reading = json['reading'];
    writing = json['writing'];
    speaking = json['speaking'];
    overallBand = json['overallBand'];
    companyName = json['companyName'];
    designation = json['designation'];
    from = json['from'];
    to = json['to'];
    travelHistory = json['travelHistory'];
    anyRefusal = json['anyRefusal'];
    whenWhy = json['whenWhy'];
    relativeAbroad = json['relativeAbroad'];
    relativeAddress = json['relativeAddress'];
    finanical = json['finanical'];
    fatherOccupation = json['fatherOccupation'];
    motherOccupation = json['motherOccupation'];
    familyBackground = json['familyBackground'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['father'] = father;
    _data['address'] = address;
    _data['city'] = city;
    _data['detail'] = detail;
    _data['mobile'] = mobile;
    _data['applyFor'] = applyFor;
    _data['email'] = email;
    _data['cityCourse'] = cityCourse;
    _data['level'] = level;
    _data['fieldOfStudy'] = fieldOfStudy;
    _data['passingYear'] = passingYear;
    _data['percentage'] = percentage;
    _data['paasportNo'] = paasportNo;
    _data['boardUniversity'] = boardUniversity;
    _data['aadharNo'] = aadharNo;
    _data['testName'] = testName;
    _data['listening'] = listening;
    _data['reading'] = reading;
    _data['writing'] = writing;
    _data['speaking'] = speaking;
    _data['overallBand'] = overallBand;
    _data['companyName'] = companyName;
    _data['designation'] = designation;
    _data['from'] = from;
    _data['to'] = to;
    _data['travelHistory'] = travelHistory;
    _data['anyRefusal'] = anyRefusal;
    _data['whenWhy'] = whenWhy;
    _data['relativeAbroad'] = relativeAbroad;
    _data['relativeAddress'] = relativeAddress;
    _data['finanical'] = finanical;
    _data['fatherOccupation'] = fatherOccupation;
    _data['motherOccupation'] = motherOccupation;
    _data['familyBackground'] = familyBackground;
    return _data;
  }
}
