import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HeadlineScreen extends StatefulWidget {
  const HeadlineScreen({Key? key}) : super(key: key);

  @override
  State<HeadlineScreen> createState() => _HeadlineScreenState();
}

class _HeadlineScreenState extends State<HeadlineScreen> {
  late String dataresponse;
   Map? mapresponse;
  late List listdata;

  Future ApiCall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category="
            "business&apiKey=1a06bf3c0fef40faadc976ec5750f36c"));
    dataresponse = response.body;
    mapresponse = jsonDecode(response.body);
  }

  @override
  void initState() {
    ApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "HEADLINES",
            style: GoogleFonts.robotoSlab(
                textStyle:
                    TextStyle(fontSize: 29, fontWeight: FontWeight.bold)),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black38,
          child: ListView.builder(itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 16, left: 16, bottom: 24, top: 15),
              padding: EdgeInsets.only(bottom: 12, left: 12, right: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(mapresponse!['articles'][index]
                            ['urlToImage']
                        .toString()),
                    opacity: 0.7),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(3.0, 4.0), //(x,y)
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    mapresponse!['articles'][index]['title'].toString(),
                    style: GoogleFonts.robotoSlab(
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text(
                        mapresponse!['articles'][index]['source']['name']
                            .toString(),
                        style: GoogleFonts.robotoSlab(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        mapresponse!['articles'][index]['publishedAt']
                            .toString(),
                        style: GoogleFonts.robotoSlab(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
