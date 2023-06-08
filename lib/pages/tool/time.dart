import 'package:intl/intl.dart';


final DateFormat _API_FORMAT = DateFormat("yyyy-MM-ddTHH:mm:ss");
final DateTime EPOCH = DateTime.fromMillisecondsSinceEpoch(0);

String standardFormat(DateTime dateTime){
  return _API_FORMAT.format(dateTime)+"+08:00";
}

DateTime parseTime(String string){
  try{
    return _API_FORMAT.parse(string.substring(0,_API_FORMAT.pattern!.length-1 ));
  }
  catch(err){
    return EPOCH;
  }
}
