import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sollet/core/logic/boutique_repository.dart';
import 'package:sollet/core/logic/newsletter_repository.dart';
import 'package:sollet/models/boutique.dart';
import 'package:sollet/models/boutique_model.dart';
import 'package:sollet/models/newsletter.dart';
import 'package:sollet/models/newsletter_model.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  late Future<List<Newsletter>> _future;
  late Future<List<Boutique>> _futureBoutiques;

  @override
  void initState() {
    _future = NewsletterRepository().newsletters;
    _futureBoutiques = BoutiqueRepository().boutiques;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: FutureBuilder(
        future: _futureBoutiques,
        builder: (context, snapshot) {
          List<Boutique> boutiques = snapshot.data!;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemBuilder: (context, index) {
                boutiques[index].isSelected = Provider.of<BoutiqueProvider>(
                    context)
                    .selectedBoutiques
                    .any((it) => boutiques[index].shortName == it.shortName);

                return ListTile(
                  title: Text(
                    boutiques[index].topic,
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(boutiques[index].desc),
                      Text(
                        boutiques[index].hashtags.join(" "),
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<BoutiqueProvider>(
                        builder: (context, value, child) {
                          return IconButton(
                            icon: boutiques[index].isSelected == true
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border),
                            onPressed: () {
                              value.addBoutique(boutiques[index]);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: boutiques.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 8),
  //     child: FutureBuilder(
  //       future: _future,
  //       builder: (context, snapshot) {
  //         List<Newsletter> newsletters = snapshot.data!;
  //         //List<Boutique> boutiques = snapshot.data!;
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return ListView.separated(
  //             itemBuilder: (context, index) {
  //               newsletters[index].isSelected = Provider.of<NewsletterProvider>(
  //                   context)
  //                   .selectedNewsletters
  //                   .any((it) => newsletters[index].shortName == it.shortName);
  //
  //               return ListTile(
  //                 title: Text(
  //                   newsletters[index].topic,
  //                   style: const TextStyle(fontSize: 18),
  //                 ),
  //                 subtitle: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(newsletters[index].desc),
  //                     Text(
  //                       newsletters[index].hashtags.join(" "),
  //                       style: const TextStyle(
  //                         color: Colors.blue,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 trailing: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Consumer<NewsletterProvider>(
  //                       builder: (context, value, child) {
  //                         return IconButton(
  //                           icon: newsletters[index].isSelected == true
  //                               ? const Icon(Icons.check)
  //                               : const Icon(Icons.add),
  //                           onPressed: () {
  //                             value.addNewsletter(newsletters[index]);
  //                           },
  //                         );
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               );
  //             },
  //             separatorBuilder: (context, index) => const Divider(),
  //             itemCount: newsletters.length,
  //           );
  //         } else {
  //           return Container();
  //         }
  //       },
  //     ),
  //   );
  // }
}
