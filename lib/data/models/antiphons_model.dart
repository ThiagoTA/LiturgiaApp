class AntiphonsModel {
  final String entrada;
  final String comunhao;

  AntiphonsModel({
    required this.entrada,
    required this.comunhao,
  });

  factory AntiphonsModel.fromJson(Map<String, dynamic> json) {
    return AntiphonsModel(
      entrada: json['entrada'] ?? '', 
      comunhao: json['comunhao'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'entrada': entrada,
      'comunhao': comunhao,
    };
  }
}