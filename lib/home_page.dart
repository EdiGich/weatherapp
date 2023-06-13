// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/getLocation.dart';
import 'package:weatherapp/weatherData.dart';


    var dayInfo = DateTime.now();
    var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MyHomePage extends StatelessWidget {
    // MyHomePage({Key? key})  : super(key: key);
    var client = WeatherData();
    var data;

//Asynchronous (async) operations les the program complete work while waiting for another operation to finish.
    info() async{
      var position = await GetPosition();
      data = await client.getData(position.latitude, position.longitude);
      return data;
    }
    //position.latitude, position.longitude

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
        return  Container(
        child: Column(
          children: [
              Container(
                  height: size.height * 0.75,
                  width: size.width,
                  padding: EdgeInsets.only(top: 30),
                  margin: EdgeInsets.only(right:10, left:10),
                  decoration: BoxDecoration(
                    color:Colors.red,
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff955cd1),
                        Color(0xff3fa2fa),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 19,
                      ),
                      Text(                        
                        '${data?.cityName}',
                        style: TextStyle(
                        color: Colors.white.withOpacity(0.9), 
                        fontSize: 45,
                        fontFamily:'MavenPro'),
                        
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        dateFormat,
                        style: TextStyle(color: Colors.white.withOpacity(0.9), 
                        fontSize: 15,
                        fontFamily:'MavenPro'),
                      ),
                      // Image.asset(
                      //   'assets/images/sunny.png',
                      //   width: size.width*0.4,
                      //   ),
                      Image.network(
                        'https:${data?.icon}',
                        width: size.width *0.36,
                        fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                        '${data?.condition}',
                        style: TextStyle(
                        color: Colors.white, 
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        fontFamily:'Hubballi'),
                      ),
                        SizedBox(
                          height: 20,
                        ),
                          Text(
                        '${data?.temp}°',
                        style: TextStyle(
                        color: Colors.white, 
                        fontSize: 75,
                        fontWeight: FontWeight.w800,
                        fontFamily:'Hubballi'),
                      ),
                      SizedBox(
                        height:80,
                      ),
                      //The symbols
                      Row(
                        children: [
                          Expanded(child: Column(
                            children:[
                            Image.asset(
                              'assets/images/storm.png',
                              width: size.width * 0.15,
                            ),
                            Text(
                              '${data?.wind} km/h',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Hubballi',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                            Text(
                              'Wind',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                          ),
                          ),
                          Expanded(child: Column(
                            children:[
                            Image.asset(
                              'assets/images/humidity.png',
                              width: size.width * 0.15,
                            ),
                            Text(
                              '${data?.humidity}',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Hubballi',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                          ),
                          ),
                          Expanded(child: Column(
                            children:[
                            Image.asset(
                              'assets/images/wind-direction.png',
                              width: size.width * 0.15,
                            ),
                            Text(
                              '${data?.wind_dir}',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Hubballi',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                            Text(
                              'Wind Direction',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                          ),
                          ),
                        ],
                      ),

                    ], 
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Gust',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily:'MavenPro',
                            fontSize:17),
                          ),
                      SizedBox(
                              height: 5,
                            ),
                        Text(
                          '${data?.gust} kp/h',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily:'MavenPro',
                            fontSize:23),
                          ),
                      SizedBox(
                        height:10,
                      ),
                        Text(
                          'Pressure',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily:'MavenPro',
                            fontSize:17),
                          ),
                      SizedBox(
                              height: 5,
                            ),
                        Text(
                          '${data?.pressure} hpa',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily:'MavenPro',
                            fontSize:23),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'UV',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily:'MavenPro',
                            fontSize:17),
                          ),
                      SizedBox(
                              height: 5,
                            ),
                        Text(
                          '${data?.uv}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily:'MavenPro',
                            fontSize:23),
                          ),
                      SizedBox(
                        height:10,
                      ),
                        Text(
                          'Precipitation',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily:'MavenPro',
                            fontSize:17),
                          ),
                      SizedBox(
                              height: 5,
                            ),
                        Text(
                          '${data?.precipe} mm',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily:'MavenPro',
                            fontSize:23),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Wind',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily:'MavenPro',
                            fontSize:17),
                          ),
                      SizedBox(
                              height: 5,
                            ),
                        Text(
                          '${data?.wind} kp/h',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily:'MavenPro',
                            fontSize:23),
                          ),
                      SizedBox(
                        height:10,
                      ),
                        Text(
                          'Last Update',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily:'MavenPro',
                            fontSize:17),
                          ),
                      SizedBox(
                              height: 5,
                            ),
                        Text(
                          '${data?.last_update}',
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily:'MavenPro',
                            fontSize:15),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              ],
              ),
            );
        }),),
          );
        }
      }
