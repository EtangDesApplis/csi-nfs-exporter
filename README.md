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
