import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/services/validator.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/turkiye_api_store.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/turkiye_api_district.dart';

class DistrictDropdownButtonFormField extends StatefulWidget {
  final TurkiyeAPIDistrict? value;
  final void Function(TurkiyeAPIDistrict?)? onChanged;

  const DistrictDropdownButtonFormField(
      {super.key, this.value, this.onChanged});

  @override
  State<DistrictDropdownButtonFormField> createState() =>
      _DistrictDropdownButtonFormFieldState();
}

class _DistrictDropdownButtonFormFieldState
    extends State<DistrictDropdownButtonFormField> {
  late S lang;

  late TurkiyeAPIStore turkiyeAPIStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    turkiyeAPIStore = Provider.of<RootStore>(context).turkiyeAPIStore;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TurkiyeAPIDistrict>(
      initialValue: widget.value,
      decoration: InputDecoration(
          labelText: lang.SelectDistrict, prefixIcon: Icon(Icons.location_on)),
      items: turkiyeAPIStore.districts
          ?.map((TurkiyeAPIDistrict district) =>
              DropdownMenuItem<TurkiyeAPIDistrict>(
                  value: district, child: Text(district.name)))
          .toList(),
      onChanged: widget.onChanged,
      validator: (district) =>
          Validator.checkDistrict(district, lang.pleaseDistrict),
    );
  }
}
