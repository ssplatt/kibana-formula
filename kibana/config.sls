# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "kibana/map.jinja" import kibana with context %}

kibana_config:
  file.managed:
    - name: /etc/kibana/kibana.yml
    - source: salt://kibana/files/kibana.yml.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
