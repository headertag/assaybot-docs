# User Agent and Network

Assaybot identifies itself using the following HTTP user-agent request header:

```
Mozilla/5.0 (compatible; Assaybot/0.1; +http://www.indexexchange.dev/bot.html)
```

**Important Security Note:** The HTTP `user-agent` request header can be spoofed by other crawlers. For verification purposes, publishers should validate requests using IP address verification or contact Index Exchange directly through your account representative.

#### Authorized IP Address CIDR

All other requests for Assaybot outside this address space can be considered user-agent spoofed requests.

```
192.168.80.0/24
```

###
