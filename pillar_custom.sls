# -*- coding: utf-8 -*-
# vim: ft=yaml
---
kibana:
  enabled: True
  conf:
    server.port: 5601
    server.host: 0.0.0.0
    server.ssl.enabled: True
    server.ssl.certificate: /etc/pki/test_ca/certs/kibana.crt
    server.ssl.key: /etc/pki/test_ca/certs/kibana.key
    elasticsearch.ssl.certificate: /etc/pki/test_ca/certs/kibana.crt
    elasticsearch.ssl.key: /etc/pki/test_ca/certs/kibana.key
    elasticsearch.ssl.ca: /etc/pki/test_ca/test_ca_ca_cert.crt
    elasticsearch.url: https://localhost:9200
    elasticsearch.username: user
    elasticsearch.password: pass
    elasticsearch.ssl.verify: true
  service:
    name: kibana
    state: running
    enable: True
