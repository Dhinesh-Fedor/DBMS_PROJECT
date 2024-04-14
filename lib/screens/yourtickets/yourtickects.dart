import 'package:dbms_project/constants/colors.dart';
import 'package:dbms_project/constants/constwords.dart';
import 'package:dbms_project/messagebox/apploaders.dart';
import 'package:dbms_project/models/bookticketmodel.dart';
import 'package:dbms_project/mongodb/mongodatabase.dart';
import 'package:flutter/material.dart';

class YourTickets extends StatefulWidget {
  const YourTickets({super.key});

  @override
  State<YourTickets> createState() => _YourTicketsState();
}

class _YourTicketsState extends State<YourTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.nav2,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: MongoDatabase.retrieve(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return displayData(
                          BookTicketsModel.fromJson(snapshot.data[index]));
                    });
              } else {
                return Center(
                  child: Text(
                    "Book Your Tickets Now!.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget displayData(BookTicketsModel data) {
    return Card(
      elevation: 4, // Card elevation (shadow)
      margin: const EdgeInsets.all(10), // Card margin
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'Ticket Details',
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          const SizedBox(height: 8),

          // Name row
          Row(
            children: [
              Text(
                'Name:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 8),
              Text(
                "${data.firstname} ${data.lastname}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 8), // Spacer

          // Age row
          Row(children: [
            Text(
              'Age:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 8),
            Text(
              data.age,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ]),

          const SizedBox(height: 8), // Spacer

          // Gender row
          Row(
            children: [
              Text(
                'Gender:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 8),
              Text(
                data.gender,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),

          const SizedBox(height: 8), // Spacer

          // From row
          Row(
            children: [
              Text(
                'From:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 8),
              Text(
                data.from,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),

          const SizedBox(height: 8), // Spacer

          // Destination row
          Row(
            children: [
              Text(
                'Destination:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 8),
              Text(
                data.destination,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                MongoDatabase.delete(data);
                AppLoaders.successSnackBar(
                    title: 'Success!', message: Constants.cancelmsg);

                    setState(() {
                    });
              },
              child: const Text(Constants.cancel),
            ),
          ),
        ]),
      ),
    );
  }
}
