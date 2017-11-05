---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: http://gavineke.com/CloudflarePS/New-CFDnsRecord
schema: 2.0.0
---

# New-CFDnsRecord

## SYNOPSIS
Create a new DNS record for a zone. See the record object definitions for required attributes for each record type.

## SYNTAX

```
New-CFDnsRecord [-Type] <String> [-Name] <String> [-Content] <String> [[-TTL] <Int32>] [[-Proxied] <String>]
```

## DESCRIPTION
Creates a new DNS record.

## EXAMPLES

### Example 1
```
PS C:\> New-CFDnsRecord -Type A -Name @ -Content 123.123.123.123 -TTL 120 -Proxied true
```

Creates a DNS record for the domain with a TTL of 120 seconds and which will proxied by Cloudflare

### Example 2
```
PS C:\> New-CFDnsRecord -Type CNAME -Name msoid -Content clientconfig.microsoftonline-p.net -TTL 3600 -Proxied false
```

Creates the DNS record for Microsoft Online ID

### Example 3
```
PS C:\> New-CFDnsRecord -Type CNAME -Name enterpriseregistration -Content enterpriseregistration.windows.net -TTL 3600 -Proxied false
PS C:\> New-CFDnsRecord -Type CNAME -Name enterpriseenrollment -Content enterpriseenrollment.manage.microsoft.com -TTL 3600 -Proxied false
```

Creates the DNS records for Mobile Device Management for Office 365

## PARAMETERS

### -Content
DNS record content

```yaml
Type: String
Parameter Sets: (All)
Aliases: IPAddress, DomainName

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
DNS record name

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Proxied
Whether the record is receiving the performance and security benefits of Cloudflare

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: true, false

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TTL
Time to live for DNS record

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
DNS record type

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: A, AAAA, CNAME

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### None


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[http://gavineke.com/CloudflarePS/New-CFDnsRecord](http://gavineke.com/CloudflarePS/New-CFDnsRecord)
