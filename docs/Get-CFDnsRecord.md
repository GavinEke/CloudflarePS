---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: http://gavineke.com/CloudflarePS/Get-CFDnsRecord
schema: 2.0.0
---

# Get-CFDnsRecord

## SYNOPSIS
List, search, sort, and filter a zones' DNS records.

## SYNTAX

```
Get-CFDnsRecord
```

## DESCRIPTION
Gets all DNS records.

## EXAMPLES

### Example 1
```
PS C:\> Get-CFDnsRecord
```

Lists all DNS records

### Example 2
```
PS C:\> Get-CFDnsRecord | Where-Object {$_.name -like 'www.*'}
```

Gets the DNS record with the name that starts with `www.`


## PARAMETERS

## INPUTS

### None


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[http://gavineke.com/CloudflarePS/Get-CFDnsRecord](http://gavineke.com/CloudflarePS/Get-CFDnsRecord)
