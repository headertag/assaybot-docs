# Troubleshooting & Common Issues

#### High Request Volume

If you notice unexpectedly high request volume from Assaybot:

1. **Verify Authenticity**: Confirm requests are legitimate by checking user-agent and timing patterns. Index Exchange can provide a list of IP address exit nodes to assist with any investigations.
2. **Check Deduplication**: The system should not request the same URL more than once per 24 hours
3. **Contact Support**: Reach out to your account representative if issues persist

#### Access Errors

If Assaybot encounters repeated access errors (403, 401, etc.):

* **WAF/CDN Blocking**: Check if your Web Application Firewall or CDN is blocking the bot
* **Rate Limiting**: Verify rate limits are not overly restrictive for automated access
* **Authentication**: Ensure publicly advertised pages are accessible without authentication
* **IP Allowlisting**: Contact Index Exchange for IP ranges if allowlisting is required

#### Content Analysis Issues

If you believe Assaybot is incorrectly flagging content:

1. **Review Flagged Content**: Index Exchange can provide specific examples of flagged content for your review
2. **Understand Criteria**: Brand safety criteria include explicit sexual content, hate speech, violence, and illegal content
3. **Request Review**: Contact your account representative to request a manual review
4. **Appeal Process**: Work with the Exchange Quality team for remediation guidance
