pragma solidity 0.5.12;

contract Helloworld {
  string message = "Hello World!";

  function getMessage() public view returns (string memory) {
    return message;
  }
  function setMessage(string memory newMessage) public {
    message = newMessage;
  }
}
