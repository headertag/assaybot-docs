# Crawl Behavior

#### Access Frequency

Assaybot is designed to minimize impact on publisher infrastructure:

* **Deduplication**: Assaybot maintains a multi-layer deduplication system to prevent redundant requests. Each URL is analyzed at most once within a 30-day rolling window. A short-term cache prevents duplicate requests within the same day, while a long-term filter ensures URLs are not re-crawled for up to 30 days
* **Per-Domain Concurrency**: Assaybot limits the number of simultaneous requests to any single domain, ensuring no individual site experiences excessive load
* **Timeout Period**: Each page request has a 30-second timeout — if your server does not respond within that window, Assaybot moves on
* **Retry Logic**: Failed requests (server errors or rate limit responses) are retried up to 3 times with exponential backoff, increasing the delay between each attempt to avoid adding pressure to an already-strained server
* **Rate Limit Compliance**: If your server returns a `429 Too Many Requests` response, Assaybot will back off automatically and retry with increasing delays

#### What Assaybot Accesses

Assaybot analyzes URLs that appear in ad request traffic flowing through Index Exchange. The system:

* Processes page URLs and referrer URLs observed in ad request data
* Makes a single HTTP GET request per URL to retrieve the page content
* Extracts visible text content for brand safety analysis
* Stores analysis results internally for quality assurance reporting
* Does **not** index content for public search or external redistribution
* Does **not** execute JavaScript, submit forms, or interact with page elements
* Does **not** follow links on the page to discover new URLs — it only visits URLs already observed in ad traffic

#### Content Analysis Method

Assaybot uses a straightforward content retrieval approach:

* Makes standard HTTP GET requests using the documented user-agent string
* Extracts visible text content from the HTML response
* Strips scripts, styles, navigation elements, and other non-visible content
* Follows redirects automatically (up to 5 hops)
* Timeout: 30 seconds per request
* Cookies are disabled — Assaybot does not send or store cookies

The extracted text is then passed through a multi-stage AI classification pipeline to assess brand safety. No images, videos, or other media are downloaded or analyzed as of the last update to this guide.

### Domain Safe List and Block List

Assaybot maintains curated domain lists to optimize system resources and focus analysis where it is most needed:

* **Safe List**: Well-known, trusted publisher domains (such as major news outlets) are automatically classified as safe and are not crawled, saving resources for both Assaybot and the publisher
* **Block List**: Domains that are already known to be non-compliant are excluded from crawling

These lists are maintained by Index Exchange and updated on a regular basis. If you believe your domain has been incorrectly categorized, please contact your account representative.
