#Resolve-DnsName -Name gmail.com
#Resolve-DnsName -Name gmail.com -Type MX

```
$dnsServer = @('park2.livedns.co.il')
Resolve-DnsName livejob.co.il -Server $dnsServer
```
```
$dnsServer = @('park1.livedns.co.il')
Resolve-DnsName livejob.co.il -Server $dnsServer
```
```
$dnsServer = @('ns1.livedns.co.il')
Resolve-DnsName livedns.co.il -Server $dnsServer
```
```
$dnsServer = @('ns2.livedns.co.il')
Resolve-DnsName livedns.co.il -Server $dnsServer
```
```
$dnsServer = @('ns3.livedns.co.il')
Resolve-DnsName livedns.co.il -Server $dnsServer
```
