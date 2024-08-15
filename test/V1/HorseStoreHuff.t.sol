// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// import {Test} from "forge-std/Test.sol";
import {Base_TestV1, HorseStore} from "./Base_TestV1.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {HuffConfig} from "foundry-huff/HuffConfig.sol";

// import "../../src/Horse-Store-V1/HorseStore.huff";

contract HorseStoreHuff is Base_TestV1 {
    // HUffDeployer, checks src folder by default, also doesn't need .huff extension
    string constant HORSE_STORE_HUFF_FILE = "Horse-Store-V1/HorseStore";

    function setUp() public override {
        horseStore = HorseStore(HuffDeployer.config().deploy(HORSE_STORE_HUFF_FILE));
    }
}
