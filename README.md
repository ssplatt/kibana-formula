# kibana-formula

Formula to install and configure Kibana, part of the ELK stack. http://elastic.co

## Default configuration
The main configuration is under the kibana:conf tree, which is absent by default and results in the stock kibana configuration.
```
kibana:
  enabled: False
  pkg: kibana
  service:
    name: kibana
    state: dead
    enable: False
    sig: kibana
    execstart: /opt/kibana/bin/kibana
    user: kibana
    group: root
  plugins:
    enabled: False
```
## Custom configuration
The formula is configured to render out the pure yaml in the kibana/config/kibana.yml file. So, all options are available for configuration. You can also change the user and group to run the service as.
```
kibana:
  enabled: True
  conf:
    server.port: 5601
    server.host: "0.0.0.0"
    server.basePath: "/opt/kibana"
    server.maxPayloadBytes: 1048576
    elasticsearch.url: "http://localhost:9200"
    elasticsearch.preserveHost: "true"
    kibana.index: ".kibana"
    kibana.defaultAppId: "discover"
    elasticsearch.username: "user"
    elasticsearch.password: "pass"
    server.ssl.cert: /etc/pki/test_ca/certs/kibana.crt
    server.ssl.key: /etc/pki/test_ca/certs/kibana.key
    elasticsearch.ssl.cert: /etc/pki/test_ca/certs/kibana.crt
    elasticsearch.ssl.key: /etc/pki/test_ca/certs/kibana.key
    elasticsearch.ssl.ca: /etc/pki/test_ca/test_ca_ca_cert.crt
    elasticsearch.ssl.verify: "true"
    elasticsearch.pingTimeout: 1500
    elasticsearch.requestTimeout: 30000
    elasticsearch.shardTimeout: 0
    elasticsearch.startupTimeout: 5000
    pid.file: /home/kibana/kibana.pid
    logging.dest: stdout
    logging.silent: "false"
    logging.quiet: "false"
    logging.verbose: "false"
    shield.encryptionKey: "something_secret"
    shield.sessionTimeout: 600000
  service:
    name: kibana
    state: running
    enable: True
		user: kibana
		group: kibana
  plugins:
    enabled: True
    marvel: true
    shield: true
```