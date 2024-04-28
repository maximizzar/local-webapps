#1. check if dependencies are installed
if ! which docker >/dev/null 2>&1; then
  echo "Please install docker. Follow the official documentation: https://docs.docker.com/engine/install/"
  exit 1;
fi

if ! which nginx >/dev/null 2&1; then
    echo "Install nginx webserver via your packetmanager!"
    exit 1;
fi

#2. create dockge-dir and put compose file in it
mkdir -pv /etc/docker/dockge
cp dockge/compose.yaml /etc/docker/dockge/compose.yaml

#3. create docker-stacks dir and put compose files in it
mkdir /etc/docker/stacks/
cp stacks/* /etc/docker/stacks/*

#4. put nginx config into their respective dirs
cp nginx/nginx.conf /etc/nginx/nginx.conf
cp nginx/sites/* /etc/nginx/sites-available/*

#5. create symlinks from sites-available to sites-enabled
ln -s /etc/nginx/sites-available/dockge.maximizzar.de.conf /etc/nginx/sites-enabled/dockge.maximizzar.de.conf
ln -s /etc/nginx/sites-available/it-tools.maximizzar.de.conf /etc/nginx/sites-enabled/it-tools.maximizzar.de.conf
ln -s /etc/nginx/sites-available/scrutiny.maximizzar.de.conf /etc/nginx/sites-enabled/scrutiny.maximizzar.de.conf
ln -s /etc/nginx/sites-available/stirling-pdf.maximizzar.de.conf /etc/nginx/sites-enabled/stirling-pdf.maximizzar.de.conf

