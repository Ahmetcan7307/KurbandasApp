import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/services/validator.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

class CreateKurbanBasicInfoPage extends StatefulWidget {
  final VoidCallback onContinue;

  const CreateKurbanBasicInfoPage({super.key, required this.onContinue});

  @override
  State<CreateKurbanBasicInfoPage> createState() =>
      _CreateKurbanBasicInfoPageState();
}

class _CreateKurbanBasicInfoPageState extends State<CreateKurbanBasicInfoPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController weightCnt = TextEditingController(),
      priceCnt = TextEditingController(),
      totalPartnersCountCnt = TextEditingController();

  late KurbanStore kurbanStore;

  late S lang;

  bool fetched = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (kurbanStore.newKurban != null) {
        if (kurbanStore.newKurban!.weight != null) {
          weightCnt.text = kurbanStore.newKurban!.weight!.toStringAsFixed(2);
        }
        if (kurbanStore.newKurban!.price != null) {
          priceCnt.text = kurbanStore.newKurban!.price!.toStringAsFixed(2);
        }
        if (kurbanStore.newKurban!.totalPartnersCount != null) {
          totalPartnersCountCnt.text =
              kurbanStore.newKurban!.totalPartnersCount!.toString();
        }
      }

      await kurbanStore.getAnimals();

      setState(() {
        fetched = true;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    kurbanStore = Provider.of<RootStore>(context).kurbanStore;

    lang = S.of(context);
  }

  @override
  void dispose() {
    weightCnt.dispose();
    priceCnt.dispose();
    totalPartnersCountCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: !fetched
          ? Center(child: CircularProgressIndicator())
          : Observer(builder: (context) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lang.QurbaniInfo,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      lang.QurbaniAnimal,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<KurbanAnimal>(
                      value: kurbanStore.newKurban?.animal,
                      decoration: InputDecoration(
                          hintText: lang.selectAnimal,
                          prefixIcon: Icon(Icons.pets)),
                      items: kurbanStore.animals!
                          .map((animal) => DropdownMenuItem<KurbanAnimal>(
                              value: animal, child: Text(animal.name!)))
                          .toList(),
                      onChanged: (animal) {
                        kurbanStore.selectNewKurbanAnimal(animal!);
                      },
                      validator: (animal) => Validator.checkKurbanAnimal(
                          animal, lang.pleaseSelectAnimal),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "${lang.weight} (kg)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: weightCnt,
                      decoration: InputDecoration(
                          hintText: lang.enterWeight,
                          prefixIcon: Icon(Icons.scale)),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                      ],
                      validator: (weight) => Validator.checkDouble(
                          weight, lang.pleaseWeight, lang.validWeight),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "${lang.price} (₺)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: priceCnt,
                      decoration: InputDecoration(
                          hintText: lang.enterPrice,
                          prefixIcon: Icon(Icons.currency_lira)),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"^\d+\.?\d{0,2}"))
                      ],
                      validator: (price) => Validator.checkDouble(
                          price, lang.pleasePrice, lang.validPrice),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      lang.totalPartnersCountMax,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: totalPartnersCountCnt,
                      decoration: InputDecoration(
                          hintText: lang.enterTotalPartnersCount,
                          prefixIcon: Icon(Icons.people)),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (totalPartnersCount) =>
                          Validator.checkKurbanTotalPartnersCount(
                              totalPartnersCount,
                              lang.pleaseTotalPartnersCount,
                              lang.validTotalPartnersCount,
                              lang.MaximumPartners7),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: saveAndContinue,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16)),
                          child: Text(
                            lang.continueTxt,
                            style: TextStyle(fontSize: 16),
                          )),
                    )
                  ],
                ),
              );
            }),
    );
  }

  saveAndContinue() {
    if (formKey.currentState!.validate()) {
      kurbanStore.newKurban!.weight = double.parse(weightCnt.text);
      kurbanStore.newKurban!.price = double.parse(priceCnt.text);
      kurbanStore.newKurban!.totalPartnersCount =
          int.parse(totalPartnersCountCnt.text);

      widget.onContinue();
    }
  }
}
