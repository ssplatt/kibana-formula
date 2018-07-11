kibana_mockup_pkgs:
  pkg.installed:
    - pkgs:
      - haveged

{% if grains.os_family == "Debian" %}
kibana_debian_repo_managed:
  pkgrepo.managed:
    - humanname: Elasticsearch Repo
    - name: deb https://artifacts.elastic.co/packages/6.x/apt stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/elastic-6.x.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - refresh_db: True
    
jessie_backports_repo_managed:
  pkgrepo.managed:
    - humanname: Jessie Backports
    - name: deb http://ftp.debian.org/debian jessie-backports main
    - file: /etc/apt/sources.list.d/jessie-backports.list
{% endif %}

{% if grains.os_family == "RedHat" %}
kibana_rhel_repo_managed:
  pkgrepo.managed:
    - humanname: Elasticsearch repository for 6.x packages
    - name: elasticsearch-6.x
    - file: /etc/yum.repos.d/elastic
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - baseurl: https://artifacts.elastic.co/packages/6.x/yum

test_mockup_ssl_support:
  pkg.installed:
    - pkgs:
      - pyOpenSSL
{% endif %}

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
