class CreatePostRequest {
  String title;
  String? description;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  CreatePostRequest({
    required this.title,
    this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) {
    return CreatePostRequest(
      title: json['title'],
      description: json['description'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
