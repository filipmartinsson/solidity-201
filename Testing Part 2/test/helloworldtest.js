const Helloworld = artifacts.require("Helloworld");

contract("Helloworld", async function(){
  it("should initialize correctly", async function(){
    let instance = await Helloworld.deployed();
    let message = await instance.getMessage();
    assert(message === "Hello Again!"
    , "Message should be Hello Again!");
  });
  it("should set the message correctly", async function(){
    let instance = await Helloworld.deployed();
    await instance.setMessage("Testing Message");
    let message = await instance.getMessage();
    assert(message === "Testing Message"
    , "Message should be the same as we set it to");
  });
});
