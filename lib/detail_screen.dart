import 'package:flutter/material.dart';
import 'package:wisatabandung/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset(place.imageAsset),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(place.openDays)
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(place.openTime)
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.monetization_on),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(place.ticketPrice)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  place.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
