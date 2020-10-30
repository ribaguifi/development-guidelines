# Forms

**Validation**

In a form class (definde in ```forms.py```), you have to define methods ```clean_field_name`` to validate ```field_name``` field.

```
def clean_postal_code(self):
    cleaned_data = super(self.clean_class, self).clean()
    postal_code = cleaned_data.get('postal_code')
    if postal_code and not re.match(r'^\d{5}$', postal_code):
        msg = _("Postal_code must be entered in the format: '99999'.")
        raise forms.ValidationError(msg)
    return postal_code
```

**Add attributes to a form (Python code)**

```
date = forms.DateField(label=_('Date'), 
                       widget=forms.widgets.TextInput(attrs={'type': 'date', 'class':'pl-0 pr-0'}))
```


**Class based views and forms**

Attributes:
* ```form_class```

  ```form_class = UserContactInformationForm```
  
* ```success_url```

  ```success_url``` = '/users/profile'

Methods:
* ```def get_success_url(self, **kwargs)```

   ```
   def get_success_url(self, *args, **kwargs):
       return reverse_lazy('monitoringsite_detail',
                           args=[self.kwargs['monitoringscheme_code'],
                           self.kwargs['monitoringsite_code']]
              )
   ```

**inlineformset**

```
class BaseUserRolesFormSet(forms.BaseInlineFormSet):
    def __init__(self, *args, **kwargs):
        ...
        super().__init__(*args, **kwargs)
        self.extra = 1
        ...

UserRolesFormSet = forms.inlineformset_factory(User, Membership, fields=('monitoringscheme', 'role'),
                                               formset=BaseUserRolesFormSet)
```
* To fix error ```ManagementForm data is missing or has been tampered with```: include  ``{{ my_formset.management_form }}`` in template (<https://docs.djangoproject.com/en/2.2/topics/forms/formsets/#understanding-the-managementform>)

* Documentation: 
<https://docs.djangoproject.com/en/3.1/topics/forms/modelforms/#inline-formsets>


**Documentation**

* Two forms one view in django: <https://krzysztofzuraw.com/blog/2016/two-forms-one-view-django>