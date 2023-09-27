const Blockchain = artifacts.require("SimpleBlockchain");

module.exports = function(deployer) {
  deployer.deploy(Blockchain, 10); // Deploying the contract with 10 blocks
};
