FROM ubuntu:22.04

RUN apt update && apt install -y \
    dpkg

COPY package /home/package

RUN dpkg -i `find /home/package/arrmax_*.deb`

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]

CMD ["arrmax 1 2 3 4 5 6 7 8"]
