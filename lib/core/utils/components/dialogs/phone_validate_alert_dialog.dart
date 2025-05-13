// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kurbandas/core/domain/entities/country_code.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/services/validator.dart';
import 'package:kurbandas/stores/country_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

class PhoneNumberDialog extends StatefulWidget {
  const PhoneNumberDialog({
    super.key,
  });

  @override
  State<PhoneNumberDialog> createState() => _PhoneNumberDialogState();
}

class _PhoneNumberDialogState extends State<PhoneNumberDialog> {
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false, isLoadingCountryCodes = true;

  late S lang;

  late CountryStore countryStore;
  late AuthStore authStore;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await countryStore.get();

      setState(() {
        isLoadingCountryCodes = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    RootStore rootStore = Provider.of<RootStore>(context);
    countryStore = rootStore.countryStore;
    authStore = rootStore.authStore;
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      child: isLoadingCountryCodes
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_android,
                        color: Colors.green,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          lang.PhoneNoRequired,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    lang.PhoneNoRequiredDesc,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<CountryCode>(
                            value: countryStore.selectedCountry,
                            decoration: InputDecoration(
                                labelText: lang.country,
                                prefixIcon: const Icon(
                                  Icons.flag,
                                  color: Colors.green,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade50,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 2)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16)),
                            items: countryStore.countryCodes!
                                .map((countryCode) =>
                                    DropdownMenuItem<CountryCode>(
                                        value: countryCode,
                                        child: Row(
                                          children: [
                                            Text(countryCode.country),
                                            const SizedBox(width: 8),
                                            Text(
                                              countryCode.code,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )))
                                .toList(),
                            onChanged: (CountryCode? countryCode) {
                              countryStore.selectCountry(countryCode!);

                              setState(() {});
                            }),
                        const SizedBox(height: 16),
                        TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: lang.phoneNo,
                              hintText: countryStore.selectedCountry.example,
                              prefixIcon:
                                  const Icon(Icons.phone, color: Colors.green),
                              prefixText: countryStore.selectedCountry.code,
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 2),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(11),
                            ],
                            validator: (value) => Validator.checkPhoneNo(
                                value,
                                lang.PhoneNoRequired,
                                lang.InvalidPhoneNoFormat,
                                countryStore.selectedCountry.pattern)),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "${lang.PleasePhoneNo}:${countryStore.selectedCountry.country.split(" ")[0]}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          lang.cancel,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: _isLoading ? null : updatePhoneNo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        child: _isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                lang.addPhoneNo,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Future updatePhoneNo() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await authStore.updatePhoneNo(
            "${countryStore.selectedCountry.code.substring(1)}${countryStore.formatPhoneNumber(phoneController.text, countryStore.selectedCountry.code)}");

        if (mounted) {
          setState(() {
            _isLoading = false;
          });

          Navigator.of(context).pop(true);
        }
      } catch (e) {
        showSnackBar(context, text: "${lang.error}: $e");
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
