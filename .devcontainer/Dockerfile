FROM debian:12-slim

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    ca-certificates curl default-jre dirmngr git gnupg2 libc6 libgcc1 libgssapi-krb5-2 libstdc++6 libunwind8 libuuid1 zlib1g libicu[0-9][0-9] wget

# Download PowerShell
RUN mkdir -p /tmp/pwsh '/opt/microsoft/powershell/7' && \
    curl -sSL -o '/tmp/pwsh/pwsh.tar.gz' "https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/powershell-7.4.5-linux-arm64.tar.gz"

# Install PowerShell
RUN tar xf '/tmp/pwsh/pwsh.tar.gz' -C '/opt/microsoft/powershell/7' && \
    chmod 755 '/opt/microsoft/powershell/7/pwsh' && \
    ln -sf '/opt/microsoft/powershell/7/pwsh' '/usr/bin/pwsh' && \
    add-shell '/usr/bin/pwsh' && \
    rm -rf '/tmp/pwsh'

# Install PowerShell modules
RUN pwsh -c 'Install-Module Pester, psake -Repository PSGallery -Scope AllUsers -Force'

# Create local user
RUN useradd -ms /usr/bin/pwsh vscode
