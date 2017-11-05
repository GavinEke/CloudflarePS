---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: 
schema: 2.0.0
---

# Set-CFDevelopmentMode

## SYNOPSIS
Development Mode temporarily allows you to enter development mode for your websites if you need to make changes to your site. This will bypass Cloudflare's accelerated cache and slow down your site, but is useful if you are making changes to cacheable content (like images, css, or JavaScript) and would like to see those changes right away. Once entered, development mode will last for 3 hours and then automatically toggle off.

## SYNTAX

```
Set-CFDevelopmentMode [-Request] <String>
```

## DESCRIPTION
Sets the development mode for the website.

## EXAMPLES

### Example 1
```
PS C:\> Set-CFDevelopmentMode Enable
```

Turns on development mode for 3 hours

## PARAMETERS

### -Request
Do you want to Enable or Disable development mode?

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: Enable, Disable

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

http://gavineke.com/CloudflarePS/Set-CFDevelopmentMode.html
