//  SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
import  "./simple storage.sol";

contract StorageFactory is simple storage{
SimpleStorage[]public simpleStorageArray;
function createSimpleStorageContract()public{
    SimpleStorage simpleStorage = new SimpleStorage();
    simplestorageArray.push(simpleStorage)
}
function sfStore(uint256 _simpleStorageindex ,uint256 _simpleStorageNumber)public{
    //adress 
    //ABI
  SimpleStorage(address(simpleStorageArray[_simpleStorageindex])).store(_simpleStorageNumber);

}
function sfGet(uint256 _simpleStorageindex)public view returns {
    return SimpleStorage(address(simpleStorageArray[_simpleStorageindex])).retrieve;
    
}
}