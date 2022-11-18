// SPDX-License-Identifier: MIT 
pragma solidity 0.6.6 =< 0.9.0;
import ""

contract Overflow 
{
    function Overflow ()public view returns(uint8){
        uint8 big =  255 + uint8(1);
        return big;

    }
}