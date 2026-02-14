# Managing Assaybot Access

#### Allowing Access

To ensure optimal brand safety monitoring and maintain good standing in Index Exchange's supply network, we recommend allowing Assaybot access to your content.

**Benefits of allowing access:**

* Proactive identification of potential content issues
* Faster resolution of brand safety concerns
* Maintained access to demand across Index Exchange's network
* Transparency in content quality assessment

#### Blocking Access (Not Recommended)

Publishers who choose to block Assaybot should be aware:

* **Quality Assurance Impact**: Manual review processes may be required, potentially causing delays
* **Operational Communication**: Blocking may necessitate additional coordination with your account team
* **Future robots.txt Support**: Once implemented, standard robots.txt rules can be used for access control

**How to Block:**

Add the following to your robots.txt file:

```
User-agent: Assaybot
Disallow: /
```

To block specific sections while allowing others:

```
User-agent: Assaybot
Disallow: /private/
Disallow: /admin/
Allow: /
```
