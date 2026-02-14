# User Agent and Network

Assaybot identifies itself using the following HTTP user-agent request header:

```
Mozilla/5.0 (compatible; Assaybot/0.1; +http://www.indexexchange.dev/bot.html)
```

Assaybot always sends this user-agent string with every request. It does not attempt to disguise itself as a browser or any other client.

**Important Security Note:** The HTTP `user-agent` request header can be spoofed by other crawlers. For verification purposes, publishers should validate requests using IP address verification rather than relying solely on the user-agent string.

#### Authorized IP Address CIDR

All requests for Assaybot outside this address space can be considered user-agent spoofed requests.

```
192.139.80.0/24
```

#### Verification Recommendations

For CDN operators and network administrators who want to verify Assaybot traffic:

1. **IP Verification**: Confirm the source IP falls within the authorized CIDR range shown above
2. **User-Agent Check**: Verify the user-agent string matches the format shown above
3. **Behavioral Pattern**: Assaybot makes only standard HTTP GET requests, respects robots.txt directives, and does not attempt to bypass authentication or access controls

If you need additional assistance with verification or allowlisting, contact your Index Exchange account representative.
