import 'package:flutter/material.dart';
import 'package:future_jobs/models/job_model.dart';
import 'package:future_jobs/theme.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;

  DetailPage(this.job);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 80,
        ),
        child: Column(
          children: <Widget>[
            isApplied
                ? Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      bottom: 30,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Color(0xFFECEDF1),
                    ),
                    child: Text(
                      'You have applied this job and the\nrecruiter will contact you',
                      textAlign: TextAlign.center,
                      style: greyTextStyle.copyWith(),
                    ),
                  )
                : Container(),
            Image.network(
              widget.job.companyLogo,
              width: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.job.name,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '${widget.job.companyName} • ${widget.job.location}',
              style: greyTextStyle,
            ),
          ],
        ),
      );
    }

    Widget detailItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.adjust,
              color: primaryColor,
              size: 12,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                text,
                style: blackTextStyle.copyWith(
                  fontWeight: light,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget aboutJob() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About the Job',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Column(
              children: widget.job.about
                  .map(
                    (text) => detailItem(text),
                  )
                  .toList(),
              // children: <Widget>[
              //   detailItem(
              //     'Full-Time On Site',
              //   ),
              //   detailItem(
              //     'Start at \$18.000 per month',
              //   ),
              // ],
            ),
          ],
        ),
      );
    }

    Widget qualifications() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Qualifications',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Column(
              children: widget.job.qualifications
                  .map(
                    (text) => detailItem(text),
                  )
                  .toList(),

              // children: <Widget>[
              //   detailItem(
              //     'Candidate must possess at least a Bachelor\'s Degree.',
              //   ),
              //   detailItem(
              //     'Able to use Microsoft Office and Google based service.',
              //   ),
              //   detailItem(
              //     'Have an excellent time management, good at organized and details',
              //   ),
              // ],
            ),
          ],
        ),
      );
    }

    Widget responsibilities() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Responsibilities',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Column(
              children: widget.job.responsibilities
                  .map(
                    (text) => detailItem(text),
                  )
                  .toList(),

              // children: <Widget>[
              //   detailItem(
              //     'Initiate and promote any programs, events, training, or activities.',
              //   ),
              //   detailItem(
              //     'Assessing and anticipating needs and collaborate with Division.',
              //   ),
              // ],
            ),
          ],
        ),
      );
    }

    Widget applyButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            height: 45,
            width: 200,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isApplied = true;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
              ),
              child: Text(
                'Apply for Job',
                style: whiteTextStyle.copyWith(fontWeight: medium),
              ),
            ),
          ),
        ],
      );
    }

    Widget cancelButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            height: 45,
            width: 200,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isApplied = false;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
              ),
              child: Text(
                'Cancel Apply',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget messageButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 35,
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Message Recruiter',
            style: greyTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: <Widget>[
            header(),
            aboutJob(),
            qualifications(),
            responsibilities(),
            isApplied ? cancelButton() : applyButton(),
            messageButton()
          ],
        ),
      ),
    );
  }
}
