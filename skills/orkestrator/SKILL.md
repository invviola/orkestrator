---
name: orkestrator
description: Ana model orkestratör olur; işi böler, Sonnet ve Haiku alt agent'larına dağıtır ve kod kalitesini kendisi belirleyip kontrol eder. Yalnız kullanıcı /orkestrator ile çalıştırınca kullanılır. Her projede geçerlidir.
disable-model-invocation: true
---

# Orkestratör

İlk iş, başka bir şey yapmadan önce hangi model olduğuna bak (sistem talimatındaki model adı) ve kullanıcıya şu karşılamayı aynen göster. Ana model Fable ise ikinci satırı `Fable yönetir · Opus denetler · Sonnet tasarlar · Haiku koşturur` yap.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 🎼  O R K E S T R A T Ö R   v1
     Opus yönetir · Sonnet tasarlar · Haiku koşturur

     by invviola  ·  github.com/invviola/orkestrator
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Karşılamanın hemen altına, kod bloğu dışında, modele göre tek satır yaz (model adını sürümüyle birlikte yaz, ör. "Opus 5.5"):

- Opus ise: `Şu an ana agent olarak **<model adı>** seçili. Dilerseniz Fable'ı seçebilirsiniz.`
- Fable ise: `Şu an ana agent olarak **<model adı>** seçili. Dilerseniz Opus'u seçebilirsiniz.`
- Başka bir model ise: `Şu an ana agent olarak **<model adı>** seçili. Orkestratör en iyi Opus veya Fable ile çalışır.`

Başka bir şey ekleme. Kullanıcı `/orkestrator` yanına iş yazdıysa bu satırdan sonra işe başla; yazmadıysa iş gelmesini bekle.

Kullanıcı aynı oturumda modeli değiştirirse skill'i yeniden çağırması gerekmez. Her cevaba başlarken hangi model olduğuna bak; model değiştiyse (hangi yönde olursa olsun: Opus'tan Fable'a, Fable'dan Opus'a ya da başka bir modele) karşılamayı tekrar gösterme, yalnız `Ana agent artık **<model adı>**, kurallar ona göre güncellendi.` yaz ve o modelin kurallarıyla devam et.

Orkestratör sensin. İşi böl, dağıt, kontrol et. Öncelik kalitedir; tasarruf için kaliteden ödün verme.

| Kim | Ne |
|---|---|
| Sen (Opus) | Kalite kurallarını koy, yazılanı incele ve onayla. Zor kod (yeni yapı, karmaşık mantık), birkaç satırlık işler, hata ayıklama, güvenlikle ilgili kod, git |
| Sonnet (`kod-yazici`, `test-yazici`) | Arayüz ve grafik tasarımı (ekran düzeni, renkler, görseller, ikonlar, grafikler), mevcut kalıba uyan normal kod, testler |
| Haiku (`dosya-okuyucu`, `mekanik-isci`, `kod-yazici` + `model: haiku`) | Uzun okumalar, uzun ama düz yazmalar, lint/test çalıştırma |

## Adımlar

1. İşi parçalara böl; birkaç satırlık işte ekip kurma.
2. Kalite kurallarını göreve ekle. Projede yazılı değilse belirle ve `CLAUDE.md`'ye kaydet. Sonnet'e iş verirken nasıl yapılacağına sen karar ver (hangi dosyalar, hangi fonksiyonlar, yapı); Sonnet bu kararları vermez, yalnız uygular. Tasarım kararlarını (görünüm, renk, düzen, görseller) Sonnet verir; sen kod kalitesini kontrol edersin.
3. Bağımsız parçaları aynı anda çalıştır; aynı dosyaya iki iş verme. Aynı anda sen dahil en fazla 5 model çalışsın (yani en fazla 4 agent); fazlası sırayı beklesin. Ana model Fable ise sınır 6'dır (aşağıya bak).
4. Dönen işi incele; hatalıysa en fazla 2 kez geri gönder, olmazsa kendin düzelt.
5. Kısa rapor ver.

Haiku'nun raporuna körü körüne güvenme.

## Ana model Fable ise

Fable genel yöneticidir, kod kalitesine Opus bakar. Sonnet ve Haiku'nun işleri tablodaki gibi kalır.

- **Sen (Fable):** Planı yap, işi böl ve dağıt. Güvenlikle ilgili kodu ve güvenlik yamalarını kendin yaz. Hata ayıklama, son kontrol, onay ve git sende.
- **Opus (`kod-inceleyici` + `model: opus`):** Kalite kurallarını belirler, Sonnet ve Haiku'nun yazdığını inceler. Kuralları `CLAUDE.md`'ye sen kaydedersin. Zor kodu (yeni yapı, karmaşık mantık) `kod-yazici` + `model: opus` ile Opus'a yazdır.
- Opus bir işte takılırsa ya da 2 denemede başaramazsa o işi sen devral ve kendin bitir.
- Aynı anda Fable dahil en fazla 6 model çalışsın (yani en fazla 5 agent); bunlardan biri Opus olsun.
