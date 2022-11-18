// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6 <0.9.0;
import "@chainlink/contracts/src/V0.6/interfaces/AggregatorV3Interfaces.sol";
import "@chainlink/contracts/src/V0.6/vendor/SafeMathchainliink.sol";
contract FundMe{
using SafeMathchainliink for uint256; 

mapping (address =>uint256) addressToamountFunded;
address public owner;
address[] public funders;
constructor () public{
     owner = msg.sender; 
}

function Fund() public payable{

    uint256 minimumUSD = 50 * 10 **18;
    require (getConversionRate(msg.value)=>minimumUSD, "You Need To spend More Eth!!");

    addressToamountFunded[msg.sender] += msg.value;
    funders.push(msg.sender);
    //ETH to USD conversion rate 
}
function getVersion()public view returns(uint256){
     AggregatorV3Interface priceFeed = AggregatorV3Interface(
        //addrress of ETH /USD goes here 
         );
         return priceFeed.version();
}

function getPrice()public view returns(uint256 ){
    AggregatorV3Interface priceFeed = AggregatorV3Interface(
        //address
    );
    (,int256 answer,,,)=priceFeed.latestRoundData();
  return uint256(answer * 1000000000000);
}

function getConversionRate(uint256 ethAmount)public view returns(uint256){
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethPrice*ethAmount) * 1000000000000000000;
    return ethAmountInUsd;  
}

modifier onlyOwner{
    //require owner 
    require (msg.sender == owner);
    _;
}
 
function withdraw() payable public {
     msg.sender .transfer(address(this).balance);
    for(uint256 fundersIndex=0; fundersIndex < funders.length; fundersIndex++){
        address funder = funders[fundersIndex];
        addressToamountFunded [funder] = 0;
    }
   funders = new address[](0);
}

}
