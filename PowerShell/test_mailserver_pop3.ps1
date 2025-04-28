# PowerShell script to check POP3 mail server connection

# --- Configuration ---
$Server = "pop.yourmailserver.com"  # Replace with your POP3 server
$Port = 110                         # Usually 110 for non-SSL, 995 for SSL
$Username = "your_email@example.com"
$Password = "your_password"
$UseSSL = $false                    # Change to $true if using SSL

# --- Connect to server ---
try {
    if ($UseSSL) {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $tcpClient.Connect($Server, $Port)
        $sslStream = New-Object System.Net.Security.SslStream($tcpClient.GetStream(), $false, ({ $true }))
        $sslStream.AuthenticateAsClient($Server)
        $stream = $sslStream
    } else {
        $tcpClient = New-Object System.Net.Sockets.TcpClient($Server, $Port)
        $stream = $tcpClient.GetStream()
    }
    
    # --- Helper function to send and receive ---
    function Send-POP3Command {
        param ($stream, $command)
        $writer = New-Object System.IO.StreamWriter($stream)
        $writer.NewLine = "`r`n"
        $writer.AutoFlush = $true
        $writer.WriteLine($command)
    }

    function Read-POP3Response {
        param ($stream)
        $reader = New-Object System.IO.StreamReader($stream)
        $response = $reader.ReadLine()
        return $response
    }

    # --- Start POP3 Commands ---
    $response = Read-POP3Response -stream $stream
    Write-Host "Server response: $response"

    Send-POP3Command -stream $stream -command "USER $Username"
    $response = Read-POP3Response -stream $stream
    Write-Host "USER response: $response"

    Send-POP3Command -stream $stream -command "PASS $Password"
    $response = Read-POP3Response -stream $stream
    Write-Host "PASS response: $response"

    # --- List messages ---
    Send-POP3Command -stream $stream -command "LIST"
    $response = Read-POP3Response -stream $stream
    Write-Host "LIST response: $response"

    # --- Quit ---
    Send-POP3Command -stream $stream -command "QUIT"
    $response = Read-POP3Response -stream $stream
    Write-Host "QUIT response: $response"

    $tcpClient.Close()
}
catch {
    Write-Error "Error connecting to POP3 server: $_"
}
