FROM quay.io/owtaylor/rustup-toolbox:35 AS rustup

RUN rustup update stable

RUN cargo install bat
RUN cargo install du-dust
RUN cargo install fd-find
RUN cargo install bandwhich
RUN cargo install trippy
RUN cargo install bottom
RUN cargo install tealdeer

FROM registry.fedoraproject.org/fedora-toolbox:38 AS fedora-toolbox

COPY --from=rustup /cargo/bin/bat /usr/local/bin/bat
COPY --from=rustup /cargo/bin/dust /usr/local/bin/dust
COPY --from=rustup /cargo/bin/fd /usr/local/bin/fd
COPY --from=rustup /cargo/bin/bandwhich /usr/local/bin/bandwhich
COPY --from=rustup /cargo/bin/trip /usr/local/bin/trip
COPY --from=rustup /cargo/bin/btm /usr/local/bin/btm

RUN dnf install -y \
	ethtool \
	htop \
	lshw \
	parted \
	pciutils \
	rsync \
	screen \
	sysstat \
	tmux \
        ;

RUN dnf install -y bind-utils

RUN dnf clean all
