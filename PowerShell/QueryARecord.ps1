do {
    $Domain = Read-Host "Enter the domain name (e.g., example.com)"

    function Get-AuthoritativeNS {
        param ($Domain)
        try {
            $nsRecords = Resolve-DnsName -Name $Domain -Type NS
            return $nsRecords | Where-Object { $_.QueryType -eq "NS" } | Select-Object -ExpandProperty NameHost
        } catch {
            Write-Error "Failed to get NS records for $Domain"
        }
    }

    function Resolve-AFromNS {
        param (
            [string]$Domain,
            [string]$NS
        )

        try {
            $nsIP = (Resolve-DnsName -Name $NS -Type A | Select-Object -First 1).IPAddress
            if ($nsIP) {
                $result = Resolve-DnsName -Name $Domain -Server $nsIP -Type A -DnsOnly -NoHostsFile
                return $result | Where-Object { $_.QueryType -eq "A" }
            }
        } catch {
            Write-Warning "Failed to resolve from $NS ($nsIP)"
        }
    }

    $nsList = Get-AuthoritativeNS -Domain $Domain

    if ($nsList) {
        foreach ($ns in $nsList) {
            Write-Host "`nQuerying NS: $ns" -ForegroundColor Cyan
            $aRecords = Resolve-AFromNS -Domain $Domain -NS $ns
            if ($aRecords) {
                $aRecords | Format-Table Name, IPAddress, TTL -AutoSize
            } else {
                Write-Warning "No A record returned from $ns"
            }
        }
    } else {
        Write-Warning "No NS records found."
    }

    $again = Read-Host "`nTest another domain? (Y/N)"
} while ($again -match '^(Y|y)$')

Write-Host "`nExiting. Goodbye!"
Start-Sleep -Seconds 2
