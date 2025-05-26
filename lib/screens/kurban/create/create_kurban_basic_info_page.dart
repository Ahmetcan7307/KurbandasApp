// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/services/validator.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/components/my_snackbar.dart';

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
      totalPartnersCountCnt = TextEditingController(),
      cutDateCnt = TextEditingController();

  DateTime? selectedCutDate;

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
        if (kurbanStore.newKurban!.cutDate != null) {
          selectedCutDate = kurbanStore.newKurban!.cutDate;
          cutDateCnt.text = DateFormat('dd.MM.yyyy').format(selectedCutDate!);
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
    cutDateCnt.dispose();
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
                            RegExp(r"^\d+\.?\d{0,2}"))
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
                    const SizedBox(height: 16),
                    Text(
                      lang.cutDate,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: cutDateCnt,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: lang.selectCutDate,
                        prefixIcon: Icon(Icons.calendar_today),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              selectedCutDate = null;
                              cutDateCnt.clear();
                            });
                          },
                        ),
                      ),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedCutDate ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null && picked != selectedCutDate) {
                          setState(() {
                            selectedCutDate = picked;
                            cutDateCnt.text =
                                DateFormat('dd.MM.yyyy').format(picked);
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    Text(
                      lang.photos,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    imagePickerWidget(),
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

  Widget imagePickerWidget() {
    final int remainingPhotos = 7 - kurbanStore.selectedPhotos.length;

    return Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: kurbanStore.selectedPhotos.isEmpty
              ? Center(
                  child: Text(
                    lang.UseButtonsAddPhotos,
                    style: TextStyle(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: kurbanStore.selectedPhotos.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image:
                                  FileImage(kurbanStore.selectedPhotos[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => kurbanStore.removePhoto(index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
        if (kurbanStore.selectedPhotos.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "${lang.remainingPhotoCount}: $remainingPhotos",
              style: TextStyle(
                  color: remainingPhotos > 0 ? Colors.grey[600] : Colors.red),
            ),
          ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: remainingPhotos > 0
                  ? () =>
                      kurbanStore.getImages(context, lang, ImageSource.camera)
                  : null,
              icon: Icon(Icons.camera_alt),
              label: Text(lang.camera),
            ),
            SizedBox(width: 16),
            OutlinedButton.icon(
              onPressed: remainingPhotos > 0
                  ? () =>
                      kurbanStore.getImages(context, lang, ImageSource.gallery)
                  : null,
              icon: Icon(Icons.photo_library),
              label: Text(lang.gallery),
            ),
          ],
        ),
      ],
    );
  }

  saveAndContinue() {
    if (formKey.currentState!.validate() &&
        kurbanStore.selectedPhotos.isNotEmpty) {
      kurbanStore.newKurban!.weight = double.parse(weightCnt.text);
      kurbanStore.newKurban!.price = double.parse(priceCnt.text);
      kurbanStore.newKurban!.totalPartnersCount =
          int.parse(totalPartnersCountCnt.text);
      kurbanStore.newKurban!.cutDate = selectedCutDate;

      widget.onContinue();
    } else {
      showSnackBar(context,
          text: lang.pleasePhoto, color: Colors.orange, seconds: 3);
    }
  }
}
