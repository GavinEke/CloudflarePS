---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: 
schema: 2.0.0
---

# Remove-CFDnsRecord

## SYNOPSIS
Removes a specified DNS records.

## SYNTAX

```
Remove-CFDnsRecord [-Id] <String>
```

## DESCRIPTION
Removes a specified DNS records.

## EXAMPLES

### Example 1
```
PS C:\> Remove-CFDnsRecord -Id 123abc4567890def
```

Removes the DNS record with the Id `123abc4567890def`

### Example 2
```
PS C:\> $x = Get-CFDnsRecord | Where-Object {$_.name -like 'autodiscover.*'} | Select-Object -ExpandProperty id
PS C:\> Remove-CFDnsRecord $x
```

Removes the DNS record with the name that starts with `autodiscover.`

## PARAMETERS

### -Id
DNS record ID

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

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

http://gavineke.com/CloudflarePS/Remove-CFDnsRecord.html
