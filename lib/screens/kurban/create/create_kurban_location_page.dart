import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/utils/components/turkiyeAPI/district_dropdown_button_form_field.dart';
import 'package:kurbandas/core/utils/components/turkiyeAPI/province_dropdown_button_form_field.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/services/validator.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/turkiye_api_store.dart';
import 'package:provider/provider.dart';

import '../../../core/domain/entities/turkiye_api_province.dart';

class CreateKurbanLocationPage extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;

  const CreateKurbanLocationPage(
      {super.key, required this.onContinue, required this.onBack});

  @override
  State<CreateKurbanLocationPage> createState() =>
      _CreateKurbanLocationPageState();
}

class _CreateKurbanLocationPageState extends State<CreateKurbanLocationPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TurkiyeAPIStore turkiyeAPIStore;
  late KurbanStore kurbanStore;

  late S lang;

  TextEditingController cutAddressCnt = TextEditingController();

  TurkiyeAPIDistrict? selectedDistrict;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (kurbanStore.newKurban != null &&
          kurbanStore.newKurban!.address != null &&
          kurbanStore.newKurban!.address!.cutAddress != null) {
        cutAddressCnt.text = kurbanStore.newKurban!.address!.cutAddress!;
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    RootStore rootStore = Provider.of<RootStore>(context);
    turkiyeAPIStore = rootStore.turkiyeAPIStore;
    kurbanStore = rootStore.kurbanStore;

    lang = S.of(context);
  }

  @override
  void dispose() {
    cutAddressCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Observer(builder: (context) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang.LocationInfo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                lang.EnterInfoPlace,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Text(
                lang.province,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ProvinceDropdownButtonFormField(
                  value: kurbanStore.newKurban!.address?.province,
                  onChanged: (TurkiyeAPIProvince? province) {
                    turkiyeAPIStore.selectProvince(province!.id);

                    kurbanStore.selectNewKurbanProvince(province);

                    setState(() {
                      selectedDistrict = null;
                    });
                  }),
              const SizedBox(height: 16),
              Text(
                lang.district,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DistrictDropdownButtonFormField(
                value: selectedDistrict,
                onChanged: (district) {
                  kurbanStore.newKurban!.address!.district = district;

                  setState(() {
                    selectedDistrict = district;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                lang.cutAddress,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                  controller: cutAddressCnt,
                  decoration: InputDecoration(
                      hintText: lang.enterCutAddress,
                      prefixIcon: Icon(Icons.home)),
                  textCapitalization: TextCapitalization.words,
                  validator: (cutAddress) => Validator.checkCutAddress(
                      cutAddress, lang.pleaseCutAddress)),
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
                        onPressed: saveAndContinue,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16)),
                        child: Text(lang.continueTxt)),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  saveAndContinue() {
    if (formKey.currentState!.validate()) {
      kurbanStore.newKurban!.address!.cutAddress = cutAddressCnt.text;

      widget.onContinue();
    }
  }
}
