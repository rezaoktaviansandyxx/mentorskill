import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.photo,
    required this.name,
    required this.job,
    required this.rate,
    required this.reviews,
  }) : super(key: key);

  final Widget photo;
  final String name;
  final String job;
  final String rate;
  final String reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: photo,
          flex: 1,
        ),
        Expanded(
          child: _MentorDesc(
            name: name,
            job: job,
            rate: rate,
            reviews: reviews,
          ),
          flex: 3,
        ),
      ]),
    );
  }
}

// ignore: must_be_immutable
class _MentorDesc extends StatelessWidget {
  _MentorDesc({
    Key? key,
    required this.name,
    required this.job,
    required this.rate,
    required this.reviews,
  }) : super(key: key);

  final String name;
  final String job;
  final String rate;
  final String reviews;

  //style
  TextStyle style2 = const TextStyle(fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Text(
            job,
            style: GoogleFonts.poppins(textStyle: style2),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    rate,
                    style: GoogleFonts.poppins(textStyle: style2),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    reviews,
                    style: GoogleFonts.poppins(textStyle: style2),
                  ),
                  const Icon(
                    Icons.comment,
                    color: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
