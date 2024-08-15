// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// import {Test} from "forge-std/Test.sol";
import {Base_TestV1,IHorseStore} from "./Base_TestV1.t.sol";
import {HorseStoreYul} from "../../src/Horse-Store-V1/HorseStoreYul.sol";
contract HorseStoreYulTest is Base_TestV1 {
    function setUp() public override{
        horseStore = IHorseStore(new HorseStoreYul());
    }
}
