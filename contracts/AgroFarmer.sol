contract AgroFarmer {
    uint256 public s = 1;
    mapping(address => uint256) balances;
    mapping(string => farmer) f1;
    farmer[] public farmers;

    struct farmer {
        string farmerId;
        string farmerName;
        string location;
        string cropType;
        uint256 phoneNumber;
        uint256 cropQuantity;
        uint256 price;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function send(address payable add) public payable {
        require(add.send(msg.value), "no funds");
    }

    function receive() external payable {}

    function createFarmer(
        string memory id,
        string memory name,
        string memory location,
        string memory crop,
        uint256 phone,
        uint256 quantity,
        uint256 price
    ) public {
        AgroFarmer.farmer memory newFarmer = farmer(
            id,
            name,
            location,
            crop,
            phone,
            quantity,
            price
        );
        f1[id] = newFarmer;
        farmers.push(newFarmer);
        s++;
    }

    function getFarmer(string memory j)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            uint256,
            uint256,
            uint256
        )
    {
        return (
            f1[j].farmerId,
            f1[j].farmerName,
            f1[j].location,
            f1[j].cropType,
            f1[j].phoneNumber,
            f1[j].cropQuantity,
            f1[j].price
        );
    }
}
