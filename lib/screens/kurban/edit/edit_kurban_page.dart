// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kurbandas/core/domain/entities/address.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/services/validator.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/turkiye_api_store.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
  List<File> selectedImages = [];
  List<String> existingImages = [];
  final ImagePicker _picker = ImagePicker();

  TurkiyeAPIProvince? selectedProvince;
  TurkiyeAPIDistrict? selectedDistrict;
  List<TurkiyeAPIProvince>? provinces;
  List<TurkiyeAPIDistrict>? districts;

  late KurbanStore kurbanStore;
  late TurkiyeAPIStore turkiyeAPIStore;
  late S lang;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    turkiyeAPIStore =
        Provider.of<RootStore>(context, listen: false).turkiyeAPIStore;

    // İlleri yükle
    await turkiyeAPIStore.getProvince();
    provinces = turkiyeAPIStore.provinces;

    if (kurbanStore.selectedKurban != null) {
      final kurban = kurbanStore.selectedKurban!;

      weightCnt.text = kurban.weight!.toStringAsFixed(2);
      priceCnt.text = kurban.price!.toStringAsFixed(2);
      cutAddressCnt.text = kurban.address?.cutAddress ?? '';

      if (kurban.cutDate != null) {
        selectedCutDate = kurban.cutDate;
        cutDateCnt.text = DateFormat('dd.MM.yyyy').format(selectedCutDate!);
      }

      if (kurban.photoUrls != null && kurban.photoUrls!.isNotEmpty) {
        existingImages = kurban.photoUrls!;
      }

      // İl ve ilçe bilgilerini yükle
      if (kurban.address != null) {
        if (kurban.address!.province != null) {
          selectedProvince = kurban.address!.province;
          // İlçeleri yükle
          await _loadDistricts();

          if (kurban.address!.district != null) {
            selectedDistrict = kurban.address!.district;
          }
        }
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _loadDistricts() async {
    if (selectedProvince != null) {
      turkiyeAPIStore.selectProvince(selectedProvince!.id!);
      districts = turkiyeAPIStore.districts;
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lang = S.of(context);
    kurbanStore = Provider.of<RootStore>(context).kurbanStore;
  }

  @override
  void dispose() {
    weightCnt.dispose();
    priceCnt.dispose();
    cutDateCnt.dispose();
    cutAddressCnt.dispose();
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
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      "Kurban Bilgilerini Düzenle",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Kurban: ${kurbanStore.selectedKurban!.animal!.name}",
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
                        prefixIcon: Icon(Icons.currency_lira),
                      ),
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
                      lang.cutDate,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: cutDateCnt,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Kesim tarihi seçin",
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

                    // İl dropdown
                    DropdownButtonFormField<TurkiyeAPIProvince>(
                      value: selectedProvince,
                      decoration: InputDecoration(
                        labelText: lang.province,
                        prefixIcon: Icon(Icons.location_city),
                      ),
                      items: provinces?.map((province) {
                            return DropdownMenuItem<TurkiyeAPIProvince>(
                              value: province,
                              child: Text(province.name),
                            );
                          }).toList() ??
                          [],
                      onChanged: (province) async {
                        setState(() {
                          selectedProvince = province;
                          selectedDistrict = null;
                          districts = null;
                        });
                        await _loadDistricts();
                      },
                      validator: (province) => Validator.checkProvince(
                          province, lang.pleaseProvince),
                    ),

                    const SizedBox(height: 16),

                    // İlçe dropdown
                    DropdownButtonFormField<TurkiyeAPIDistrict>(
                      value: selectedDistrict,
                      decoration: InputDecoration(
                        labelText: lang.district,
                        prefixIcon: Icon(Icons.location_on),
                      ),
                      items: districts?.map((district) {
                            return DropdownMenuItem<TurkiyeAPIDistrict>(
                              value: district,
                              child: Text(district.name),
                            );
                          }).toList() ??
                          [],
                      onChanged: selectedProvince == null
                          ? null
                          : (district) {
                              setState(() {
                                selectedDistrict = district;
                              });
                            },
                      validator: (district) => Validator.checkDistrict(
                          district, lang.pleaseDistrict),
                    ),

                    const SizedBox(height: 16),

                    // Kesim adresi detayı
                    TextFormField(
                      controller: cutAddressCnt,
                      decoration: InputDecoration(
                        hintText: lang.enterCutAddress,
                        prefixIcon: Icon(Icons.home),
                      ),
                      maxLines: 3,
                      validator: (address) =>
                          Validator.checkString(address, lang.pleaseCutAddress),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Fotoğraflar",
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
                        child: Text(
                          "Değişiklikleri Kaydet",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildImagesSection() {
    final int totalImages = existingImages.length + selectedImages.length;
    final int remainingPhotos = 7 - totalImages;

    return Column(
      children: [
        if (existingImages.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mevcut Fotoğraflar",
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
                  itemCount: existingImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              // Eğer URL ise network image, değilse dosya olarak görüntüle
                              image: existingImages[index].startsWith('http')
                                  ? NetworkImage(existingImages[index])
                                  : FileImage(File(existingImages[index]))
                                      as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                existingImages.removeAt(index);
                              });
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
        if (selectedImages.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: existingImages.isNotEmpty ? 16 : 0),
              Text(
                "Yeni Fotoğraflar",
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
                  itemCount: selectedImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: FileImage(selectedImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImages.removeAt(index);
                              });
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
        SizedBox(height: 16),
        if (totalImages > 0)
          Text(
            "Kalan fotoğraf sayısı: $remainingPhotos",
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
                  ? () => _getImages(ImageSource.camera)
                  : null,
              icon: Icon(Icons.camera_alt),
              label: Text("Kamera"),
            ),
            SizedBox(width: 16),
            OutlinedButton.icon(
              onPressed: remainingPhotos > 0
                  ? () => _getImages(ImageSource.gallery)
                  : null,
              icon: Icon(Icons.photo_library),
              label: Text("Galeri"),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _getImages(ImageSource source) async {
    final int totalImages = existingImages.length + selectedImages.length;
    if (totalImages >= 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Maksimum 7 fotoğraf ekleyebilirsiniz'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (source == ImageSource.camera) {
      final XFile? photo = await _picker.pickImage(source: source);
      if (photo != null) {
        setState(() {
          selectedImages.add(File(photo.path));
        });
      }
    } else {
      final List<XFile>? photos = await _picker.pickMultiImage();
      if (photos != null && photos.isNotEmpty) {
        // Toplam fotoğraf sayısı 7'yi geçmeyecek şekilde ekleyelim
        final int remainingSlots = 7 - totalImages;
        final int photosToAdd =
            photos.length > remainingSlots ? remainingSlots : photos.length;

        if (photosToAdd < photos.length) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Maksimum 7 fotoğraf ekleyebilirsiniz. İlk $photosToAdd fotoğraf eklendi.'),
              backgroundColor: Colors.orange,
            ),
          );
        }

        setState(() {
          selectedImages
              .addAll(photos.sublist(0, photosToAdd).map((e) => File(e.path)));
        });
      }
    }
  }

  Future<void> _saveChanges() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        final updatedKurban = kurbanStore.selectedKurban!;
        updatedKurban.weight = double.parse(weightCnt.text);
        updatedKurban.price = double.parse(priceCnt.text);
        updatedKurban.cutDate = selectedCutDate;

        // Adres bilgilerini güncelle
        if (updatedKurban.address == null) {
          updatedKurban.address = Address();
        }

        updatedKurban.address!.province = selectedProvince;
        updatedKurban.address!.district = selectedDistrict;
        updatedKurban.address!.cutAddress = cutAddressCnt.text;

        // Adres string oluştur (il/ilçe detay)
        if (selectedProvince != null && selectedDistrict != null) {
          updatedKurban.addressStr =
              "${selectedProvince!.name} / ${selectedDistrict!.name} ${cutAddressCnt.text}";
        } else {
          updatedKurban.addressStr = cutAddressCnt.text;
        }

        // Fotoğrafları birleştir (mevcut ve yeni)
        List<String> allPhotos = List.from(existingImages);
        // Yeni eklenen fotoğrafları da listeye ekle
        if (selectedImages.isNotEmpty) {
          allPhotos.addAll(selectedImages.map((file) => file.path));
        }
        updatedKurban.photoUrls = allPhotos;

        // Kurban güncelleme işlemi yapılacak - burada servise istek göndermek gerekiyor
        await kurbanStore.updateKurban(updatedKurban);

        showSnackBar(context,
            text: "Kurban bilgileri başarıyla güncellendi",
            color: Colors.green);

        Navigator.pop(context);
      } catch (e) {
        showSnackBar(context, text: "Hata: $e", color: Colors.red);
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
