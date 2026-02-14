# Troubleshooting & Common Issues

#### High Request Volume

If you notice unexpectedly high request volume from Assaybot:

1. **Verify Authenticity**: First, confirm the requests are genuinely from Assaybot by checking the user-agent string and verifying the source IP against Index Exchange's authorized IP range (`192.139.80.0/24`). Requests from outside this range using the Assaybot user-agent are spoofed
2. **Check Deduplication**: Assaybot should not request the same URL more than once within a 30-day period. If you are seeing repeated requests to the same URL, the traffic may not be from Assaybot
3. **Use robots.txt**: You can set a `Crawl-delay` directive in your robots.txt file to control how frequently Assaybot makes requests to your site
4. **Contact Support**: If the issue persists after verification, reach out to your account representative with sample request logs (timestamps, URLs, source IPs) and Index Exchange will investigate

#### WAF and CDN Configuration

If Assaybot is being blocked by your Web Application Firewall (WAF) or CDN:

* **Allowlist by IP**: Add Index Exchange's authorized IP range (`192.139.80.0/24`) to your WAF/CDN allowlist
* **Allowlist by User-Agent**: Add `Assaybot` to your bot allowlist. Note that IP verification is more secure than user-agent matching alone
* **Rate Limiting**: If your CDN applies rate limits, ensure they are not so restrictive that legitimate crawl traffic is blocked. Assaybot limits its own per-domain concurrency and respects `429` responses with automatic backoff
* **Bot Management**: If you use a bot management solution (e.g., Cloudflare Bot Management, Akamai Bot Manager), you may need to add Assaybot to your verified bot list or create an exception rule

#### Access Errors

If Assaybot encounters repeated access errors on your site (403, 401, etc.):

* **Authentication Walls**: Assaybot can only access publicly available pages. Ensure the pages that appear in ad traffic are accessible without authentication
* **Geo-Restrictions**: If your site restricts access by geography, ensure that Index Exchange's IP range is permitted
* **IP Allowlisting**: Use the authorized CIDR range documented in the [User Agent and Network](user-agent-and-network.md) section

#### Content Analysis Issues

If you believe Assaybot is incorrectly flagging content:

1. **Review Flagged Content**: Your account representative can provide specific examples of content that was flagged and the reason for the classification
2. **Understand Criteria**: Brand safety assessment covers categories including explicit sexual content, hate speech, violence, illegal activity, and other material that may affect advertiser confidence. Classifications follow IAB brand safety guidelines
3. **Request Review**: Contact your account representative to request a manual review of specific flagged URLs
4. **Appeal Process**: Work with the Exchange Quality team for remediation guidance. Incorrectly flagged content can be reviewed and reclassified
