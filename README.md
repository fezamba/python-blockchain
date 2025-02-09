# Zambacoin - Python Blockchain

Zambacoin is a simple blockchain implementation using Python and Flask. This project allows mining new blocks, handling transactions, and maintaining a distributed ledger with a consensus protocol.

## 🚀 Features
- Blockchain creation and validation
- Proof-of-work mining
- Transaction management
- Decentralized node registration
- Consensus algorithm for chain synchronization

## 📦 Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/fezamba/python-blockchain.git
   ```
2. Navigate to the project directory:
   ```sh
   cd python-blockchain
   ```
3. Install dependencies:
   ```sh
   pip install flask requests
   ```

## 🏃 Running the Blockchain

Start the Flask server:
```sh
python zambacoin.py
```
The blockchain will be accessible at `http://127.0.0.1:5000/`.

### Running Multiple Nodes Locally
To create multiple nodes locally, you need to change the port when running the server. Example:
```sh
python zambacoin.py -p 5001
python zambacoin.py -p 5002
python zambacoin.py -p 5003
```
This will start three nodes running on ports 5001, 5002, and 5003.

## 📡 API Endpoints

### ⛏️ Mine a Block
- **Endpoint:** `/mine_block`
- **Method:** `GET`
- **Description:** Mines a new block and rewards the miner.

### 🔗 Get the Blockchain
- **Endpoint:** `/get_chain`
- **Method:** `GET`
- **Description:** Retrieves the entire blockchain.

### ✅ Check Chain Validity
- **Endpoint:** `/is_valid`
- **Method:** `GET`
- **Description:** Validates the blockchain integrity.

### 💸 Add a Transaction
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

### 🌍 Connect a Node
- **Endpoint:** `/connect_node`
- **Method:** `POST`
- **Payload:**
  ```json
  {
    "nodes": ["http://127.0.0.1:5001"]
  }
  ```
- **Description:** Registers a new node in the network.

### 🔄 Replace the Chain
- **Endpoint:** `/replace_chain`
- **Method:** `GET`
- **Description:** Replaces the current chain with the longest valid chain from the network.

## 🤝 Contributing
Feel free to fork this project and submit pull requests! 🚀

**Fernando Azambuja**  
[LinkedIn](https://www.linkedin.com/in/feazambuja)
