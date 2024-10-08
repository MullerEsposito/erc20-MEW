// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script, console2} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";
import {MyToken} from "../src/MyToken.sol";

contract Local is Script {
    // Counter counter;
    MyToken myToken;

    function setUp() public {}

    // function run() public {
    //     vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

    //     counter = new Counter();
    //     console2.log("Counter address: ", address(counter));

    //     vm.stopBroadcast();
    // }

    function run() public {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        myToken = new MyToken(1000000);
        console2.log("MyToken address: ", address(myToken));

        vm.stopBroadcast();
    }
}
