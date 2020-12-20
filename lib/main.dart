import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
void main() {
  runApp(myapp());
}
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WE CARE',
      home: homepage(),
    );
  }
}
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
 CalendarController _controller;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Period Calender'),
        flexibleSpace: Image(
          image: AssetImage('assets/title.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            TableCalendar(
              //initialCalendarFormat: CalendarFormat.week,
                calendarStyle: CalendarStyle(
                  todayColor: Colors.pink[400],
                  selectedColor: Colors.deepPurple,
                  todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color:Colors.white
                  )
                ),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color:Colors.pink[400],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date, events,_) {
                  print(date.toIso8601String());
                },
                builders: CalendarBuilders(
                 selectedDayBuilder: (context,date, events)=> Container(
                   margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                  decoration: BoxDecoration(
                     color:Colors.purple,
                     shape:BoxShape.circle,
                 ),
                     child:Text(date.day.toString(),
                     style: TextStyle(
                       color: Colors.white,
                     ),)
                ),
               todayDayBuilder: (context,date,events)=> Container(
                   margin: const EdgeInsets.all(4.0),
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     color:Colors.pink,
                     shape:BoxShape.circle,
                   ),
                   child:Text(date.day.toString(),
                     style: TextStyle(
                       color: Colors.white,
                     ),)
               ),
                ),

                calendarController:_controller,)
          ],
        ),
      ),

    );
  }
}

