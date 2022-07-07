import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.photo,
    required this.name,
    required this.job,
    required this.rate,
    required this.reviews,
    required this.radioBut,
    required this.view,
  }) : super(key: key);

  final Widget photo;
  final String name;
  final String job;
  final String rate;
  final String reviews;
  final Radio<int> radioBut;
  final RichText view;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: photo,
          flex: 2,
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
        Expanded(
          child: Column(
            children: [
              radioBut,
              view,
            ],
          ),
        )
      ]),
    );
  }
}

class _MentorDesc extends StatelessWidget {
  const _MentorDesc({
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Text(
            job,
            style: const TextStyle(fontSize: 13.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    rate,
                    style: const TextStyle(fontSize: 13.0),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    reviews,
                    style: const TextStyle(fontSize: 13.0),
                  ),
                  Icon(
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
