//SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //sol version

contract SimpleStorage {
    uint256 favouriteNumber;
    uint256[] listOfFavNumbers;
    Person[] peopleList;
    mapping(string => uint256) public nameToNumber;
    struct Person {
        uint256 number;
        string name;
    }

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
        listOfFavNumbers.push(favouriteNumber);
    }
    function storePerson(
        uint256 _favouriteNumber,
        string calldata name
    ) public {
        peopleList.push(Person(_favouriteNumber, name));
        nameToNumber[name] = _favouriteNumber;
    }

    function retreiveFavNumber() public view returns (uint256) {
        return favouriteNumber;
    }

    function retreiveFavNumberAtIndex(
        uint256 index
    ) public view returns (uint256) {
        if (index > listOfFavNumbers.length) {
            return 0;
        }
        return listOfFavNumbers[index];
    }
    function retreivePersonAtIndex(
        uint256 index
    ) public view returns (Person memory) {
        // if (index>listOfFavNumbers.length) {
        //     return  0;
        // }
        return peopleList[index];
    }

    function retreivePersonFromName(
        string calldata name
    ) public view returns (uint256) {
        // if (index>listOfFavNumbers.length) {
        //     return  0;
        // }
        return nameToNumber[name];
    }
}
