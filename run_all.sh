docker run -d --network host \
-v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
prom/prometheus

docker run -d -p 3000:3000 --network host \
 -v $PWD/provisioning:/etc/grafana/provisioning \
  -v $PWD/dashboards:/etc/dashboards \
 grafana/grafana

# -v $PWD/grafana.ini:/etc/grafana/grafana.ini \