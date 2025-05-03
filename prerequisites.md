bb# host changes
1. umask 002 -> in /etc/profile to make all files and directories created will have 664 775 permissions
1. find /mnt/1.4TB/storage -type f -exec chmod 664 {} \;
   find /mnt/1.4TB/storage -type d -exec chmod 775 {} \;
   chmod g+s /mnt/1.4TB/storage     -> to persists group permissions

    chown :lxcsync /mnt/1.4TB/storage -> to make group user access



---
-----
-----


# Group permissions setup on storage


The storage is mounted from a USB drive.

Set the systemwide umask to `002` on both the Proxmox host and in the LXC container.
This sets the default file and directory permissions to `664` and `775`, respectively, which allows the group to read and write but not execute files. 

1. **Create a new file in /etc/profile.d/ on the host**:
   ```bash
   echo "umask 002" > /etc/profile.d/umask.sh
   ```

</br>


Follow these steps to set up and verify group permissions for mounted directory on the Proxmox host: 

1. **Set File Permissions**: Ensure all files have the correct permissions.
   ```bash
   find /mnt/1.4TB/storage -type f -exec chmod 664 {} \;
   ```

2. **Set Directory Permissions**: Ensure all directories have the correct permissions.
   ```bash
   find /mnt/1.4TB/storage -type d -exec chmod 775 {} \;
   ```

3. **Persist Group Permissions**: Apply the setgid bit to the storage directory.
   ```bash
   chmod g+s /mnt/1.4TB/storage
   ```

1. **Create lxcsync Group (if not exists)**: Use this command to create the group with ID 9000.
   ```bash
   groupadd -g 109000 lxcsync
   ```

1. **Change Group Ownership**: Assign the storage to the `lxcsync` group.
   ```bash
   chown :lxcsync /mnt/1.4TB/storage
   ```


These steps ensure that all files and directories in the storage have consistent group permissions, allowing LXC containers to access and write to the storage seamlessly.


