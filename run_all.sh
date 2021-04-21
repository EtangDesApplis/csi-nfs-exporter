docker run -d --network host -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus
docker run -d -p 3000:3000 --network host grafana/grafana