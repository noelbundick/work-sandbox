$ErrorActionPreference = "Stop"

try {
  # Download Edge
  $edgeInstall = "C:\sandbox\MicrosoftEdgeEnterpriseX64.msi"
  if (-not (test-path $edgeInstall)) {
    curl.exe -L "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/53a5f508-44da-4f9d-85d9-312fb8f92f4b/MicrosoftEdgeEnterpriseX64.msi" -o $edgeInstall
  }

  # Install Edge
  & $edgeInstall /quiet /norestart

  # Open Work & School Accounts
  start ms-settings:workplace

} catch {
  $_ | out-file -FilePath C:\sandbox\err.log
}
