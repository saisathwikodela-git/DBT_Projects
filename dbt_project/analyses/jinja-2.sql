{%- set list=['a','b','c','d'] -%}

{% for i in list%}
  {% if i!='b'%}
   {{ i }}
  {% else %}
    {{ "I don't like"+ i }}
 {% endif %}
{%endfor%}
