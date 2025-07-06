class TesbihModel {
  final String text;
  final int count;
  final int limit;

  TesbihModel({
    required this.text,
    this.count = 0,
    this.limit = 33,
  });

  TesbihModel copyWith({
    String? text,
    int? count,
    int? limit,
  }) {
    return TesbihModel(
      text: text ?? this.text,
      count: count ?? this.count,
      limit: limit ?? this.limit,
    );
  }
}
