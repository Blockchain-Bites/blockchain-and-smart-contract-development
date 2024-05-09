// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    // dd62ed3e - allowance(address,address)
    // 095ea7b3 - approve(address,uint256)
    // 70a08231 - balanceOf(address)
    // 18160ddd - totalSupply()
    // a9059cbb - transfer(address,uint256)
    // 23b872dd - transferFrom(address,address,uint256
    // ------------------------------------------------- XOR
    // 36372b07
}

interface IVoting {
    function vote() external returns (bool);

    function getCount() external view;
}

contract SimpleToken is IERC20, IVoting {
    function getInterfaceID() external pure returns (bytes4) {
        bytes4 interfaceId = type(IERC20).interfaceId;

        return interfaceId;
    }

    function implementsInterface(bytes4 _id) public pure returns (bool) {
        return
            type(IERC20).interfaceId == _id || type(IVoting).interfaceId == _id;
    }

    // Methods from the Interfaces
    function totalSupply() external view returns (uint256) {}

    function balanceOf(address account) external view returns (uint256) {}

    function transfer(address to, uint256 value) external returns (bool) {}

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256) {}

    function approve(address spender, uint256 value) external returns (bool) {}

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool) {}

    function vote() external returns (bool) {}

    function getCount() external view {}
}
