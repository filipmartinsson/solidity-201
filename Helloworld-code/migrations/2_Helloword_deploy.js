const Helloworld = artifacts.require("Helloworld");

module.exports = function(deployer) {
  deployer.deploy(Helloworld);
};
