pragma solidity >= 0.5.0 < 0.6.0;

import "github.com/provable-things/ethereum-api/provableAPI.sol";

contract RandomExample is usingProvable {

    uint256 constant MAX_INT_FROM_BYTE = 256;
    uint256 constant NUM_RANDOM_BYTES_REQUESTED = 1;
    uint256 public latestNumber;

    constructor()
        public
    {
        update();
    }

    function __callback(bytes32 _queryId,string memory _result,bytes memory _proof) public {
        require(msg.sender == provable_cbAddress());

        uint256 randomNumber = uint256(keccak256(abi.encodePacked(_result))) % 100;
        latestNumber = randomNumber;
    }

    function update()
        payable
        public
    {
        uint256 QUERY_EXECUTION_DELAY = 0;
        uint256 GAS_FOR_CALLBACK = 200000;
        provable_newRandomDSQuery(
            QUERY_EXECUTION_DELAY,
            NUM_RANDOM_BYTES_REQUESTED,
            GAS_FOR_CALLBACK
        );
    }
}
