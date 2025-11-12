class CreatePostRequest {
  String title;
  String description;
  String userId;

  CreatePostRequest({
    required this.title,
    required this.description,
    required this.userId,
  });

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) {
    return CreatePostRequest(
      title: json['title'],
      description: json['description'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['userId'] = userId;
    return data;
  }
}
