pragma solidity ^0.4.7;
import "./Product.sol";



contract Order is Item{

   
    ProductInShipment[] private productsList;
    uint public creationTime; 
    struct ProductInShipment
    {
        Product product;
        uint quantity;
    }
    constructor(uint _id, bytes32 _name,uint _creationTime, int _lon, int _lat, address
     _DATABASE_CONTRACT, address _Order_FACTORY) public
    {
        id = _id;
        name = _name;
        creationTime = _creationTime;
        DATABASE_CONTRACT = _DATABASE_CONTRACT;
        ITEM_FACTORY = _Order_FACTORY;

        addAction("Order creation", _lon, _lat, _creationTime);
        Database database = Database(DATABASE_CONTRACT);
        database.storeItemReference(this);
    }

    function AddProduct(Product _toAdd, uint _quantity) public
    {
        ProductInShipment memory toAdd = ProductInShipment(_toAdd, _quantity);
        productsList.push(toAdd);
    }




}
contract OrderFactory {

      /////////////////
     // Constructor //
    /////////////////

    /* @notice Constructor to create a Order Factory */
    constructor() public {}

    function () public {
        // If anyone wants to send Ether to this contract, the transaction gets rejected
        revert();
    }

    /* @notice Function to create a Order
       @param _id The id of the Order
       @param _name The name of the Order
       @param _description about the Order,
              generally as a JSON object.
       @param _timeStamp the UNIXTIME of creation */
    function createOrder( 
        uint _id, bytes32 _name, uint _creationTime, 
        int _lon, int _lat, address DATABASE_CONTRACT) public returns(address) {
        return new Order(_id, _name, _creationTime, _lon, _lat, DATABASE_CONTRACT, this);
    }
}