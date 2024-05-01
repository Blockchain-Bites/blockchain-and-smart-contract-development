// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract DoubleMapping {
    /**
            Creating a MATRIX in Solidity

            Country  |                     Wallets (Address)                          
            ----------------------------------------------------------------------
            (String) |    0x0001    |    0x0002    |    0x0003    |    0x0004    |    ...    
            Sweden   |     Rick     |     Ana      |    Steve     |    Mike      |    ...    
            Colombia |    Ricardo   |     Ana      |    Steven    |    Miguel    |    ...    
               ...          ...           ...             ...            ...
            ----------------------------------------------------------------------
                                            Names (String)

        "A matrix could be created by using TWO KEYS and a VALUE"

        Inner mapping - points a wallet to a string: mapping(wallet => name)
        Outer mapping - points a country to a wallet: mapping(country => wallet)


        |               outer mapping           |
                          |    inner mapping    |
        mapping(string => mapping(address => string)) matrixCountryWalletName;
    */
    mapping(string country => mapping(address wallet => string name)) matrixCountryWalletName;

    function saveInMatrix(
        string memory _country,
        address _wallet,
        string memory _name
    ) public {
        matrixCountryWalletName[_country][_wallet] = _name;
    }

    function readFromMatrix(
        string memory _country,
        address _wallet
    ) public view returns (string memory) {
        return matrixCountryWalletName[_country][_wallet];
    }

    function deleteInMatrix(string memory _country, address _wallet) public {
        delete matrixCountryWalletName[_country][_wallet];
    }
}
