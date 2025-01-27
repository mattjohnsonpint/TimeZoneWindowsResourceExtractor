# Define the list of language codes to install
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

# Start installing each language as a job
$jobs = foreach ($lang in $languages) {
    Install-Language -Language $lang -ExcludeFeatures -AsJob
}

# Wait for all jobs to complete
Write-Host "Waiting for language installations to complete..."
Wait-Job -Job $jobs

# Check job results
Write-Host "All language installations completed. Checking results..."
foreach ($job in $jobs) {
    if ($job.State -eq 'Completed') {
        $output = Receive-Job -Job $job
        Write-Host "Installation of $($job.ChildJobs[0].Command) succeeded. Output: $output"
    } else {
        Write-Host "Installation of $($job.ChildJobs[0].Command) failed. Job details:"
        $job | Format-List -Property *
        Write-Host "Error output (if any):"
        Receive-Job -Job $job | Format-List
    }
}

# Cleanup jobs
Remove-Job -Job $jobs -Force
