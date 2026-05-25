$server = "SQL1002.site4now.net"
$db = "db_ac9653_prod1234"
$user = "db_ac9653_prod1234_admin"
$pass = "Prod@12345"

Write-Host "Testing connection..."
try {
    $conn = New-Object System.Data.SqlClient.SqlConnection
    $conn.ConnectionString = "Server=$server;Database=$db;User Id=$user;Password=$pass;Connection Timeout=10;"
    $conn.Open()
    Write-Host "SUCCESS - Connected!"

    # Create Users table
    $cmd = $conn.CreateCommand()
    $cmd.CommandText = @"
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL
)
"@
    $cmd.ExecuteNonQuery()
    Write-Host "Users table created/verified."

    # Create Medicines table
    $cmd2 = $conn.CreateCommand()
    $cmd2.CommandText = @"
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Medicines')
CREATE TABLE Medicines (
    MedicineId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    MedicineName NVARCHAR(100) NOT NULL,
    Dosage NVARCHAR(50) NOT NULL,
    Schedule NVARCHAR(100) NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
)
"@
    $cmd2.ExecuteNonQuery()
    Write-Host "Medicines table created/verified."

    $conn.Close()
    Write-Host "ALL DONE!"
} catch {
    Write-Host "FAILED: $($_.Exception.Message)"
    if ($_.Exception.InnerException) {
        Write-Host "Inner: $($_.Exception.InnerException.Message)"
    }
}
