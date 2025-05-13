// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/core/utils/components/turkiyeAPI/district_dropdown_button_form_field.dart';
import 'package:kurbandas/core/utils/components/turkiyeAPI/province_dropdown_button_form_field.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/services/validator.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/turkiye_api_store.dart';
import 'package:provider/provider.dart';

class EditKurbanPage extends StatefulWidget {
  const EditKurbanPage({super.key});

  @override
  State<EditKurbanPage> createState() => _EditKurbanPageState();
}

class _EditKurbanPageState extends State<EditKurbanPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController weightCnt = TextEditingController(),
      priceCnt = TextEditingController(),
      cutDateCnt = TextEditingController(),
      cutAddressCnt = TextEditingController();

  DateTime? selectedCutDate;

  late KurbanStore kurbanStore;
  late TurkiyeAPIStore turkiyeAPIStore;

  late S lang;

  bool isLoading = true, isSaving = false;

  TurkiyeAPIDistrict? selectedDistrict;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    await turkiyeAPIStore.getProvince();

    weightCnt.text = kurbanStore.selectedKurban!.weight!.toStringAsFixed(2);
    priceCnt.text = kurbanStore.selectedKurban!.price!.toStringAsFixed(2);
    cutAddressCnt.text = kurbanStore.selectedKurban!.address!.cutAddress!;

    if (kurbanStore.selectedKurban!.cutDate != null) {
      selectedCutDate = kurbanStore.selectedKurban!.cutDate;
      cutDateCnt.text = DateFormat('dd.MM.yyyy').format(selectedCutDate!);
    }

    turkiyeAPIStore.selectProvince(
        kurbanStore.selectedKurban!.address!.province!.turkiyeAPIId);

    selectedDistrict = kurbanStore.selectedKurban!.address!.district;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    RootStore rootStore = Provider.of<RootStore>(context);
    kurbanStore = rootStore.kurbanStore;
    turkiyeAPIStore = rootStore.turkiyeAPIStore;
  }

  @override
  void dispose() {
    weightCnt.dispose();
    priceCnt.dispose();
    cutDateCnt.dispose();
    cutAddressCnt.dispose();

    kurbanStore.selectedPhotos.clear();
    kurbanStore.selectedKurban = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.edit),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Observer(builder: (context) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        lang.editQurbaniInfo,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        kurbanStore.selectedKurban!.animal!.name!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
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
                          prefixIcon: Icon(Icons.scale),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
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
                          prefixIcon: Icon(Icons.currency_lira),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"^\d+\.?\d{0,2}"))
                        ],
                        validator: (price) => Validator.checkDouble(
                            price, lang.pleasePrice, lang.validPrice),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        lang.cutDate,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: cutDateCnt,
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
                      const SizedBox(height: 16),
                      Text(
                        lang.cutAddress,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ProvinceDropdownButtonFormField(
                          value: kurbanStore.selectedKurban!.address!.province,
                          onChanged: (TurkiyeAPIProvince? province) {
                            turkiyeAPIStore
                                .selectProvince(province!.turkiyeAPIId);

                            kurbanStore.selectSelectedKurbanProvince(province);

                            setState(() {
                              selectedDistrict = null;
                            });
                          }),
                      const SizedBox(height: 16),
                      DistrictDropdownButtonFormField(
                          value: selectedDistrict,
                          onChanged: (district) {
                            kurbanStore.selectedKurban!.address!.district =
                                district;

                            setState(() {
                              selectedDistrict = district;
                            });
                          }),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: cutAddressCnt,
                        decoration: InputDecoration(
                          hintText: lang.enterCutAddress,
                          prefixIcon: Icon(Icons.home),
                        ),
                        maxLines: 3,
                        validator: (address) =>
                            Validator.checkStringNullAndIsEmpty(
                                address, lang.pleaseCutAddress),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        lang.photos,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      _buildImagesSection(),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _saveChanges,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: isSaving
                              ? CircularProgressIndicator()
                              : Text(
                                  lang.SaveChanges,
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
    );
  }

  Widget _buildImagesSection() {
    int remainingPhotos = 7 -
        (kurbanStore.selectedKurban!.photoUrls!.length +
            kurbanStore.selectedPhotos.length);

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lang.ExistingPhotos,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kurbanStore.selectedKurban!.photoUrls!.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(
                                kurbanStore.selectedKurban!.photoUrls![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            kurbanStore.removePhotoUrl(index);

                            setState(() {});
                          },
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
          ],
        ),
        if (kurbanStore.selectedPhotos.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: kurbanStore.selectedKurban!.photoUrls!.isNotEmpty
                      ? 16
                      : 0),
              Text(
                lang.newPhotos,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
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
            ],
          ),
        SizedBox(height: 16),
        if (kurbanStore.totalPhotosCount > 0)
          Text(
            "${lang.remainingPhotoCount}: $remainingPhotos",
            style: TextStyle(
              color: remainingPhotos > 0 ? Colors.grey[600] : Colors.red,
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

  Future<void> _saveChanges() async {
    if (formKey.currentState!.validate() &&
        (kurbanStore.selectedKurban!.photoUrls!.length +
                kurbanStore.selectedPhotos.length) >
            0) {
      setState(() {
        isSaving = true;
      });

      try {
        kurbanStore.selectedKurban!.weight = double.parse(weightCnt.text);
        kurbanStore.selectedKurban!.price = double.parse(priceCnt.text);
        kurbanStore.selectedKurban!.cutDate = selectedCutDate;

        kurbanStore.selectedKurban!.address!.cutAddress = cutAddressCnt.text;

        await kurbanStore.updateKurban();

        showSnackBar(context,
            text: lang.QurbaniInfoSuccessfullyUpdated, color: Colors.green);

        Navigator.pop(context, true);
      } catch (e) {
        showSnackBar(context, text: "${lang.error}: $e", color: Colors.red);
      }

      setState(() {
        isSaving = false;
      });
    } else {
      showSnackBar(context, text: lang.pleasePhoto, color: Colors.orange);
    }
  }
}
