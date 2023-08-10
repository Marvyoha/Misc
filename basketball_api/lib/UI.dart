// ignore_for_file: file_names

import 'package:basketball_api/models.dart';
import 'package:basketball_api/services.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  List<TeamsData> allTeams = [];
  Future<void> fetchData() async {
    final response =
        await Services().getData('https://www.balldontlie.io/api/v1/teams');
    final data = response.data['data'];
    setState(() {
      allTeams = List<TeamsData>.from(
          data.map((userJson) => TeamsData.fromJson(userJson)));
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LiquidPullToRefresh(
              onRefresh: () => fetchData(),
              borderWidth: 5,
              backgroundColor: Colors.grey[800],
              height: 160,
              color: Colors.grey[600],
              child: ListView.builder(
                itemCount: allTeams.length,
                itemBuilder: (BuildContext context, int index) {
                  var items = allTeams[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[800]!,
                              offset: Offset(-3, -3),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.grey[900]!,
                              offset: const Offset(3, 3),
                              blurRadius: 15,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(items.name,
                                style: const TextStyle(color: Colors.black)),
                            Text(items.fullName,
                                style: const TextStyle(color: Colors.black)),
                            Text(items.abb,
                                style: const TextStyle(color: Colors.black)),
                            Text(
                                '${items.city}, ${items.conference} ${items.division}',
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else {
            return const Center(
              child: Text('There is an error with your connection.'),
            );
          }
        },
      ),
    );
  }
}
