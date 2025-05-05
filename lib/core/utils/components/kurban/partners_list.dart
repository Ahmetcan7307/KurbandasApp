import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/partner.dart';
import 'package:kurbandas/core/utils/extensions/date_time_extensions.dart';
import 'package:kurbandas/generated/l10n.dart';

class PartnersList extends StatefulWidget {
  final List<Partner> partners;

  const PartnersList({super.key, required this.partners});

  @override
  State<PartnersList> createState() => _PartnersListState();
}

class _PartnersListState extends State<PartnersList> {
  late S lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.partners.length, buildPartnerCard),
    );
  }

  Widget buildPartnerCard(int index) => Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200, width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.partners[index].fullName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${lang.partner}: ${index + 1}",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${lang.partnershipDate}: ${widget.partners[index].createdAt.formatDate()}",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
