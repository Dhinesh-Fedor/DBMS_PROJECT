import 'package:dbms_project/constants/colors.dart';
import 'package:dbms_project/constants/constwords.dart';
import 'package:dbms_project/constants/sizes.dart';
import 'package:dbms_project/messagebox/apploaders.dart';
import 'package:dbms_project/models/bookticketmodel.dart';
import 'package:dbms_project/mongodb/mongodatabase.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class BookTickets extends StatefulWidget {
  const BookTickets({super.key});

  @override
  State<BookTickets> createState() => _BookTicketsState();
}

class _BookTicketsState extends State<BookTickets> {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();
  final from = TextEditingController();
  final destination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.nav1,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //firstname textfield
                      Expanded(
                        child: TextFormField(
                          controller: firstname,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: Constants.firstname,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: Sizes.spaceBtwInputFields,
                      ),

                      //lastname textfield
                      Expanded(
                        child: TextFormField(
                          controller: lastname,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: Constants.lastname,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: Sizes.spaceBtwInputFields,
                  ),

                  Row(
                    children: [
                      //age textfield
                      Expanded(
                        child: TextFormField(
                          controller: age,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: Constants.age,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: Sizes.spaceBtwInputFields,
                      ),

                      //gender textfield
                      Expanded(
                        child: TextFormField(
                          controller: gender,
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: Constants.gender,
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: Sizes.spaceBtwInputFields,
                  ),

                  //from loaction
                  TextFormField(
                    controller: from,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: Constants.from,
                      prefixIcon: Icon(Iconsax.location),
                    ),
                  ),

                  const SizedBox(
                    height: Sizes.spaceBtwInputFields,
                  ),

                  //destination
                  TextFormField(
                    controller: destination,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: Constants.destination,
                      prefixIcon: Icon(Iconsax.location_add),
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: Sizes.spaceBtwInputFields + 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _insertDetails(firstname.text, lastname.text, age.text,
                        gender.text, from.text, destination.text);
                  },
                  child: const Text(Constants.book),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _insertDetails(
    String firstname,
    String lastname,
    String age,
    String gender,
    String from,
    String destination,
  ) async {
    var id = mongo.ObjectId();
    final insertdetails = BookTicketsModel(
        id: id,
        firstname: firstname,
        lastname: lastname,
        age: age,
        gender: gender,
        from: from,
        destination: destination);
    var result = await MongoDatabase.insert(insertdetails);
    if (result == '1') {
      AppLoaders.successSnackBar(
          title: 'Success!', message: Constants.confirmationmsg);
    } else {
      AppLoaders.errorSnackBar(title: 'Failed!', message: Constants.errormsg);
    }
    _clearAll();
  }

  void _clearAll() {
    firstname.text = "";
    lastname.text = "";
    age.text = "";
    gender.text = "";
    from.text = "";
    destination.text = "";
  }
}
