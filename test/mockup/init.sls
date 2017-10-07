kibana_mockup_pkgs:
  pkg.installed:
    - pkgs:
      - haveged

kibana_repo:
  pkgrepo.managed:
    - humanname: kibana
    - name: deb https://artifacts.elastic.co/packages/5.x/apt stable main
    - file: /etc/apt/sources.list.d/elastic-5.x.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch

kibana_pki_dir:
  file.directory:
    - name: /etc/pki

kibana_mockup_tls_config:
  file.managed:
    - name: /etc/salt/minion.d/ca.conf
    - contents:
      - "ca.cert_base_path: /etc/pki"

kibana_mockup_ssl_create_ca:
  module.run:
    - name: tls.create_ca
    - ca_name: test_ca
    - days: 5
    - CN: MyTestCA
    - C: US
    - ST: MyState
    - L: MyCity
    - O: MyOrgUnit
    - emailAddress: test@example.com
    - unless: test -f /etc/pki/test_ca/test_ca_ca_cert.key

kibana_mockup_ssl_create_csr:
  module.run:
    - name: tls.create_csr
    - ca_name: test_ca
    - CN: kibana
    - unless: test -f /etc/pki/test_ca/certs/kibana.key

kibana_mockup_ssl_sign_csr:
  module.run:
    - name: tls.create_ca_signed_cert
    - ca_name: test_ca
    - CN: kibana
    - unless: test -f /etc/pki/test_ca/certs/kibana.crt
