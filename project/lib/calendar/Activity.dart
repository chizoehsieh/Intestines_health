import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:test1/calendar/Activity.dart';
// import 'package:test1/calendar/Activity.freezed.dart';
import 'constant.dart';
import 'package:test1/calendar/constant.dart';



const String activityBoxName = 'activity';

@freezed
abstract class Activity with _$Activity {
  const Activity._();
  @HiveType(typeId: kActivityTypeId, adapterName: 'ActivityAdapter')
  const factory Activity({
    @HiveField(0) String? objid,
    @HiveField(1) required int day,
    @HiveField(2) required int month,
    @HiveField(3) required int year,
    @HiveField(4) double? health,
    @HiveField(5) int? healthId,
    @HiveField(6) String? imgid,

  }) = _Activity;
  factory Activity.from(Activity activity){
    return _Activity(
      day: activity.day,
      month: activity.month,
      year: activity.year,
      health: activity.health,
      objid: activity.objid,
      healthId: activity.healthId,
      imgid: activity.imgid,
    );
  }
  bool isFilled(){
    return (this.health != null);

  }
  bool isNullOrEmpty(String? value){
    return value == null
        ? true
        : value.isEmpty
          ? false
          : true;
  }
  String dateFormat(){
    final date = DateTime(year, month, day);
    return DateFormat.yMMMd(Intl.defaultLocale).format(date);
  }

}

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('error');

class _$ActivityTearOff{
  const _$ActivityTearOff();

  _Activity call(
      {
        @HiveField(0) String? objid,
        @HiveField(1) required int day,
        @HiveField(2) required int month,
        @HiveField(3) required int year,
        @HiveField(4) double? health,
        @HiveField(5) int? healthId,
        @HiveField(6) String? imgid,

      }
      ){
    return _Activity(
      objid:objid,
      day:day,
      month:month,
      year:year,
      health:health,
      healthId:healthId,
      imgid:imgid,
    );
  }
}

const $Activity  = _$ActivityTearOff();

mixin _$Activity{
  @HiveField(0)
  String? get objid => throw _privateConstructorUsedError;
  @HiveField(1)
  int get day => throw _privateConstructorUsedError;
  @HiveField(2)
  int get month => throw _privateConstructorUsedError;
  @HiveField(3)
  int get year => throw _privateConstructorUsedError;
  @HiveField(4)
  double? get health => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get healthId => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get imgid => throw _privateConstructorUsedError;

  @JsonKey(ignore:true)
  $ActivityCopyWith<Activity> get copyWith => throw _privateConstructorUsedError;
}

abstract class $ActivityCopyWith<$Res>{
  factory $ActivityCopyWith(Activity value,$Res Function(Activity) then) = _$ActivityCopyWithImpl<$Res>;
  $Res call(
      {
        @HiveField(0) String? objid,
        @HiveField(1) int day,
        @HiveField(2) int month,
        @HiveField(3) int year,
        @HiveField(4) double? health,
        @HiveField(5) int? healthId,
        @HiveField(6) String? imgid,
      }
      );
}

class _$ActivityCopyWithImpl<$Res> implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value,this._then);

  final Activity _value;
  final $Res Function(Activity) _then;

  @override
  $Res call({
    Object? objid = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? health = freezed,
    Object? healthId = freezed,
    Object? imgid = freezed,
  }) {
    return _then(_value.copyWith(
      objid:objid == freezed ? _value.objid : objid as String,
      day:day == freezed ? _value.day : day as int,
      month:month == freezed ? _value.month : month as int,
      year:year == freezed ? _value.year : year as int,
      health:health == freezed ? _value.health : health as double,
      healthId:healthId == freezed ? _value.healthId : healthId as int,
      imgid:imgid == freezed ? _value.imgid : imgid as String,
    ));
  }
}

abstract class _$ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res>{
  factory _$ActivityCopyWith(_Activity value,$Res Function(_Activity) then) =
  _$CopyWithImpl<$Res>;

  @override

  $Res call(
      {
        @HiveField(0) String? objid,
        @HiveField(1) int day,
        @HiveField(2) int month,
        @HiveField(3) int year,
        @HiveField(4) double? health,
        @HiveField(5) int? healthId,
        @HiveField(6) String? imgid,
      }
      );
}

class _$CopyWithImpl<$Res> extends _$ActivityCopyWithImpl<$Res>
    implements _$ActivityCopyWith<$Res> {
  _$CopyWithImpl(_Activity _value, $Res Function(_Activity) _then)
      : super(_value, (v) => _then(v as _Activity));

  @override
  _Activity get _value => super._value as _Activity;

  @override
  $Res call({
    Object? objid = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? health = freezed,
    Object? healthId = freezed,
    Object? imgid = freezed,
  }){
    return _then(_Activity(
      objid:objid == freezed ? _value.objid : objid as String,
      day:day == freezed ? _value.day : day as int,
      month:month == freezed ? _value.month : month as int,
      year:year == freezed ? _value.year : year as int,
      health:health == freezed ? _value.health : health as double,
      healthId:healthId == freezed ? _value.healthId : healthId as int,
      imgid:imgid == freezed ? _value.imgid : imgid as String,
    ));
  }
}

@HiveType(typeId: kActivityTypeId, adapterName: 'ActivityAdapter')
class _$_Activity extends _Activity{
  const _$_Activity(
      {
        @HiveField(0) this.objid,
        @HiveField(1) required this.day,
        @HiveField(2) required this.month,
        @HiveField(3) required this.year,
        @HiveField(4) this.health,
        @HiveField(5) this.healthId,
        @HiveField(6) this.imgid,
      }
      ) : super._();
  @override
  @HiveField(0)
  final String? objid;
  @override
  @HiveField(1)
  final int day;
  @override
  @HiveField(2)
  final int month;
  @override
  @HiveField(3)
  final int year;
  @override
  @HiveField(4)
  final double? health;
  @override
  @HiveField(5)
  final int? healthId;
  @override
  @HiveField(6)
  final String? imgid;

  @override
  String toString(){
    return 'Activity(objid:'+objid.toString()+',day:'+day.toString()+',month:'+month.toString()+',year:'+year.toString()+',health:'+health.toString() +',healthId:'+healthId.toString()+',imgid:'+imgid.toString();
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other)||
        (other.runtimeType == runtimeType &&
            other is _Activity &&
            (identical(other.objid, objid) || other.objid == objid)&&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.health, health) || other.health == health)&&
            (identical(other.healthId, healthId) || other.healthId == healthId)&&
            (identical(other.imgid, imgid) || other.imgid == imgid)
        );
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, objid,day,month,year,health,healthId,imgid);

  @JsonKey(ignore:true)
  @override
  _$ActivityCopyWith<_Activity> get copyWith =>
      _$CopyWithImpl<_Activity>(this,_$identity);
}

abstract class _Activity extends Activity{
  const factory _Activity(
      {@HiveField(0) String? objid,
        @HiveField(1) required int day,
        @HiveField(2) required int month,
        @HiveField(3) required int year,
        @HiveField(4) double? health,
        @HiveField(5) int? healthId,
        @HiveField(6) String? imgid,
      }
      ) = _$_Activity;
  const _Activity._() : super._();

  @override
  @HiveField(0)
  String? get objid;
  @override
  @HiveField(1)
  int get day;
  @override
  @HiveField(2)
  int get month;
  @override
  @HiveField(3)
  int get year;
  @override
  @HiveField(4)
  double? get health;
  @override
  @HiveField(5)
  int? get healthId;
  @override
  @HiveField(6)
  String? get imgid;

  @override
  @JsonKey(ignore: true)
  _$ActivityCopyWith<_Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

class ActivityAdapter extends TypeAdapter<_$_Activity>{
  @override
  final int typeId = 0;

  @override
  _$_Activity read(BinaryReader reader){
    final numOfFields = reader.readByte();
    final fields = <int,dynamic>{
      for (int i=0;i<numOfFields;i++) reader.readByte() : reader.read(),
    };
    return _$_Activity(
        objid: fields[0] as String?,
        day: fields[1] as int,
        month: fields[2] as int,
        year: fields[3] as int,
        health: fields[4] as double?,
        healthId: fields[5] as int?,
        imgid:fields[6] as String?
    );
  }

  @override
  void write(BinaryWriter writer,_$_Activity obj){
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.objid)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.health)
      ..writeByte(5)
      ..write(obj.healthId)
      ..writeByte(6)
      ..write(obj.imgid)
    ;

  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ActivityAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
