# W3B DVC Blockchain Workshop

## Prerequisites

Before installing Hardhat, ensure you have the following installed:

- **Node.js**: [Download Node.js](https://nodejs.org/)
- **npm** (comes with Node.js)
```bash
  node -v
  npm -v
```

## Setting Up Hardhat

Follow these steps to set up a Hardhat project:

**1. Create a project directory:**

```bash
mkdir my-hardhat-project
cd my-hardhat-project
```

**2. Initialize the project with package.json**

```bash
npm init -y
```

**3. Install Hardhat:**

```bash
npm install --save-dev hardhat
```

**4. Set up your Hardhat project:**

```bash
npx hardhat
```

## Basic Hardhat Commands

**Compile Contracts:**
```bash
npx hardhat compile
```

**Start Local Blockchain:**
```bash
npx hardhat node
```

**Deploy Contracts:**
```bash
npx hardhat run scripts/deploy.js --network localhost
```

For additional commands and more in-depth usage, refer to the [Hardhat documentation](https://hardhat.org/hardhat-network/docs/overview).

## Alternative Tools

- **MetaMask:** A browser extension wallet to interact with Ethereum and other networks. [Download MetaMask](https://metamask.io/)
- **OpenZeppelin Contracts:** A library of secure smart contract templates. [OpenZeppelin GitHub Repository](https://github.com/OpenZeppelin/openzeppelin-contracts)
- **Remix IDE:** A web-based environment for Solidity development. [Access Remix](https://remix.ethereum.org/)