$languages = @(
  "ar-SA",
  "bg-BG",
  "ca-ES",
  "cs-CZ",
  "da-DK",
  "de-DE",
  "el-GR",
  "en-GB",
  "en-US",
  "es-ES",
  "es-MX",
  "et-EE",
  "eu-ES",
  "fi-FI",
  "fr-CA",
  "fr-FR",
  "gl-ES",
  "he-IL",
  "hr-HR",
  "hu-HU",
  "id-ID",
  "it-IT",
  "ja-JP",
  "ko-KR",
  "lt-LT",
  "lv-LV",
  "nb-NO",
  "nl-NL",
  "pl-PL",
  "pt-BR",
  "pt-PT",
  "ro-RO",
  "ru-RU",
  "sk-SK",
  "sl-SI",
  "sr-Latn-RS",
  "sv-SE",
  "th-TH",
  "tr-TR",
  "uk-UA",
  "vi-VN",
  "zh-CN",
  "zh-TW"
)

$jobs = foreach ($lang in $languages) {
    Write-Host "Installing Language $lang"
    Install-Language -Language $lang -ExcludeFeatures
}

Write-Host "Installed Languages:"
Get-InstalledLanguage | ForEach-Object { $_.LanguageId }
