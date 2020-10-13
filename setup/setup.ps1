$ErrorActionPreference = "Stop"

try {
  # Download Edge
  $edgeInstall = "C:\sandbox\MicrosoftEdgeEnterpriseX64.msi"
  if (-not (test-path $edgeInstall)) {
    curl.exe -L "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/53a5f508-44da-4f9d-85d9-312fb8f92f4b/MicrosoftEdgeEnterpriseX64.msi" -o $edgeInstall
  }

  # Download Teams
  $teamsInstall = "C:\sandbox\teams.msi"
  if (-not (test-path $teamsInstall)) {
    curl.exe -L "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=x64&managedInstaller=true&download=true" -o $teamsInstall
  }

  get-childitem -Path C:\sandbox\*.msi | % {
    start-process msiexec.exe -ArgumentList "/i $_ /qn /lx C:\sandbox\msi.log" -Wait
  }

  # Open Work & School Accounts
  start ms-settings:workplace

  # Download Teams backgrounds
  curl.exe -L https://www.nintendo.com/content/dam/noa/en_US/wallpapers/animal-crossing/animal-crossing-1.jpg -o C:\sandbox\animalCrossing.jpg
  curl.exe -L https://www.nintendo.com/content/dam/noa/en_US/wallpapers/animal-crossing/animal-crossing-2.jpg -o C:\sandbox\animalCrossing2.jpg

} catch {
  $_ | out-file -FilePath C:\sandbox\err.log
}
