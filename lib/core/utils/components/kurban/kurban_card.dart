import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/generated/l10n.dart';

class KurbanCard extends StatelessWidget {
  final Kurban kurban;

  KurbanCard({super.key, required this.kurban});

  late S lang;

  @override
  Widget build(BuildContext context) {
    lang = S.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                buildStatus(),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    kurban.animal.toString().split(".").last,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${kurban.price} ₺",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ]),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.scale,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${kurban.weight} Kg",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.people,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${kurban.totalPartnersCount - kurban.remainPartnersCount}/${kurban.totalPartnersCount} ${lang.partners}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value:
                    (kurban.totalPartnersCount - kurban.remainPartnersCount) /
                        kurban.totalPartnersCount,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              )
            ],
          ),
        ),
        onTap: () {
          // TODO: Kurban detay sayfasına yönlendir
        },
      ),
    );
  }

  Widget buildStatus() {
    late Color color;
    switch (kurban.status!) {
      case KurbanStatus.waiting:
        color = Colors.orange;
        break;
      case KurbanStatus.cut:
        color = Colors.blue;
        break;
      case KurbanStatus.shared:
        color = Colors.green;
        break;
    }

    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
