# 🐄 Kurbandaş – Kurban Paylaşım ve Organizasyon Platformu

**Kurbandaş**, Kurban Bayramı’na özel olarak geliştirilen, kullanıcıların kurban paylaşımı
yapmasını, paydaşlarla iletişime geçmesini ve tüm süreci dijital ortamda yönetmesini sağlayan mobil
öncelikli bir platformdur.

## 📲 Özellikler

- 🔐 Google ve Apple kimlik doğrulama ile güvenli giriş
- 📸 Kurban ilanı oluşturma, fotoğraf yükleme ve detaylı bilgi ekleme
- 🤝 Kurban paylaşımı: Yeni Kurban oluştur veya mevcut bir Kurban'a katıl
- 📍 İl/İlçe bazlı konum filtreleme ile yerel eşleşme
- 📞 Giriş sonrası telefon paylaşımı ile güvenli iletişim
- ☁️ Supabase entegrasyonu: Auth, Storage, Realtime DB, Edge Functions
- ⚙️ **Supabase Edge Function**: Kurban kaldırıldığında görseller Storage'dan kullanıcıyı
  bekletmeden arka planda otomatik olarak silinir
- 🛠️ CI/CD süreci: GitHub Actions kullanılarak DigitalOcean Droplet üzerine otomatik deployment
- 🌐 Çok dilli destekli Flutter arayüz
- 🧭 Yardım ve destek bölümü, kullanıcı dostu arayüz

## 🛠️ Teknolojiler

- **Flutter** – Mobil arayüz
- **C# .NET 8 Web API** – REST mimarisiyle backend
- **Supabase** – Auth, Storage, Database, Edge Functions
- **PostgreSQL** – Veritabanı
- **DigitalOcean Droplet** – Hosting
- **GitHub Actions** – CI/CD

## 🎯 Amacımız

Kurban ibadetini dijital bir deneyime dönüştürerek kullanıcılar için süreci daha **erişilebilir,
şeffaf ve pratik** hale getirmek.

---

## 🖼️ Uygulama Ekran Görüntüleri

### 🔐 Giriş Sayfası

![Login Page](ss/Login_Page.png)

### 🏠 Ana Sayfa

![Home Page](ss/Home_Page.png)

### ➕ Kurban Oluşturma Süreci

**Temel Bilgiler**  
![Create Kurban - Basic Info](ss/Create_Kurban_Page-Basic_Info.png)

**Konum Bilgisi**  
![Create Kurban - Location](ss/Create_Kurban_Page-Location.png)

**Önizleme**  
![Create Kurban - Preview](ss/Create_Kurban_Page-Preview.png)

### ✏️ Kurban Düzenleme

![Edit Kurban Page](ss/Edit_Kurban_Page.png)

### 🔍 Filtreleme Seçenekleri

![Filter Bottom Sheet](ss/Filter_Bottom_Sheet.png)

### 📄 Kurban Detayı

**Genel Bilgiler**  
![Kurban Detail](ss/Kurban_Detail_Page.png)

**Ortaklar**  
![Kurban Partners](ss/Kurban_Detail_Page-Partners.png)

### 📬 Paylaşım İstekleri

**Onaylananlar**  
![Kurban Requests - Approved](ss/Kurban_Requests_Page-Approved.png)

**Bekleyenler**  
![Kurban Requests - Waiting](ss/Kurban_Requests_Page-Waiting.png)

### 👥 Ortaklıklarım

![My Partnerships](ss/My_Partnerships_Page.png)

### 👤 Profil Sayfası

![Profile Page](ss/Profile_Page.png)

### ℹ️ Hakkında

![About Page](ss/About_Page.png)

### 🆘 Yardım Sayfası

![Help Page](ss/Help_Page.png)

---

## 📦 Kurulum

```bash
git clone https://github.com/Ahmetcan7307/KurbandasApp.git
cd KurbandasApp
flutter pub get
flutter run
```

## 🤝 Katkıda Bulun

Pull request’ler her zaman açıktır. Yeni özellik önerileri veya hata bildirimleri için issue
oluşturabilirsiniz.

## 📄 Lisans

Bu proje MIT Lisansı ile lisanslanmıştır.

Görüşlerinizi ve katkılarınızı bekliyoruz!