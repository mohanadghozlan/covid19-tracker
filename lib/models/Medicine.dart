import 'package:cloud_firestore/cloud_firestore.dart';

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

class Medicine {
  var name;
  var day;
  var time;
  var timestamp;
  DocumentReference reference;

  Medicine({
    this.name,
    this.day,
    this.time,
    this.timestamp,
    this.reference,
  });

  Medicine.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['day'] != null),
        assert(map['time'] != null),
        assert(map['timestamp'] != null),
        name = map['name'],
        day = map['day'],
        time = map['time'],
        timestamp = map['timestamp'];
  Medicine.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$day:$time>";
}
