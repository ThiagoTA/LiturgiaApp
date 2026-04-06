class ReadingItemModel {
  final String referencia;
  final String titulo;
  final String texto;
  final String? refrao;

  ReadingItemModel({
    required this.referencia,
    required this.titulo,
    required this.texto,
    this.refrao,
  });

  String get displayTitle {
    if (titulo.trim().isNotEmpty) {
      return titulo;
    }
    if (refrao?.trim().isNotEmpty == true) {
      return refrao!;
    }
    return '';
  }

  factory ReadingItemModel.fromJson(Map<String, dynamic> json) {
    return ReadingItemModel(
      referencia: json['referencia'] ?? '',
      titulo: json['titulo'] ?? '',
      texto: json['texto'] ?? '',
      refrao: json['refrao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'referencia': referencia,
      'titulo': titulo,
      'texto': texto,
      'refrao': refrao,
    };
  }
}
