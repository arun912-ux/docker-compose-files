COMMON_GROUP="lxcsync"
COMMON_GID="9000"
SHARED_DIR="/media/drive"

for CTID in $(pct list | awk 'NR>1 {print $1}'); do
    echo "Processing container $CTID..."

    # Create group if not exists
    if ! pct exec $CTID -- getent group "$COMMON_GROUP" > /dev/null; then
        echo "Creating group '$COMMON_GROUP' in container $CTID"
        pct exec $CTID -- groupadd -g "$COMMON_GID" "$COMMON_GROUP"
    else
        echo "group '$COMMON_GROUP' already exists.!"
    fi

    # Get users with UID >= 10
    users=$(pct exec $CTID -- getent passwd | awk -F: '$3 >= 10 && $3 < 60000 {print $1}')

    for user in $users; do
        # Add user to group only if not already a member
        if ! pct exec $CTID -- id -nG "$user" | grep -qw "$COMMON_GROUP"; then
            echo "Adding user $user to group '$COMMON_GROUP' in container $CTID"
            pct exec $CTID -- usermod -aG "$COMMON_GROUP" "$user"
        fi
    done

    # Create shared directory if not exists
    if ! pct exec $CTID -- test -d "$SHARED_DIR"; then
        echo "Creating shared directory '$SHARED_DIR' in container $CTID"
        pct exec $CTID -- mkdir -p "$SHARED_DIR"
        pct exec $CTID -- chown :$COMMON_GROUP "$SHARED_DIR"
        pct exec $CTID -- chmod 2775 "$SHARED_DIR"
        echo "permissions 2775 has set to '$SHARED_DIR'"
    fi

    # Set umask if not already set
    if ! pct exec $CTID -- test -f /etc/profile.d/umask.sh; then
        pct exec $CTID -- bash -c "echo 'umask 0002' > /etc/profile.d/umask.sh"
        pct exec $CTID -- chmod +x /etc/profile.d/umask.sh
    fi

    echo "Done with container $CTID"
    echo "--------------------------------------------"
done

