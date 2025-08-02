ARG FEDORA_VERSION
FROM trow.laurel.lagrange-automation.io/rustup-toolbox:$FEDORA_VERSION AS rustup

RUN dnf install -y cmake

RUN cargo install bat
RUN cargo install du-dust
RUN cargo install fd-find
RUN cargo install bandwhich
RUN cargo install trippy
RUN cargo install bottom
RUN cargo install tealdeer
RUN cargo install watchexec-cli
RUN cargo install starship

FROM registry.fedoraproject.org/fedora-toolbox:$FEDORA_VERSION AS fedora-toolbox

COPY --from=rustup /cargo/bin/bat /usr/local/bin/bat
COPY --from=rustup /cargo/bin/dust /usr/local/bin/dust
COPY --from=rustup /cargo/bin/fd /usr/local/bin/fd
COPY --from=rustup /cargo/bin/bandwhich /usr/local/bin/bandwhich
COPY --from=rustup /cargo/bin/trip /usr/local/bin/trip
COPY --from=rustup /cargo/bin/btm /usr/local/bin/btm
COPY --from=rustup /cargo/bin/watchexec /usr/local/bin/watchexec
COPY --from=rustup /cargo/bin/starship /usr/local/bin/starship

RUN dnf install -y \
	btrfs-progs \
	ethtool \
	htop \
	lshw \
	neovim \
	parted \
	pciutils \
  usbutils \
	rsync \
  rclone \
	screen \
	sysstat \
	tmux \
	zsh \
	bind-utils \
  dmidecode \
  smartmontools \
	;

RUN mkdir -p /root/.config/bottom
COPY files/dot_config/bottom/bottom.toml /root/.config/bottom/bottom.toml

RUN dnf clean all
