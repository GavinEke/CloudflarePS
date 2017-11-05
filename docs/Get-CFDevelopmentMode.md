---
external help file: CloudflarePS-help.xml
Module Name: CloudflarePS
online version: http://gavineke.com/CloudflarePS/Get-CFDevelopmentMode
schema: 2.0.0
---

# Get-CFDevelopmentMode

## SYNOPSIS
Development Mode temporarily allows you to enter development mode for your websites if you need to make changes to your site. This will bypass Cloudflare's accelerated cache and slow down your site, but is useful if you are making changes to cacheable content (like images, css, or JavaScript) and would like to see those changes right away. Once entered, development mode will last for 3 hours and then automatically toggle off.

## SYNTAX

```
Get-CFDevelopmentMode
```

## DESCRIPTION
Gets the status of development mode whether it is enabled or disabled.

## EXAMPLES

### Example 1
```
PS C:\> Get-CFDevelopmentMode
```

Gets the status of development mode whether it is enabled or disabled

## PARAMETERS

## INPUTS

### None


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[http://gavineke.com/CloudflarePS/Get-CFDevelopmentMode](http://gavineke.com/CloudflarePS/Get-CFDevelopmentMode)
