# योजनाएँ - कार्यशील मेमोरी

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <strong>हिन्दी</strong> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


यह फ़ोल्डर **योजना कार्यान्वयन** सेबेलम कोडिंग डिमुलै। तुजुअन्न्या:
- कैटेट *बगैमाना* सेबुआ फिटुर/रिफैक्टर अकान डिकरजाकन, सेबेलम टैंगान मासुक
- बिसा दिरुजुक सात इम्प्लीमेंटसी (अताउ सात दी-रिव्यू सेटेलहन्या)
- ट्रेल केपुटुसन: केनापा पेंडेकटन ए डिपिलिह, बुकन बी

## कपन पकाई फोल्डर इनि?

✅ **हां, सिम्पन दी सिनी:**
- कार्यान्वयन योजना गैर-तुच्छ (>1 दिन)
- रिफैक्टर प्लान डेगन बान्याक फ़ाइल टेरडैम्पक
- प्रवासन योजना (डेटाबेस, फ्रेमवर्क संस्करण, डीएसबी)
- आउटपुट `Plan` मोड / `architecture-reviewer`

❌ **बुकन दी सिनी:**
- तुच्छ कार्य के लिए योजना बनाएं (<1 जाम) - टोडोराइट का उपयोग करें
- एक्सपेरिमेन / स्पाइक - यह अच्छा है `experiments/`
- रिसेट एक्सप्लोरासी → `docs/research/`
- केपुटुसन अपरिवर्तनीय यांग हासिल दारी योजना → `.claude/wiki/decisions/`

## नामकरण सम्मलेन

__CODE_ब्लॉक_0__

उदाहरण: `PLAN-20260507-migrasi-laravel-12.md`

## वर्कफ़्लो

__CODE_ब्लॉक_1__

## स्थिति प्रवाह

| स्थिति | आरती |
|---|---|
| `draft` | योजना मसीह दिरांकांग, बेलम दिसेतुजुई |
| `active` | योजना दिसेटुजुई और सेदांग डाइकसेकुसी |
| `finalized` | कार्यान्वयन सेलेसाई, योजना = रिकॉर्ड |
| `superseded` | दिगंती योजना बारू (सेट `superseded_by`) |
| `archived` | प्रासंगिक, महत्वपूर्ण `_archive/` |

## फ्रंटमैटर वाजिब

देखें [docs/templates/plan.md](../templates/plan.md). फ़ील्ड पेंटिंग:
- `status` - फ़िल्टर खोलें
- `related` — लिंक के लिए रिसेट/एडीआर/प्लान लेन
- `promoted_to` — लिंक के एडीआर कलौ हासिल योजना डिप्रोमोट

## कारा कैरी योजना

__CODE_ब्लॉक_2__

## अनुक्रमणिका

[INDEX.md](INDEX.md) बेरिसी टेबल सेमुआ योजना।