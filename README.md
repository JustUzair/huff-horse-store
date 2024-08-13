## Docs

- Refer to EVM opcodes here : [evm.codes](https://www.evm.codes/)

## Code Docs & Explanation for [HorseStore-V1](./src/Horse-Store-V1/HorseStore.sol)

```javascript
pragma solidity 0.8.20;

contract HorseStore {
    uint256 numberOfHorses;

    function updateHorseNumber(uint256 newNumberOfHorses) external {
        numberOfHorses = newNumberOfHorses;
    }

    function readNumberOfHorses() external view returns (uint256) {
        return numberOfHorses;
    }
}
```

- The above is the simple code in solidity we aim to convert to low level code using huff

### Compiling Huff

```javascript
huffc src/Horse-Store-V1/HorseStore.huff
```

- Add `-b` flag to take a look at the bytecode

```javascript
$ huffc src/Horse-Store-V1/HorseStore.huff -b
⠙ Compiling...
60008060093d393df3
```

### Function Selector

- The function selector is 4-byte signature of a function

```javascript
$ cast sig "updateHorseNumber(uint256)"
0xcdfead2e
```

- The above `cast` command can be re-written as follows in solidity.

```javascript
$ chisel
Welcome to Chisel! Type `!help` to show available commands.
➜ abi.encodePacked("updateHorseNumber(uint256)")
Type: dynamic bytes
├ Hex (Memory):
├─ Length ([0x00:0x20]): 0x000000000000000000000000000000000000000000000000000000000000001a
├─ Contents ([0x20:..]): 0x757064617465486f7273654e756d6265722875696e7432353629000000000000
├ Hex (Tuple Encoded):
├─ Pointer ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000020
├─ Length ([0x20:0x40]): 0x000000000000000000000000000000000000000000000000000000000000001a
└─ Contents ([0x40:..]): 0x757064617465486f7273654e756d6265722875696e7432353629000000000000
➜ keccak256(abi.encodePacked("updateHorseNumber(uint256)"))
Type: bytes32
└ Data: 0xcdfead2ea1108e2f55c76e0e628baabf45e443d3ee20ba4b95fb0ee1cdb1a69a
➜ bytes4 selector = bytes4(bytes32(0xcdfead2ea1108e2f55c76e0e628baabf45e443d3ee20ba4b95fb0ee1cdb1a69a))
➜ selector
Type: bytes4
└ Data: 0xcdfead2e00000000000000000000000000000000000000000000000000000000
```

- As you can see we get `0xcdfead2e00000000000000000000000000000000000000000000000000000000`, the `first 4-bytes` represent the function selector and the rest are marked as 0

- Similarly for `readNumberOfHorses()` we get

```javascript
$ cast sig "readNumberOfHorses()"
0xe026c017
```

## Opcodes & Assembly

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
