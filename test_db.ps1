$server = "SQL1002.site4now.net"
$db = "db_ac9653_prod1234"
$user = "db_ac9653_prod1234_admin"

$passwords = @("Prod@1234", "Prince@1234", "Prod12345!")

foreach ($pass in $passwords) {
    Write-Host "Testing password: $pass"
    try {
        $conn = New-Object System.Data.SqlClient.SqlConnection
        $conn.ConnectionString = "Server=$server;Database=$db;User Id=$user;Password=$pass;Connection Timeout=10;"
        $conn.Open()
        Write-Host "  SUCCESS! Connected with: $pass"
        $conn.Close()
        break
    } catch {
        Write-Host "  FAILED: $($_.Exception.InnerException.Message)"
    }
}
