import 'dart:convert';

class DataSanitizerUtil {
  const DataSanitizerUtil();
  ///
  ///
  /// Removes all null values and empty from given map.
  ///
  void removeNullFromMap(Map data) {
    data.removeWhere((key, value) =>
        value == null || ((value is Map || value is List) && value.isEmpty));
    data.forEach((key, value) {
      if (value is Map) {
        removeNullFromMap(value);
      }
      if (value is List) {
        for (var e in value) {
          if (e is Map) {
            if (value.isEmpty) {
              data.remove(key);
            } else
              removeNullFromMap(e);
          }
        }
      }
    });
  }

  T? getFromMapOrNull<T>(
      dynamic json, T Function(Map<dynamic, dynamic>) fromJson) {
    if (json == null) return null;
    if (json is Map) return fromJson(json);
    if (json is List) return null;
    if (json is String) {
      try {
        return getFromMapOrNull(jsonDecode(json), fromJson);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

   T getFromMapWithDefault<T>(
      dynamic json, T Function(Map<dynamic, dynamic>) fromJson, T defaultValue) {
    return getFromMapOrNull<T>(json, fromJson) ?? defaultValue;
  }

   T? getDifferentOrNull<T>(T current, [T? defaultValue]) {
    if (current == defaultValue || current == null) return null;

    return current;
  }

   T? getFromMultipleTypes<T>(
    dynamic data, {
    T Function(Map<dynamic, dynamic> value)? fromMap,
    T Function(int value)? fromInt,
    T Function(String value)? fromString,
    T Function(double value)? fromdouble,
    T Function(List<dynamic> value)? fromList,
    T Function(dynamic value)? others,
  }) {
    if (data is Map) {
      return fromMap?.call(data);
    } else if (data is int) {
      if (T is int) {
        return data as T;
      }
      return fromInt?.call(data);
    } else if (data is String) {
      if (T is String) {
        return data as T;
      }
      return fromString?.call(data);
    } else if (data is double) {
      if (T is double) {
        return data as T;
      }
      return fromdouble?.call(data);
    } else if (data is List) {
      return fromList?.call(data);
    }
    return others?.call(data);
  }
}
