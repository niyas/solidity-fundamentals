//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    enum Statuses {Occupied, Vacant}
    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Rooms are fully Booked");
        _;
    }

    modifier cost(uint _amount)
    {
        require(msg.value >= _amount, "Balance Low or Insufficient Balance");
        _;
    }
    
    function book() payable public onlyWhileVacant cost(2 ether){
        
        currentStatus = Statuses.Occupied;
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);
        //owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }

    function cancelBooking() public {
        currentStatus = Statuses.Vacant;
    }

}