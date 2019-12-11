const Helloworld = artifacts.require("Helloworld");

module.exports = function(deployer) {
  deployer.deploy(Helloworld).then(function(instance){
      instance.setMessage("Hello Again!").then(function(){
        instance.getMessage().then(function(message){
          console.log("Current message: " + message);
        });
      });
  });
};
