$ftpUrl = "ftp://win1005.site4now.net/"
$user = "prod1234-001"
$pass = "Prod@1234"

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
    Write-Host "Failed with Prod@1234. Trying Prince@1234..."
    $pass = "Prince@1234"
    try {
        $request = [System.Net.FtpWebRequest]::Create($ftpUrl)
        $request.Credentials = New-Object System.Net.NetworkCredential($user, $pass)
        $request.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectoryDetails
        
        $response = $request.GetResponse()
        $reader = New-Object System.IO.StreamReader($response.GetResponseStream())
        $directoryList = $reader.ReadToEnd()
        
        Write-Host "Directory Listing (Prince@1234):"
        Write-Host $directoryList
        
        $reader.Close()
        $response.Close()
    } catch {
        Write-Host "Both passwords failed. Error: $($_.Exception.Message)"
    }
}
