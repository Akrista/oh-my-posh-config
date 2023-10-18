Running migrations
Once the respective container ID is copied, execute the following command to open an interactive shell within the container to execute the migration command:
docker exec -it <container_id> /bin/sh
Copy to clipboard
Once inside the container, run the migration using:
pnpx prisma migrate deploy
