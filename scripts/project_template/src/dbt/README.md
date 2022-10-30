# DBT Models

Place this configuration directive at the top of each of your DBT model files:

{% raw %}
```
{{ config(
    materialized="table"
) }}
```
{% endraw %}
