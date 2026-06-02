# Technical Specifications

#### Request Characteristics

* **Protocol**: HTTPS only
* **HTTP Method**: GET (read-only; Assaybot never POSTs data to publisher sites)
* **Connection**: Keep-alive
* **Accept-Encoding**: gzip
* **Accept**: text/html, application/xhtml+xml
* **Accept-Language**: en-US,en;
* **DNT**: 1 (Do Not Track enabled)
* **Cookies**: Disabled — Assaybot does not send or store cookies

#### Content Processing

* **HTML Processing**: Assaybot processes the full HTML response, extracting only visible text content
* **Text Extraction**: Scripts, styles, navigation elements, and non-visible markup are stripped before analysis
* **Media**: Images, videos, and other media files are not downloaded

#### HTTP Status Handling

* **2xx Success**: Content is extracted and analyzed normally
* **3xx Redirects**: Followed automatically (up to 5 redirects per request)
* **4xx Client Errors**: Logged and not retried — Assaybot respects access restrictions
* **429 Too Many Requests**: Retried with exponential backoff (automatically backs off to reduce load)
* **5xx Server Errors**: Retried up to 3 times with exponential backoff, then logged as failed

### robots.txt Compliance

Assaybot fully respects the Robots Exclusion Standard. Before crawling any page, Assaybot checks the site's robots.txt file and honors all applicable directives, including:

* `User-agent: Assaybot` specific rules (checked first)
* `User-agent: *` wildcard rules (used as fallback)
* `Disallow` and `Allow` directives
* `Crawl-delay` specifications

robots.txt responses are cached so that your server is not repeatedly queried for the same file.

> ℹ️ **Publisher Recommendation**: Publishers may add robots.txt rules for Assaybot at any time. Note: restricting access may impact eligibility to transact on Index Exchange for certain inventory. Exceptions to the robots.txt policy will be handled on a case-by-case basis through your account representative.
