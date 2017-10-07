# -*- coding: utf-8 -*-
# vim: ft=sls
# Init Kibana
{%- from "kibana/map.jinja" import kibana with context %}

{% if kibana.enabled %}
include:
  - kibana.install
  - kibana.config
  - kibana.service
{% else %}
'kibana-formula disabled':
  test.succeed_without_changes
{% endif %}
