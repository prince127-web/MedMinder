$ftpUrl = "ftp://win1005.site4now.net/"
$user = "prod1234-001"
$pass = "Prod12345!"

try {
    $request = [System.Net.FtpWebRequest]::Create($ftpUrl)
    $request.Credentials = New-Object System.Net.NetworkCredential($user, $pass)
    $request.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectoryDetails
    
    $response = $request.GetResponse()
    $reader = New-Object System.IO.StreamReader($response.GetResponseStream())
    $directoryList = $reader.ReadToEnd()
    
    Write-Host "Directory Listing:"
    Write-Host $directoryList
    
    $reader.Close()
    $response.Close()
} catch {
    Write-Host "Failed. Error: $($_.Exception.Message)"
}
