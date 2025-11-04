import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/services/validator.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/turkiye_api_store.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/turkiye_api_province.dart';

class ProvinceDropdownButtonFormField extends StatefulWidget {
  final TurkiyeAPIProvince? value;
  final void Function(TurkiyeAPIProvince?)? onChanged;

  const ProvinceDropdownButtonFormField(
      {super.key, this.value, this.onChanged});

  @override
  State<ProvinceDropdownButtonFormField> createState() =>
      _ProvinceDropdownButtonFormFieldState();
}

class _ProvinceDropdownButtonFormFieldState
    extends State<ProvinceDropdownButtonFormField> {
  late S lang;

  late TurkiyeAPIStore turkiyeAPIStore;

  bool fetched = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await turkiyeAPIStore.getProvince();

      if (mounted) {
        setState(() {
          fetched = true;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    turkiyeAPIStore = Provider.of<RootStore>(context).turkiyeAPIStore;
  }

  @override
  Widget build(BuildContext context) {
    return !fetched
        ? Center(child: CircularProgressIndicator())
        : DropdownButtonFormField<TurkiyeAPIProvince>(
            initialValue: widget.value,
            decoration: InputDecoration(
                labelText: lang.SelectProvince,
                prefixIcon: Icon(Icons.location_city)),
            items: turkiyeAPIStore.provinces!
                .map((TurkiyeAPIProvince province) =>
                    DropdownMenuItem<TurkiyeAPIProvince>(
                        value: province, child: Text(province.name)))
                .toList(),
            onChanged: widget.onChanged,
            validator: (province) =>
                Validator.checkProvince(province, lang.pleaseProvince),
          );
  }
}
