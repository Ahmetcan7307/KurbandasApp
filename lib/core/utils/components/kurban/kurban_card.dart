import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_background_image.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_status_linear_progress_indicator.dart';
import 'package:kurbandas/generated/l10n.dart';

import '../../../../routes.dart';

class KurbanCard extends StatefulWidget {
  final Kurban kurban;
  final VoidCallback onTap;

  const KurbanCard({super.key, required this.kurban, required this.onTap});

  @override
  State<KurbanCard> createState() => _KurbanCardState();
}

class _KurbanCardState extends State<KurbanCard> {
  late S lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          widget.onTap();

          Navigator.pushNamed(context, Routes.kurbanDetail);
        },
        borderRadius: BorderRadius.circular(12),
        child: Stack(children: [
          // Arkaplan fotoğrafı ve üzerine gölge ekliyoruz
          KurbanBackgroundImage(
              linearGradientColors: [
                Colors.black.withValues(alpha: .4),
                Colors.black.withValues(alpha: .6)
              ],
              photoUrl: widget.kurban.photoUrls![0],
              width: double.infinity,
              height: 200),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  buildStatus(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.kurban.animal.name!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: .2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1))
                        ]),
                    child: Text(
                      "${widget.kurban.price} ₺",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.scale,
                      size: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${widget.kurban.weight} Kg",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.people,
                      size: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${widget.kurban.totalPartnersCount! - widget.kurban.remainPartnersCount!}/${widget.kurban.totalPartnersCount} ${lang.partners}",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "${lang.cutAddress}: ${widget.kurban.address}",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                KurbanStatusLinearProgressIndicator(
                    totalPartnersCount: widget.kurban.totalPartnersCount!,
                    remainPartnersCount: widget.kurban.remainPartnersCount!,
                    minHeight: 8,
                    backgroundColor: Colors.white.withValues(alpha: .4),
                    valueColor: Colors.green.shade400),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.kurban.remainPartnersCount! > 0
                          ? lang.partnersRemain(
                              widget.kurban.remainPartnersCount!)
                          : lang.PartnershipsCompleted,
                      style: TextStyle(
                          fontSize: 13,
                          color: widget.kurban.remainPartnersCount! > 0
                              ? Colors.yellow
                              : Colors.white70,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildStatus() {
    late Color color;
    switch (widget.kurban.status!) {
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
      width: 10,
      height: 10,
      decoration:
          BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
        BoxShadow(
            color: color.withValues(alpha: .5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0))
      ]),
    );
  }
}
