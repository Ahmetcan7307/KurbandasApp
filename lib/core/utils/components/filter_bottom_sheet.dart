import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';
import 'package:kurbandas/core/utils/components/turkiyeAPI/district_dropdown_button_form_field.dart';
import 'package:kurbandas/core/utils/components/turkiyeAPI/province_dropdown_button_form_field.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/turkiye_api_store.dart';
import 'package:provider/provider.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late TurkiyeAPIStore turkiyeAPIStore;
  late KurbanStore kurbanStore;

  late S lang;

  bool fetched = false;

  KurbanAnimal? selectedAnimal;

  TurkiyeAPIProvince? selectedProvince;
  TurkiyeAPIDistrict? selectedDistrict;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await kurbanStore.getAnimals();

      setState(() {
        fetched = true;
      });
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: !fetched
          ? Center(child: CircularProgressIndicator())
          : Observer(builder: (context) {
              return Wrap(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lang.FilterQurbani,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () => Navigator.pop(context, false),
                          icon: const Icon(Icons.close))
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    lang.QurbaniAnimal,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: kurbanStore.animals!
                      .map((KurbanAnimal animal) => buildFilterOption(
                          label: animal.name!,
                          isSelected: selectedAnimal == animal,
                          onSelect: () => setState(() {
                                selectedAnimal = animal;
                              })))
                      .toList(),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        lang.Location,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ProvinceDropdownButtonFormField(
                      value: selectedProvince,
                      onChanged: (TurkiyeAPIProvince? province) {
                        turkiyeAPIStore.selectProvince(province!.id);
                        setState(() {
                          selectedProvince = province;
                          selectedDistrict = null;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    if (selectedProvince != null)
                      DistrictDropdownButtonFormField(
                          value: selectedDistrict,
                          onChanged: (TurkiyeAPIDistrict? districtId) =>
                              setState(() {
                                selectedDistrict = districtId;
                              })),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(onPressed: clear, child: Text(lang.clear)),
                    const SizedBox(width: 16),
                    ElevatedButton(
                        onPressed: apply,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white),
                        child: Text(lang.apply))
                  ],
                )
              ]);
            }),
    );
  }

  Widget buildFilterOption(
          {required String label,
          required bool isSelected,
          required VoidCallback onSelect}) =>
      GestureDetector(
        onTap: () => setState(() {
          onSelect();
        }),
        child: Chip(
          label: Text(label),
          backgroundColor: isSelected ? Theme.of(context).primaryColor : null,
          labelStyle: TextStyle(color: isSelected ? Colors.white : null),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      );

  clear() {
    setState(() {
      selectedAnimal = null;
      selectedProvince = null;
      selectedDistrict = null;
    });
  }

  apply() {
    if (selectedAnimal != null ||
        selectedProvince != null ||
        selectedDistrict != null) {
      kurbanStore.createFilter(
          animal: selectedAnimal,
          selectedProvince: selectedProvince,
          selectedDistrict: selectedDistrict);
    }

    Navigator.pop(context, true);
  }
}
