class Id{
  Id(this.day,this.month,this.year);
  final int day;
  final int month;
  final int year;

  //Input format'yyyy/mm/dd'
  Id.from(String s)
      :this.day = int.parse(s.split('/')[2]),
       this.month = int.parse(s.split('/')[1]),
       this.year = int.parse(s.split('/')[2]);

  DateTime toDateTime(){
    return DateTime(year,month,day);
  }

  @override
  bool operator == (o) =>
      o is Id && o.day == day && o.month == month && o.year == year;

  @override
  int get hashCode => day.hashCode + month.hashCode + year.hashCode;

  @override
  String toString(){
    return (year.toString()+'/'+month.toString()+'/'+day.toString());
  }
}