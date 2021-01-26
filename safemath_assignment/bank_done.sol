pragma solidity 0.8.0;
pragma abicoder v2;
import "./Ownable.sol";
import "./SafeMath.sol";

contract Bank is Ownable {
    
    using SafeMath for uint;
    
    mapping(address => uint) balance;
    address[] customers;
    
    event depositDone(uint amount, address indexed depositedTo);
    
    function deposit() public payable returns (uint)  {
        balance[msg.sender] = balance[msg.sender].add(msg.value);
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }
    
    function withdraw(uint amount) public onlyOwner returns (uint){
        require(balance[msg.sender] >= amount);
        balance[msg.sender] = balance[msg.sender].sub(amount);
        payable(msg.sender).transfer(amount);
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    function transfer(address payable recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer money to yourself");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
        assert(balance[msg.sender] == previousSenderBalance - amount);
    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] = balance[from].sub(amount);
        balance[to] = balance[to].add(amount);
    }
    
}