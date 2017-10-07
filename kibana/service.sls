# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "kibana/map.jinja" import kibana with context %}

kibana_service:
  service.{{ kibana.service.state }}:
    - name: {{ kibana.service.name }}
    - enable: {{ kibana.service.enable }}
    - listen:
      - file: kibana_config
