import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'tasks_record.g.dart';

abstract class TasksRecord implements Built<TasksRecord, TasksRecordBuilder> {
  static Serializer<TasksRecord> get serializer => _$tasksRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get description;

  @nullable
  Timestamp get deadline;

  @nullable
  bool get completed;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TasksRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..completed = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TasksRecord._();
  factory TasksRecord([void Function(TasksRecordBuilder) updates]) =
      _$TasksRecord;
}

Map<String, dynamic> createTasksRecordData({
  String name,
  String description,
  Timestamp deadline,
  bool completed,
}) =>
    serializers.serializeWith(
        TasksRecord.serializer,
        TasksRecord((t) => t
          ..name = name
          ..description = description
          ..deadline = deadline
          ..completed = completed));

TasksRecord get dummyTasksRecord {
  final builder = TasksRecordBuilder()
    ..name = dummyString
    ..description = dummyString
    ..deadline = dummyTimestamp
    ..completed = dummyBoolean;
  return builder.build();
}

List<TasksRecord> createDummyTasksRecord({int count}) =>
    List.generate(count, (_) => dummyTasksRecord);
