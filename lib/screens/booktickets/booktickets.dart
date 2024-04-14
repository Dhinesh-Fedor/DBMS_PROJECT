import 'package:dbms_project/constants/colors.dart';
import 'package:dbms_project/constants/constwords.dart';
import 'package:dbms_project/constants/sizes.dart';
import 'package:dbms_project/messagebox/apploaders.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BookTickets extends StatefulWidget {
  const BookTickets({super.key});

  @override
  State<BookTickets> createState() => _BookTicketsState();
}

class _BookTicketsState extends State<BookTickets> {
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
                    AppLoaders.successSnackBar(
                        title: 'Success!!', message: Constants.confirmationmsg);
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
}
