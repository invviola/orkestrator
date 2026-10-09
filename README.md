# 🎼 Orkestratör

**Claude Code için ekip yöneten bir skill.** Ana model orkestra şefi olur: işi parçalara böler, parçaları ucuz ve hızlı modellere dağıtır, dönen işi kontrol edip onaylar. Öncelik her zaman kalitedir.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 🎼  O R K E S T R A T Ö R   v1
     Opus yönetir · Sonnet tasarlar · Haiku koşturur

     by invviola  ·  github.com/invviola/orkestrator
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Kim ne yapar?

| Kim | Görevi |
|---|---|
| **Opus** (ana model) | Kalite kurallarını koyar, yazılanı inceler ve onaylar. Zor kod, hata ayıklama, güvenlik, git |
| **Sonnet** (`kod-yazici`, `test-yazici`) | Arayüz ve görsel tasarım, mevcut kalıba uyan normal kod, testler |
| **Haiku** (`Explore`, `dosya-okuyucu`, `mekanik-isci`) | Uzun okumalar, düz ve uzun yazmalar, lint/test çalıştırma |

Ana model **Fable** ise o genel yönetici olur, kod kalitesine Opus (`kod-inceleyici`) bakar.

## Kurulum

```bash
git clone https://github.com/invviola/orkestrator.git && ./orkestrator/install.sh
```

Kurulum, skill'i `~/.claude/skills/orkestrator/` altına, alt agent'ları `~/.claude/agents/` altına kopyalar. Aynı adla bir agent dosyan zaten varsa ona dokunmaz (üzerine yazmak için `--force`).

## Kullanım

1. Kurduktan sonra Claude Code'u yeniden başlat.
2. `/orkestrator` yaz, yanına ne istediğini ekle:
   ```
   /orkestrator giriş sayfasına karanlık mod ekle
   ```
3. Gerisini şef halleder: işi böler, ekibe dağıtır, dönen işi kontrol eder, sana kısa rapor verir.

**Hangi model şef olur?**
- Ana model **Opus** ise → Opus yönetir ve kodu kendisi denetler.
- Ana model **Fable** ise → Fable yönetir, Opus denetler. Aynı anda 6 modele kadar çalışır.

Ana modeli Claude Code'daki model seçiminden değiştirebilirsin. Skill yalnız sen `/orkestrator` yazınca çalışır, kendiliğinden devreye girmez.

## İçindekiler

```
skills/orkestrator/SKILL.md   → orkestra şefinin kuralları
agents/kod-yazici.md          → Sonnet: kod yazar
agents/test-yazici.md         → Sonnet: test yazar
agents/kod-inceleyici.md      → Opus: kod inceler (Fable modunda)
agents/dosya-okuyucu.md       → Haiku: okur, özetler
agents/mekanik-isci.md        → Haiku: lint, format, tekrarlı işler
agents/Explore.md             → Haiku: kodda hızlı arama (Claude Code'un hazır Explore'unun yerine geçer)
```

---

Yapan: [**invviola**](https://github.com/invviola) · Beğendiysen ⭐ bırakmayı unutma.
