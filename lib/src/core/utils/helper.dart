Map<String, dynamic> getFieldData({
  required Map<String, dynamic> json,
  required String key,
}) =>
    json[key] as Map<String, dynamic>;
