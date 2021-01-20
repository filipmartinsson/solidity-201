pragma solidity 0.8.0;

contract mappedWithUnorderedIndexAndDelete {

  struct EntityStruct {
    uint entityData;
    //more data
    uint listPointer; //0
  }

  mapping(address => EntityStruct) public entityStructs;
  address[] public entityList;

  function isEntity(address entityAddress) public view returns(bool isIndeed) {
    if(entityList.length == 0) return false;
    return (entityList[entityStructs[entityAddress].listPointer] == entityAddress);
  }

  function getEntityCount() public view returns(uint entityCount) {
    return entityList.length;
  }

  function newEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(isEntity(entityAddress)) revert();
    entityStructs[entityAddress].entityData = entityData;
    entityList.push(entityAddress);
    entityStructs[entityAddress].listPointer = entityList.length - 1;
    return true;
  }

  function updateEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(!isEntity(entityAddress)) revert();
    entityStructs[entityAddress].entityData = entityData;
    return true;
  }
  
  //[ADRESS1, ADDRESS4, ADDRESS3]

  function deleteEntity(address entityAddress) public returns(bool success) {
    if(!isEntity(entityAddress)) revert();
    uint rowToDelete = entityStructs[entityAddress].listPointer; // = 1
    address keyToMove   = entityList[entityList.length-1]; //save address4
    entityList[rowToDelete] = keyToMove;
    entityStructs[keyToMove].listPointer = rowToDelete; //= 2
    entityList.pop();
    delete entityStructs[entityAddress];
    return true;
  }

}