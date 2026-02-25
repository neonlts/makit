FROM archlinux:base-20260215.0.490969

RUN pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Sy --noconfirm --needed \
        base-devel bash ca-certificates \
        ccache clang clang-tools-extra \
        cmake curl git lld lldb llvm man-db \
        ninja openssh pkgconf \
        sudo tar valgrind zip unzip \
    && \
    useradd -m -u 1000 -G wheel devuser -s /bin/bash && \
    echo "devuser:password" | chpasswd && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel && \
    chmod 440 /etc/sudoers.d/wheel && \
    sed -i 's/^#\s*en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    rm -rf /var/cache/pacman/pkg/*

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

USER devuser
ENV HOME=/home/devuser

RUN mkdir -p /home/devuser/.cache/ccache && \
    chown devuser:devuser /home/devuser/.cache/ccache && \
    git clone https://github.com/microsoft/vcpkg.git /home/devuser/vcpkg && \
    (cd /home/devuser/vcpkg && ./bootstrap-vcpkg.sh)

ENV CMAKE_GENERATOR=Ninja
ENV CMAKE_CXX_COMPILER_LAUNCHER=ccache
ENV VCPKG_ROOT=/home/devuser/vcpkg
ENV PATH="${VCPKG_ROOT}:${PATH}"

WORKDIR /workspaces