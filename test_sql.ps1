$connString = "Data Source=MedMinderDB.mssql.somee.com;Initial Catalog=MedMinderDB;User ID=prodgramming_SQLLogin_1;Password=Prod@1234"
try {
    $conn = New-Object System.Data.SqlClient.SqlConnection($connString)
    $conn.Open()
    Write-Host "Success"
    $conn.Close()
} catch {
    Write-Host "Failed: $($_.Exception.Message)"
}
