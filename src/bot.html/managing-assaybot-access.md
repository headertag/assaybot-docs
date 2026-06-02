# Managing Assaybot Access

#### Allowing Access (Recommended)

To ensure optimal brand safety monitoring and maintain good standing in Index Exchange's supply network, we recommend allowing Assaybot full access to your publicly available content.

**Benefits of allowing access:**

* Proactive identification of potential content issues before they affect your revenue
* Faster resolution of brand safety concerns with automated, consistent analysis
* Maintained eligibility for premium advertiser demand across Index Exchange
* Transparent, data-driven content quality assessments available through your account team

Assaybot is designed to be a good citizen on your infrastructure. It respects robots.txt, limits concurrent requests per domain, backs off automatically when rate-limited, and will never crawl the same URL more than once within a 30-day window.

#### Restricting or Blocking Access

Assaybot fully supports robots.txt directives, giving you granular control over what it can access. Publishers who choose to restrict or block Assaybot should be aware:

* **Quality Assurance Impact**: Content that cannot be analyzed may require manual review processes, potentially causing delays in brand safety assessments
* **Demand Eligibility**: Blocking may impact eligibility to transact on Index Exchange for certain inventory, as automated brand safety verification cannot be completed
* **Account Coordination**: Significant restrictions may require additional coordination with your account team

**To block Assaybot entirely**, add the following to your robots.txt file:

```
User-agent: Assaybot
Disallow: /
```

**To allow access to most of your site while restricting specific sections:**

```
User-agent: Assaybot
Disallow: /private/
Disallow: /admin/
Allow: /
```

**To set a crawl delay** (seconds between requests):

```
User-agent: Assaybot
Crawl-delay: 10
```

If you have questions about how access restrictions may affect your account, please contact your Index Exchange account representative.
