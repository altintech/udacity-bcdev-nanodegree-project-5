# Udacity Decentralized Star Notary Service Project - Project 5 Submission
**This MY-README.md file contains all instructions for my submission of the completed project as requested on the "ND1309 C2 Ethereum Smart Contracts, Tokens and Dapps - Project Starter"**

**The teaching material for this project is found on "Udacity > Blockchain Developer > Ethereum Smart Contracts, Tokens and Dapps > Decentralized Notary Service Project" lesson.**

## Assumptions

* Reader of this readme might not have access to the Udacity lesson material
* Instructions below would allow anyone to start from scratch and end up with a functioning Dapp

## Project Submission Details

* **Truffle Version** - v5.5.21
* **ERC-721 Token Name** - StarNotary
* **ERC-721 Token Symbol** - SN
* **Token Address on Ropsten network** - [0x2af0Af3345F6b63187B61d6EEb655713355CfeCE](https://ropsten.etherscan.io/address/0x2af0Af3345F6b63187B61d6EEb655713355CfeCE)
* **GitHub Repo** - https://github.com/altintech/udacity-bcdev-nanodegree-project-5

---

## Step-By-Step Guide

---

### GitHub Repo Starter
1. **GitHub Account** - Create a [GitHub](https://github.com) account if you do not have one
2. **GitHub Repo** - Click on the "+" dropdown sign on top right corner and choose to create a New Repository
3. **README Files** - Name the repo something you like and choose to add a README file to initialize it with something. Later the "MY-README.md file will be placed there as well"
4. **Develop Branch** - Click on "main" dropdown, type "develop" and click to "Create branch: develop from main"
5. **Clone Link** - Click on "Code" dropdown green button and copy the HTTPS link to clone this repo. You'll use this link below

### IntelliJ IDEA Starter
1. **IntelliJ IDEA Download** - Download [IntelliJ IDEA](https://www.jetbrains.com/idea/download/) if you do not have it as your IDE
2. **Project From GitHub** - Start your IntelliJ IDEA and choose to Create a new project from VCS and use the GitHub repo clone HTTPS link you copied from above
3. **Develop Branch Checkout** - Checkout the remote "develop" branch by navigating to Git > Branches > Remote Branches > origin/develop > Checkout
4. **ZIP of This Project** - Go to the [GitHub repo for this project](https://github.com/altintech/udacity-bcdev-nanodegree-project-5) and choose to Download ZIP under "Code" dropdown green button
5. **ZIP Extract** - Extract the contents of the ZIP file inside the root folder of your IntelliJ IDEA project
6. **Initial GitHub Commit** - Perform the initial commit by navigating to Git > Commit and provide some comments before committing. Push the commit to GitHub by navigating to Git > Push
7. **Initial Pull Request** - Create Pull request to merge changes from Develop branch to Main branch by navigating to Git > GitHub > Create Pull Request ... Go to GitHub repo, navigate to "Pull Requests" tab and approve the Pull request to bring the changes from develop branch to main branch

### Install Dependencies

This section provides all the information on installing the tooling dependencies necessary complete the project.
NOTE: If you're doing this from a controlled Corporate Mac laptop, it's recommended that you install all the dependencies from the Mac Terminal, and then open IntelliJ IDEA from that Mac terminal window to avoid environment issues.

1. **Terminal Window** - Open Terminal window on your IntelliJ IDEA by navigating to View > Tool Windows > Terminal
2. **Node Version Manager** - Install the latest [Node Version Manager](https://github.com/nvm-sh/nvm) to use it for managing your Node versions. Follow installation script instructions
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
3. **Node.js** - Install the latest STABLE version of Node.js using NVM
```bash
# Install latest stable version of Node.js. Note that v17.0.1 has a breaking change related to OpenSSL, so use the the LTS
nvm install --lts

# List the available Node.js versions
nvm list
        v14.9.0
       v14.18.2
        ...
# If the latest version is not set to be the default, use it explicitly
nvm use v16.16.0
Now using node v16.16.0 (npm v8.11.0)
```
4. **NPM** - Check [NPM](https://www.npmjs.com/) version that came with Node.js installation and update to the latest stable version
```bash
npm --version
8.11.0

npm install -g npm@latest
...

npm --version
8.13.2
```
5. **Truffle** - Install the latest version of [Truffle](https://trufflesuite.com/docs/truffle/) toolset
```bash
npm uninstall -g truffle
...

npm install -g truffle
...

truffle version
Truffle v5.5.21 (core: 5.5.21)
Ganache v7.2.0
Solidity v0.5.16 (solc-js)
Node v16.16.0
Web3.js v1.7.4
```
6. **Truffle Develop network** - Check that Truffle is installed correctly by making sure that you are on the project root directory
```bash
truffle develop
Truffle Develop started at http://127.0.0.1:9545/

Accounts:
(0) 0x5176cfd0522dae0fa1e8a20a69e6d41f40141c93
(1) 0x27dfba33ad22ae9c5effc268dfd9a6d6db87518e
...

truffle(develop)> .exit
```

7. **Truffle Key Dependencies** - Install [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts), Truffle HD Wallet Provider, and Web3 as dependencies to use Truffle for the project
NOTE: Make sure you are on the Project root folder in your Terminal window
```bash
npm install --save @openzeppelin/contracts
...

npm install --save @truffle/hdwallet-provider
...

npm install web3
...
```

8. **Frontend App Cleanup** - Setup a clean Frontend app
```bash
cd app
# Remove the node_modules if present
rm -rf node_modules
# Clean cache
npm cache clean --force
# Remove package files
rm package.json
rm package-lock.json
# Initialize npm (accept all defaults)
npm init
...
```
After a clean "package.json" file is created udner the "app" directory, change it to have the following content included:

```bash
{
...
    "scripts": {
        ...
        "build": "webpack",
        "dev": "webpack-dev-server"
    },
    "devDependencies": {
        "copy-webpack-plugin": "^4.6.0",
        "webpack": "^4.28.1",
        "webpack-cli": "^3.2.1",
        "webpack-dev-server": "^3.1.14"
    },
    "dependencies": {
        ...
        "web3": "^1.7.4"
    },
...
}
```
Now that you've expressed the dependencie on the "package.json" file under the "app" directory, use NPM to install them and run the application
```bash
npm install
...

npm run dev
...

```
Go to http://localhost:8080 to see the Frontend

9. **Metamask** - Install [Metamask](https://metamask.io/) and keep track of the mnemonic phrase if creating a new wallet, or use the mnemonic phrase I have provided for an existing wallet on the truffle-config.js file

### Test Locally
At this point, you'd have installed and set up all the dependencies for the project locally on your machine.
This section has the steps to test everything locally

1. **IntelliJ IDEA** - Open IntelliJ IDEA to the Project you created above
2. **Terminal Window** - Open a Terminal window (View > Tool Windows >  Terminal) on the root folder of the project
3. **Dependencies Check** - Check that you have all the correct dependencies, like below:
```bash
nvm -v
0.39.1

node -v
v16.16.0

npm -v
8.13.2

truffle version
Truffle v5.5.21 (core: 5.5.21)
Ganache v7.2.0
Solidity - 0.8.13 (solc-js)
Node v16.16.0
Web3.js v1.7.4
```
4. **Truffle** - Start Truffle Develop, run Truffle Tests, and deploy (migrate) StarNotary contract to the local Truffle Develop network
```bash
truffle develop
...

compile
...

test
...

migrate --reset
...
```
NOTE 1: For some odd reason, one of the tests always fails with a timeout. The test is 'lets user2 buy a star and decreases its balance in ether'. To solve it, comment out the content of that test from the line that has the first "await" statement, and uncomment each line until the end, running the test each time you uncomment a line.  
NOTE 2: For some other odd reason, sometimes the same test cases fails with "AssertionError: expected 10000000000016384 to equal '10000000000000000'". Just simply rerun the test.

5. **Frontend App** - Open a second Terminal window and Run the Frontend App

The Terminal window you had opened previously where you are running Truffle needs to stay open to keep the Truffle Develop network running

```bash
cd app
npm run dev
...
```
 Go to http://localhost:8080 to see tha the Frontend is up and running. 
 
When you access the Frontend app for the first time, it should bring you to Metamask dialogs to connect to one of the available accounts there.

6. **Metamask Network Setup** - Add Truffle Develop Network to Metamask

Go to your Metamask and follow instructions to add a new network with the following details:
* Network Name: Local Truffle Develop (or some other name you prefer)
* New RPC URL: http://127.0.0.1:9545/
* Chain ID: 1337
* Currency Symbol: ETH

Click "Save".

7. **Metamask Accounts Setup** - Import at least 2 accounts from your local Truffle Develop network

Go to Metamask option to import an account and use the private keys for at least 2 accounts printed on your Terminal window where your Truffle Develop is running.

For example, use:
* Account (0) Private Key: a40165bd1cfedf66606cde0ae2fbec5467730688bbb4becbbfe960ca24b7fdfd
* Account (1) Private Key: bb110c67efd9b69e8a74dd012352005a87ee464696c88074f022e9d85e46d2a1

8. **Metamask Test** - Test a "Send" transaction between the 2 imported account from Truffle Develop network

Use the "Send" button in on account and the "transfer between my accounts" link to transfer a small amount of ETH to the other account.

The transaction will be pending for some amount of seconds, and it should complete. This shows that your local Truffle Develop network is operating properly.

NOTE: Use Reset under Advanced settings for any account in Metamask to reset the transactions history.

9. **Frontend App Connection to Truffle** - Connect Frontend app to one of your local Truffle Develop network accounts

Go to http://localhost:8080 and follow the Metamask extension steps to connect to one of the accounts you imported from your local truffle Develop network

10. **Frontend App Usage** - Use Frontend app to Create Star and Look Up created stars

### Test on Ropsten Testnet
Now that you've tested the Daap and smart contract successfully on your local truffle Develop network, it is time to deploy the contract on Ropsten testnet and use it to support your Dapp functionality

1. **Contracts Deployment** - Migrate the compiled smart contracts to Ropsten

Open a new Terminal window and ensure you're on your project root directory

```bash
truffle migrate --reset --network ropsten
```

2. **Infura** - Get an [Infura](https://infura.io) account if you do not have one, and configure truffle-config.js appropriately

truffle-config.js example

```bash
...
const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonicPhrase = "plug false safe wisdom theme olive west inject vehicle south vessel huge";
const infuraKey = "2f45687235e14ab68b9c16ba1c49cf32";
...
module.exports = {
...
  networks: {
    ...
        ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonicPhrase, "https://ropsten.infura.io/v3/" + infuraKey)
      },
      network_id: 3
    }
    ...
  }
  ...
}
```

3. **Blockchain Explorer** - See the StarNotary contract interactions at [Ropsten Explorer](https://ropsten.etherscan.io/)

For example, the contract that I deployed is located here: https://ropsten.etherscan.io/address/0xa83506702ee56282bd05c041e01b44ac6e54f960

### Final GitHub Task

Once you're comfortable with all your changes, get them to your GitHub account

1. **Final Commit and Push** -  Git > Commit, add your comments and the "Commit and Push"
2. **Pull Request* - Git > GitHub > Create Pull Request... to merge your changes from Develop to Main. Approve the Pull Request.

Enjoy It!
