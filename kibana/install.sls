# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "kibana/map.jinja" import kibana with context %}

kibana_pkg_install:
  pkg.installed:
    - name: {{ kibana.pkg }}

{% if kibana.plugins is defined %}
  {% for plugin in kibana.plugins %}
kibana_plugin_{{ plugin}}:
  cmd.run:
    - name: bin/kibana-plugin install {{ plugin }}
    - cwd: /usr/share/kibana
    - unless: /usr/share/kibana/bin/kibana-plugin list | grep {{ plugin }}
  {% endfor %}
{% endif %}
