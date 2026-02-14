# Crawl Behavior

#### Access Frequency

Assaybot is designed to minimize impact on publisher infrastructure:

* **Deduplication**: Distinct URLs may be analyzed up to once per 24-hour period by preventing excessive load and redundant processing
* **Concurrent Requests**: The system operates with controlled concurrency to distribute load
* **Timeout Period**: Each page request has a 30-second timeout
* **Retry Logic**: Failed requests are retried up to 2 times with exponential backoff

#### What Assaybot Accesses

Assaybot processes URLs that appear in ad request traffic flowing through Index Exchange's supply ingress point then:

* Extracts page URLs and referrer URLs from ad request data
* Analyzes the rendered text content of web pages
* Stores analysis results for quality assurance reporting
* Does not index content for public search or external redistribution

#### Content Analysis Method

**Primary Method:**

* Makes standard HTTP GET requests
* Extracts visible text content from HTML
* Strips scripts, styles, and non-visible elements
* Timeout: 30 seconds
* Follows redirects automatically

**Advanced Secondary Methods (Deep Scanning):**

* Uses headless Chrome browser for JavaScript-heavy sites
* Renders dynamic content
* Captures screenshots for future image analysis capabilities
* Reserved for specialized scanning needs

The scraping method can be configured based on publisher risk thresholds.

### Domain Blocklist

Assaybot automatically excludes certain high-traffic domains from analysis to optimize system resources:

* Major social media platforms (facebook.com, twitter.com/x.com, instagram.com, linkedin.com, tiktok.com)
* Video platforms (youtube.com)
* Search engines (google.com)
