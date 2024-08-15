// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {HorseStore} from "../../src/Horse-Store-V1/HorseStore.sol";
import {IHorseStore} from "../../src/Horse-Store-V1/IHorseStore.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore horseStore;

    function setUp() public virtual {
        horseStore = IHorseStore(new HorseStore());
    }

    function test_readValue() public view {
        uint256 initValue = horseStore.readNumberOfHorses();
        assert(initValue == 0);
    }

    function test_writeValue( uint numberOfHorses) public {

        horseStore.updateHorseNumber(numberOfHorses);
        assert(horseStore.readNumberOfHorses() == numberOfHorses);
    }
}
