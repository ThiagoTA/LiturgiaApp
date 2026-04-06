class ExtrasModel {
  final String titulo;
  final String texto;
  final String? tipo;
  final String? referencia;

  ExtrasModel({
    required this.titulo,
    required this.texto,
    this.tipo,
    this.referencia
  });

  factory ExtrasModel.fromJson(Map<String, dynamic> json) {
    return ExtrasModel(
      titulo: json['titulo'] ?? '',
      texto: json['texto'] ?? '',
      tipo: json['tipo'],
      referencia: json['referencia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'texto': texto,
      'tipo': tipo,
      'referencia': referencia,
    };
  }
}