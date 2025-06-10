# DNS Configuration for packs.layalcloud.tech

## SPF Record Setup (HIGH Priority)

To prevent email spoofing and improve deliverability, add this SPF record to your DNS:

```
Type: TXT
Name: @
Value: v=spf1 include:_spf.google.com ~all
TTL: 3600
```

## DMARC Record (Recommended)

For additional email security:

```
Type: TXT
Name: _dmarc
Value: v=DMARC1; p=quarantine; rua=mailto:dmarc@layalcloud.tech
TTL: 3600
```

## DKIM Setup (Recommended)

Configure DKIM through your email provider (Google Workspace, etc.)

## Security Headers via DNS

Add these TXT records for enhanced security:

```
Type: TXT
Name: _security
Value: v=security1; policy=strict-transport-security; max-age=31536000
TTL: 3600
```

## Verification

After adding these records, verify them using:
- MXToolbox SPF Checker
- Google Admin Console
- DNS Checker tools

## Current Status
- ✅ HTTPS enforced via .htaccess
- ✅ Canonical URLs configured
- ⚠️ SPF record needs to be added
- ⚠️ DMARC record recommended
