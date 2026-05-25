$connString = "Server=SQL1002.site4now.net;Database=db_ac9653_prod1234;User Id=db_ac9653_prod1234_admin;Password=Prod@1234;"
$query = @"
CREATE TABLE Users ( UserId INT IDENTITY(1,1) PRIMARY KEY, FullName NVARCHAR(100), Email NVARCHAR(100) UNIQUE, Password NVARCHAR(100) );
CREATE TABLE Medicines ( Id INT IDENTITY(1,1) PRIMARY KEY, UserId INT FOREIGN KEY REFERENCES Users(UserId), MedicineName NVARCHAR(100), Dosage NVARCHAR(50), ReminderTime NVARCHAR(50), StartDate NVARCHAR(50), EndDate NVARCHAR(50) );
"@
try {
    $conn = New-Object System.Data.SqlClient.SqlConnection($connString)
    $conn.Open()
    $cmd = $conn.CreateCommand()
    $cmd.CommandText = $query
    $cmd.ExecuteNonQuery()
    Write-Host "Tables created successfully."
    $conn.Close()
} catch {
    Write-Host "Failed: $($_.Exception.Message)"
}
