pragma solidity ^0.4.7;

import "./Owned.sol";

/*
  Copyright 2017, David Riudor

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/* @title Database Contract
  @author David Riudor
  @dev This contract represents the database to store all handlers and products of the
  TODO put name of platform ** platform.  */

contract Database is Owned {
  // @dev addresses of the items referenced in this database
    address[] public items;
    string public name;
  // @dev struct which represents a Handler for the products stored in the database.
    struct Handler {
    // @dev indicates the name of a Handler.
        string _name;
        // @dev Additional information about the Handler, generally as a JSON object
        string _additionalInformation;
    }

    // @dev Relates an address with a Handler record.
    mapping(address => Handler) public addressToHandler;

    /* @notice Constructor to create a Database */
    constructor( string _name) public {
        name = _name;
    }

    function () public{
        // If anyone wants to send Ether to this contract, the transaction gets rejected
        revert();
    }

    /* @notice Function to add a Handler reference
        @param _address address of the handler
        @param _name The name of the Handler
        @param _additionalInformation Additional information about the Product,
                generally as a JSON object. */
    function addHandler(address _address, string _name, string _additionalInformation) public onlyOwner {
        Handler memory handler;
        handler._name = _name;
        handler._additionalInformation = _additionalInformation;

        addressToHandler[_address] = handler;
    }

    /* @notice Function to add an item reference
        @param itemAddress address of the item */
    function storeItemReference(address itemAddress) public {
        items.push(itemAddress);
    }

}
