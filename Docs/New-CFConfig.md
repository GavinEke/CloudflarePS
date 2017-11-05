---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: 
schema: 2.0.0
---

# New-CFConfig

## SYNOPSIS
It is required to create a config file for the module using this command as the config file is used for all other functions in this module.

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
Creates a config file to be used in conjunction with the other function in this module. 

## EXAMPLES

### Example 1
```
PS C:\> New-CFConfig -Email 'email@example.com' -ApiKey 1234567890abcdef -Domain 'example.com'
```

Creates a new config file in the default location for the domain `example.com`

### Example 2
```
PS C:\> New-CFConfig -Email 'email@example.com' -ApiKey 1234567890abcdef -ZoneID abcdef1234567890
```

Creates a new config file in the deault location for the zone id `abcdef1234567890`

### Example 3
```
PS C:\> New-CFConfig -Email 'email@example.com' -ApiKey 1234567890abcdef -Domain 'example.net' -Path '~\CFExampleNet.xml'
```

Creates a new config file in a non-default location for the domain `example.net`

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

