# chicago-river-sewage-archive
Archive of istheresewageinthechicagoriver.com

Original repository:

- https://github.com/open-city/chicago-river-sewage

This archive was created with `wget`:

```bash
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent http://clearstreets.org/
```

and several scripts for archiving the javascript portions of the site:

- saving JSON API endpoint as json files: json-api-crawl.sh 
- rewriting JSON API calls to use a .json file instead of dynamic API URL: rewrite-api-url.sh

## Copyright

Copyright (c) 2025 Derek Eder, Forest Gregg, Scott Beslow. Released under the MIT License.

See LICENSE for details https://github.com/datamade/clearstreets-web/blob/master/LICENSE