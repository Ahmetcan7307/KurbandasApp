import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_card.dart';

class KurbanList extends StatelessWidget {
  const KurbanList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: KurbanCard(
                kurban: Kurban(
                    animal: KurbanAnimal(name: "Sheep"),
                    weight: 50,
                    price: 1000,
                    address: "İstanbul / Beylikdüzü",
                    totalPartnersCount: 7,
                    status: KurbanStatus.waiting,
                    photoUrls: [
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Lleyn_sheep.jpg/800px-Lleyn_sheep.jpg"
                    ])
                  ..documentId = index.toString(),
              ),
            ));
  }
}
