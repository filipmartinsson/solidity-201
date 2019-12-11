const Helloworld = artifacts.require("Helloworld");

contract("Helloworld", async function(){
  it("should initialize correctly", async function(){
    let instance = await Helloworld.deployed();
    let message = await instance.getMessage();
    assert(message === "Hello Again!"
    , "Message should be Hello Again!");
  });
});
