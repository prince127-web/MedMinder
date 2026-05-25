$server = "SQL1002.site4now.net"
$db = "db_ac9653_prod1234"
$user = "db_ac9653_prod1234_admin"
$pass = "Prod@12345"

try {
    $conn = New-Object System.Data.SqlClient.SqlConnection
    $conn.ConnectionString = "Server=$server;Database=$db;User Id=$user;Password=$pass;Connection Timeout=10;"
    $conn.Open()
    Write-Host "Connected!"

    # Drop and recreate Medicines table with correct schema
    $cmd = $conn.CreateCommand()
    $cmd.CommandText = @"
DROP TABLE IF EXISTS Medicines;
CREATE TABLE Medicines (
    MedicineId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    MedicineName NVARCHAR(100) NOT NULL,
    Dosage NVARCHAR(50) NOT NULL,
    ReminderTime TIME NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
"@
    $cmd.ExecuteNonQuery()
    Write-Host "Medicines table recreated with correct schema!"

    # Verify columns
    $cmd2 = $conn.CreateCommand()
    $cmd2.CommandText = "SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Medicines'"
    $reader = $cmd2.ExecuteReader()
    Write-Host "`nMedicines table columns:"
    while ($reader.Read()) {
        Write-Host "  $($reader['COLUMN_NAME']) - $($reader['DATA_TYPE'])"
    }
    $reader.Close()

    $conn.Close()
    Write-Host "`nDONE!"
} catch {
    Write-Host "FAILED: $($_.Exception.Message)"
    if ($_.Exception.InnerException) {
        Write-Host "Inner: $($_.Exception.InnerException.Message)"
    }
}
