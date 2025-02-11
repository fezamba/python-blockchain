# Zambacoin - Python Blockchain

Zambacoin is a simple blockchain implementation using Python and Flask. This project allows mining new blocks, handling transactions, and maintaining a distributed ledger with a consensus protocol.

## Features
- Blockchain creation and validation
- Proof-of-work mining
- Transaction management
- Decentralized node registration
- Consensus algorithm for chain synchronization

## To-Do
- Develop(ing) a prototype of an ICO using Solidity to develop the smart contract for this ICO

### Running Multiple Nodes Locally
To create multiple nodes locally, you need to change the port when running the server. Example in files:
```sh
zambacoin_node_5001.py
zambacoin_node_5002.py
zambacoin_node_5003.py
```

## API Endpoints

### Mine a Block
- **Endpoint:** `/mine_block`
- **Method:** `GET`
- **Description:** Mines a new block and rewards the miner.

### Get the Blockchain
- **Endpoint:** `/get_chain`
- **Method:** `GET`
- **Description:** Retrieves the entire blockchain.

### Check Chain Validity
- **Endpoint:** `/is_valid`
- **Method:** `GET`
- **Description:** Validates the blockchain integrity.

### Add a Transaction
- **Endpoint:** `/add_transaction`
- **Method:** `POST`
- **Payload:**
  ```json
  {
    "sender": "Alice",
    "receiver": "Bob",
    "amount": 10
  }
  ```
- **Description:** Adds a new transaction to the next block.

### Connect a Node
- **Endpoint:** `/connect_node`
- **Method:** `POST`
- **Payload:**
  ```json
  {
    "nodes": ["http://127.0.0.1:5001"]
  }
  ```
- **Description:** Registers a new node in the network.

### Replace the Chain
- **Endpoint:** `/replace_chain`
- **Method:** `GET`
- **Description:** Replaces the current chain with the longest valid chain from the network.

## Contributing
Feel free to fork this project and submit pull requests!

**Fernando Azambuja**  
[LinkedIn](https://www.linkedin.com/in/feazambuja)
