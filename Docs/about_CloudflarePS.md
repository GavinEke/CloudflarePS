# CloudflarePS
## about_CloudflarePS

```
ABOUT TOPIC NOTE:
The first header of the about topic should be the topic name.
The second header contains the lookup name used by the help system.

IE:
# Some Help Topic Name
## SomeHelpTopicFileName

This will be transformed into the text file
as `about_SomeHelpTopicFileName`.
Do not include file extensions.
The second header should have no spaces.
```              

# SHORT DESCRIPTION
PowerShell Module for managing domains with Cloudflare.

# LONG DESCRIPTION
{{ Long Description Placeholder }}

## Optional Subtopics
{{ Optional Subtopic Placeholder }}

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
{{ Note Placeholder - Additional information that a user needs to know.}}

# TROUBLESHOOTING NOTE
{{ Troubleshooting Placeholder - Warns users of bugs}}

{{ Explains behavior that is likely to change with fixes }}

# SEE ALSO
{{ See also placeholder }}

{{ You can also list related articles, blogs, and video URLs. }}

# KEYWORDS

- CF
- Cloudflare
- DNS
