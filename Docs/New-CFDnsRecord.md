---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: 
schema: 2.0.0
---

# New-CFDnsRecord

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
New-CFDnsRecord [-Type] <String> [-Name] <String> [-Content] <String> [[-TTL] <Int32>] [[-Proxied] <String>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

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

