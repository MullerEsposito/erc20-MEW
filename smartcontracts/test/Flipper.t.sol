//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { BaseSetup } from "./BaseSetup.t.sol";
import { Flipper } from "../src/Flipper.sol";

contract FlipperTest is BaseSetup {
 Flipper flipper;

  function setUp() public override {
    BaseSetup.setUp();

    flipper = new Flipper();
  }
 
  function testInitialState() public {
    bool init;

  }
}