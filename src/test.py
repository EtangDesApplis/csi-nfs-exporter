from prometheus_client import start_http_server, Summary, Gauge
import random
import time

g0=Gauge('timestamp', 'Description of gauge')
g1=Gauge('key1', 'Description of gauge')
g2=Gauge('key2', 'Description of gauge')


if __name__ == '__main__':
    # Start up the server to expose the metrics.
    start_http_server(8000)
    # Generate some requests.
    
    while True:
        g0.set_to_current_time()
        g1.set(random.randint(0,1))
        g2.set(random.randint(5,10))
        time.sleep(5)
