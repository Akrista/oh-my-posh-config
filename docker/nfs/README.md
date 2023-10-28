# /etc/exports
Old config used:
/home/akrista/folder 192.168.1.*(rw,async,no_subtree_check)

# Folder Permissions
Be sure to do a chmod to the folder and create it with your user before launching the container:

```console
mkdir data
chmod 777 data
```

# Windows Client
Windows NFS Client ONLY WORKS up to NFS 3, also this is the mount option i use:

```powershell
mount.exe -o lang=Ansi -o fileaccess=777 -o anon \\your.server.ip.address\nfsshare X:
```
