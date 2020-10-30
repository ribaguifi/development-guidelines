# django translations

**Python Code**

Import translation tool:

```
from django.utils.translation import gettext_lazy as _
```

String to be translated:
```
title = _("Dashboard")
```

**Templates**

```
{% trans 'Missing periods' %}
```

If you need embed variables:

```
{% blocktrans %}You're receiving this email because you requested a password reset for your user account at {{ site_name }}.{% endblocktrans %}
```

**Settings**

In ```settings.py```, variable ```LANGUAGES```: to add more languages

**More documentation**

* Official documentation: <https://docs.djangoproject.com/en/3.1/topics/i18n/translation/>