import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

class CreateKurbanPreviewPage extends StatefulWidget {
  final VoidCallback onSubmit;
  final VoidCallback onBack;

  const CreateKurbanPreviewPage(
      {super.key, required this.onSubmit, required this.onBack});

  @override
  State<CreateKurbanPreviewPage> createState() =>
      _CreateKurbanPreviewPageState();
}

class _CreateKurbanPreviewPageState extends State<CreateKurbanPreviewPage> {
  late S lang;

  late KurbanStore kurbanStore;

  bool isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    kurbanStore = Provider.of<RootStore>(context).kurbanStore;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang.confirmQurbaniInfo,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          buildCard(
              title: lang.QurbaniInfo,
              icon: Icons.pets,
              content: Column(
                children: [
                  buildInfoRow(
                      lang.QurbaniAnimal, kurbanStore.newKurban!.animal!.name!),
                  buildInfoRow(
                      lang.weight, "${kurbanStore.newKurban!.weight} kg"),
                  buildInfoRow(lang.price, "${kurbanStore.newKurban!.price} ₺"),
                  buildInfoRow(lang.totalPartnersCount,
                      kurbanStore.newKurban!.totalPartnersCount.toString())
                ],
              )),
          const SizedBox(height: 16),
          buildCard(
              title: lang.LocationInfo,
              icon: Icons.location_on,
              content: Column(
                children: [
                  buildInfoRow(lang.province,
                      kurbanStore.newKurban!.address!.province!.name),
                  buildInfoRow(lang.district,
                      kurbanStore.newKurban!.address!.district!.name),
                  buildInfoRow(lang.cutAddress,
                      kurbanStore.newKurban!.address!.cutAddress!)
                ],
              )),
          const SizedBox(height: 16),
          if (kurbanStore.newKurban!.cutDate != null)
            buildCard(
                title: lang.cutDate,
                icon: Icons.calendar_today,
                content: Column(
                  children: [
                    buildInfoRow(
                        lang.cutDate,
                        DateFormat('dd.MM.yyyy')
                            .format(kurbanStore.newKurban!.cutDate!))
                  ],
                )),
          if (kurbanStore.newKurban!.cutDate != null)
            const SizedBox(height: 16),
          buildCard(
              title: lang.photos,
              icon: Icons.photo_library,
              content: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: kurbanStore.selectedPhotos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(kurbanStore.selectedPhotos[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              )),
          const SizedBox(height: 16),
          buildNoticeCard(
              title: lang.ImportantInfo, content: lang.ImportantInfoDesc),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: widget.onBack,
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: Text(lang.previous)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                    onPressed: isLoading ? null : widget.onSubmit,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text(lang.shareQurbani)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildCard(
          {required String title,
          required IconData icon,
          required Widget content}) =>
      Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              content
            ],
          ),
        ),
      );

  Widget buildInfoRow(String label, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      );

  Widget buildNoticeCard({required String title, required String content}) =>
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.amber.withValues(alpha: .2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Colors.amber,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(content)
          ],
        ),
      );

  submit() {
    setState(() {
      isLoading = true;
    });

    widget.onSubmit();

    setState(() {
      isLoading = false;
    });
  }
}
