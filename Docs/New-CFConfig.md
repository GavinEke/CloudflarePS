---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: 
schema: 2.0.0
---

# New-CFConfig

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

### DomainName (Default)
```
New-CFConfig -Email <MailAddress> -ApiKey <String> -Domain <String> [-Path <String>] [-WhatIf] [-Confirm]
```

### ZoneID
```
New-CFConfig -Email <MailAddress> -ApiKey <String> -ZoneID <String> [-Path <String>] [-WhatIf] [-Confirm]
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

### -ApiKey
Global API Key on https://www.cloudflare.com/a/profile

```yaml
Type: String
Parameter Sets: (All)
Aliases: XAuthKey

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
The domain to use with the API

```yaml
Type: String
Parameter Sets: DomainName
Aliases: DefaultDomain

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
The email address used to logon to Cloudflare

```yaml
Type: MailAddress
Parameter Sets: (All)
Aliases: XAuthEmail

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Optional non default path to config file

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ZoneID
The Zone ID of the domain to use with the API

```yaml
Type: String
Parameter Sets: ZoneID
Aliases: 

Required: True
Position: Named
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

