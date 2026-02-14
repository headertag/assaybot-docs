# Technical Specifications

#### Request Characteristics

* **Protocol**: HTTPS only
* **HTTP Method**: GET
* **Connection**: Keep-alive
* **Accept-Encoding**: gzip
* **Accept**: text/html, application/xhtml+xml
* **Accept-Language**: en-US,en;
* **DNT**: 1 (Do Not Track enabled)

#### Content Size Limits

* **HTML Processing**: Assaybot processes the full HTML response up to reasonable limits
* **Text Extraction**: Extracted text content is analyzed in full for moderation

#### HTTP Status Handling

* **2xx Success**: Content is analyzed normally
* **3xx Redirects**: Followed automatically (up to standard limits)
* **4xx Client Errors**: Logged and not retried
* **5xx Server Errors**: Retried up to 2 times with backoff and logged

### robots.txt Compliance

**Current Status**: robots.txt compliance is fully supported. Assaybot will respect standard robots.txt directives including:

* `User-agent: Assaybot` and `User-agent: *` rules
* `Disallow` and `Allow` directives
* `Crawl-delay` specifications

{% hint style="info" %}
**Publisher Recommendation**: Publishers may enable robots.txt restrictions at any time by adding appropriate rules to their robots.txt file. Note: this may impact eligibility to transact on Index Exchange for certain publishers. Exceptions to the robots.txt policy will be handled on a case by case basis.
{% endhint %}
