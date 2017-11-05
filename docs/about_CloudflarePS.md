# CloudflarePS
## about_CloudflarePS

PowerShell Module for managing domains with Cloudflare.           

# SHORT DESCRIPTION
PowerShell Module for managing domains with Cloudflare.

# LONG DESCRIPTION
PowerShell Module for managing domains with Cloudflare.

# EXAMPLES
Create multiple configs for different domains

```
New-CFConfig -Email 'email@example.com' -ApiKey 1234567890abcdef -Domain 'example.com' -Path '~\CFExampleCom.xml'
New-CFConfig -Email 'email@example.com' -ApiKey 1234567890abcdef -Domain 'example.net' -Path '~\CFExampleNet.xml'
```

Using a different config from the default

```
Import-CFConfig '~\CFExampleNet.xml'
```

Getting a DNS record and removing it

```
$x = Get-CFDnsRecord | Where-Object {$_.name -like 'autodiscover.*'} | Select-Object -ExpandProperty id
Remove-CFDnsRecord $x
```

Create DNS Record for Microsoft Online ID

```
New-CFDnsRecord -Type CNAME -Name msoid -Content clientconfig.microsoftonline-p.net -TTL 3600 -Proxied false
```

Create DNS Record for Mobile Device Management for Office 365

```
New-CFDnsRecord -Type CNAME -Name enterpriseregistration -Content enterpriseregistration.windows.net -TTL 3600 -Proxied false
New-CFDnsRecord -Type CNAME -Name enterpriseenrollment -Content enterpriseenrollment.manage.microsoft.com -TTL 3600 -Proxied false
```

# NOTE


# TROUBLESHOOTING NOTE


# SEE ALSO


# KEYWORDS

- CF
- Cloudflare
- DNS
