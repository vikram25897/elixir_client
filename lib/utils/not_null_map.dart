import 'dart:collection';

class NotNullMapBuilder {
  final Map<String, dynamic> _hashMap = HashMap<String, dynamic>();

  NotNullMapBuilder();

  put(String key, dynamic value) {
    if(value!=null && value is Map)
      _hashMap.putIfAbsent(key,()=> NotNullMapBuilder.fromMap(value).build());
    else
    if (value != null) _hashMap.putIfAbsent(key, () => value);
  }

  factory NotNullMapBuilder.fromMap(Map map) {
    NotNullMapBuilder builder = NotNullMapBuilder();
    map.keys.forEach((k) {
      builder.put(k, map[k]);
    });
    return builder;
  }

  Map build() {
    print(_hashMap);
    return _hashMap;
  }
}
