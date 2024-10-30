#!/bin/bash


# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Verifikasi Rust
echo "Rust installed. Version:"
rustc --version

# Install Solana CLI
echo "Installing Solana CLI..."
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

# Add Solana to PATH
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Verifikasi Installasi Solana CLI
echo "Solana CLI installed. Version:"
solana --version

# Install Node.js dan npm
if ! command -v node &> /dev/null
then
    echo "Node.js not found, installing Node.js and npm..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Verifikasi installasi Node.js and npm
echo "Node.js installed. Version:"
node -v
echo "npm installed. Version:"
npm -v

# Install Anchor CLI
echo "Installing Anchor CLI..."
cargo install --git https://github.com/coral-xyz/anchor anchor-cli --locked

# Verifikasi Installasi Anchor CLI
echo "Anchor CLI installed. Version:"
anchor --version

echo "Installation complete! Rust, Solana CLI, and Anchor CLI are ready to use."
