from prometheus_client import start_http_server, Gauge
import time
import os
import glob
import subprocess

if __name__ == '__main__':
    # Start up the server to expose the metrics.
    start_http_server(8000)
    monitor={'total':{"gauge":Gauge('total_pvc_disk_usage', 'nfs pv disk usage in GB'),"value":0.}}
    # Scan every 5s
    while True:
        # set default values
        for pvc in monitor.keys():
            monitor[pvc]["value"]=0.
        # get real values
        totalUsage=0
        for item in glob.glob("/storage/*"):
            if item.find("pvc")>-1 and os.path.isdir(item):
                pvName=os.path.basename(item).replace('-','_')
                #print(pvName)
                if pvName not in monitor.keys():
                    monitor[pvName]={'gauge':Gauge(pvName, 'nfs pv disk usage in GB'),'value':0.}
                usage=float(subprocess.check_output(['du','-s', item]).split()[0].decode('utf-8'))/1024**2
                monitor[pvName]['value']=usage
                monitor['total']['value']+=usage
        # update values
        for pvc in monitor.keys():
            monitor[pvc]['gauge'].set(monitor[pvc]['value'])
        time.sleep(5)