---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: 
schema: 2.0.0
---

# Import-CFConfig

## SYNOPSIS
This command will import the config which is required for use with other function in the module.

## SYNTAX

```
Import-CFConfig [[-Path] <FileInfo>]
```

## DESCRIPTION
Imports the config to use with the module.

## EXAMPLES

### Example 1
```
PS C:\> Import-CFConfig
```

Import the config from the default location

### Example 2
```
PS C:\> Import-CFConfig '~\CFExampleNet.xml'
```

Import a config from the specified location

## PARAMETERS

### -Path
Optional non default path to config file

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases: 

Required: False
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

