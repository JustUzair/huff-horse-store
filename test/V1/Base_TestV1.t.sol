// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {HorseStore} from "../../src/Horse-Store-V1/HorseStore.sol";

abstract contract Base_TestV1 is Test {
    HorseStore horseStore;

    function setUp() public virtual {
        horseStore = new HorseStore();
    }

    function test_readValue() public view {
        uint256 initValue = horseStore.readNumberOfHorses();
        assert(initValue == 0);
    }
}
