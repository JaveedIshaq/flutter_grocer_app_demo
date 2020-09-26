import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}

class SimpleLogPrinter extends LogPrinter {
  final String className;
  SimpleLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    AnsiColor color = PrettyPrinter.levelColors[event.level];
    String emoji = PrettyPrinter.levelEmojis[event.level];
    return [color('$emoji [$className]: ${event.message}')];
  }
}

// in class simple import this class
// and write ... Logger log = getLogger("ClasssName");
//log.v("This is a verbose");
//log.d("this is a debug message");
//log.i("This is info, should be used for public calls");
//log.w("This might become problem: a warning message");
//log.e("This is the error message");
