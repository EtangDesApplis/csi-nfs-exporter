# csi-nfs-exporter
prometheus exporter for pvc usage metrics when using nfs as csi

Pros:
+ RWX
+ May resolve attachment issue
+ NFS server is managed by end-users: easy to access & backup pv

Cons:
+ Low disk I/O (but really not acceptable)
+ No quotas (xfs ?)

Remarks:
+ No quota => Elastic PV ? Managed by centreon   & no need to presize ?
+ Exporter pvc usage to prometheus

# prometheus

docker run \
    -p 9090:9090 \
    -v prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus

{__name__=~"key.*"}

dd if=/dev/zero of=/tmp/pvc-290/myfile bs=1M count=5

#https://github.com/prometheus/client_python#exporting-to-a-pushgateway
#https://ikod.medium.com/custom-exporter-with-prometheus-b1c23cb24e7a

#https://prometheus.io/docs/guides/node-exporter/

https://grafana.com/docs/grafana/latest/administration/provisioning/

global:
  scrape_interval: 15s
  scrape_timeout: 10s
  evaluation_interval: 15s
alerting:
  alertmanagers:
  - follow_redirects: true
    scheme: http
    timeout: 10s
    api_version: v2
    static_configs:
    - targets: []
scrape_configs:
- job_name: prometheus
  honor_timestamps: true
  scrape_interval: 15s
  scrape_timeout: 10s
  metrics_path: /
  scheme: http
  follow_redirects: true
  static_configs:
  - targets:
    - localhost:8000


usr/share/grafana/public/dashboards $ ls
default.json           home.json              scripted.js            scripted_async.js      scripted_templated.js  template_vars.json