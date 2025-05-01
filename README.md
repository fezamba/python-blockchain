# 🪙 Zambacoin – Educational Blockchain in Python

Zambacoin is a minimal blockchain prototype developed in Python and Flask, designed for learning purposes. It simulates a decentralized network with multiple nodes, mining, transactions, and chain synchronization.

---

## 📁 Project Structure

```
zambacoin/
├── core/
│   └── blockchain.py        # Blockchain logic and data structures
├── api/
│   └── routes.py            # Flask API routes
├── run.py                   # Entry point to run the node (port can be passed as argument)
├── requirements.txt         # Python dependencies
└── README.md
```

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/zambacoin.git
cd zambacoin
```

### 2. Install dependencies

```bash
pip install -r requirements.txt
```

### 3. Run multiple nodes locally

Use different terminals:

```bash
python run.py 5001
python run.py 5002
python run.py 5003
```

---

## 📡 API Endpoints

| Method | Endpoint              | Description                                                                 |
|--------|-----------------------|-----------------------------------------------------------------------------|
| GET    | `/mine_block`         | Mines a new block with the current transaction pool                         |
| GET    | `/get_chain`          | Returns the full blockchain and its length                                  |
| GET    | `/is_valid`           | Validates the entire blockchain (proof and hash checks)                     |
| POST   | `/add_transaction`    | Adds a new transaction to the pool (JSON: sender, receiver, amount)         |
| POST   | `/connect_node`       | Registers a list of peer nodes (JSON: nodes as URLs)                        |
| GET    | `/replace_chain`      | Checks if a longer valid chain exists and replaces the current one          |

---

## 📦 Sample JSON Payloads

### POST `/add_transaction`

```json
{
  "sender": "Alice",
  "receiver": "Bob",
  "amount": 50
}
```

### POST `/connect_node`

```json
{
  "nodes": [
    "http://127.0.0.1:5002",
    "http://127.0.0.1:5003"
  ]
}
```

---

## 🔁 Node Synchronization

To ensure all nodes share the same blockchain:
1. Run `/connect_node` from one node.
2. Then trigger `/replace_chain` on other nodes to sync to the longest valid chain.

---

## 🧠 Future Ideas (with feasibility)

| Idea                                           | Feasibility | Notes                                                                 |
|------------------------------------------------|-------------|-----------------------------------------------------------------------|
| ECDSA Digital Signatures                       | ✅ Easy      | Add sender key pair generation and signature verification logic       |
| Persistent storage (SQLite / JSON DB)          | ✅ Easy      | Replace memory-based lists with DB-backed models                      |
| Flask Blueprints (modular routing)             | ✅ Easy      | Separate endpoints by domain (e.g., mining, network)                  |
| Web dashboard (JS/HTML or React)               | ✅ Easy      | Create a front-end to visualize blocks, peers, and stats              |
| Smart contract execution (Solidity + Web3)     | ⚠️ Moderate  | Requires connection to a testnet or local Ethereum node (e.g., Ganache) |
| Integration with MetaMask / Web3.js frontend   | ⚠️ Moderate  | Needs Web3 architecture and real blockchain backend                   |

---

## 🛡 License

This project is released under the MIT License.

---

## 🤝 Contributing

Pull requests and issue reports are welcome. Let's improve it together!

## 📡 API Endpoints

| Method | Endpoint           | Purpose                                               | Example Usage                    |
|--------|--------------------|-------------------------------------------------------|----------------------------------|
| GET    | `/mine_block`      | Mines a new block using Proof of Work                | `curl http://localhost:5001/mine_block` |
| GET    | `/get_chain`       | Retrieves the full blockchain                        | `curl http://localhost:5001/get_chain`  |
| GET    | `/is_valid`        | Validates the current blockchain                     | `curl http://localhost:5001/is_valid`   |
| POST   | `/add_transaction` | Adds a new transaction to the pool                   | JSON: `sender`, `receiver`, `amount`   |
| POST   | `/connect_node`    | Registers peer nodes                                 | JSON: `nodes: [<url1>, <url2>]`         |
| GET    | `/replace_chain`   | Synchronizes with the longest valid chain in the network | `curl http://localhost:5002/replace_chain` |

## 🧠 Future Ideas (Detailed Roadmap)

Below are advanced features that can be implemented in future versions of Zambacoin, along with technical notes and integration strategies.

---

### 1. ✅ ECDSA Digital Signatures

**Goal**: Ensure that only legitimate users can sign transactions.

**How to implement**:
- Use Python's `ecdsa` or `cryptography` library to generate public/private key pairs.
- Each transaction must be signed by the sender using their private key.
- Add signature verification to `add_transaction` using the sender's public key.

**Bonus**: Store public keys in a registry to validate ownership of addresses.

---

### 2. ✅ Persistent Storage (SQLite or JSON DB)

**Goal**: Retain blockchain data between restarts.

**How to implement**:
- Replace in-memory structures (`self.chain`, `self.transactions`) with a database.
- Use `SQLAlchemy` for SQL databases (e.g., SQLite or PostgreSQL) or `TinyDB`/`jsondb` for file-based persistence.
- On startup, load chain and transaction pool from the DB.

**Bonus**: Use a migration tool like `Alembic` if choosing SQLAlchemy.

---

### 3. ✅ Flask Blueprints

**Goal**: Improve code maintainability and scalability.

**How to implement**:
- Split `routes.py` into multiple files (e.g., `mining.py`, `network.py`, `transactions.py`).
- Register each blueprint in `run.py` using `app.register_blueprint()`.

**Bonus**: Add route versioning (`/api/v1/`).

---

### 4. ✅ Web Dashboard

**Goal**: Provide a UI for real-time blockchain monitoring.

**How to implement**:
- Build a frontend using HTML/JS (or React.js) and call API endpoints via AJAX or Fetch.
- Display chain length, block contents, peers, and transaction pool.

**Bonus**: Add auto-refresh or WebSocket support.

---

### 5. ⚠️ Smart Contract Execution (Solidity + Web3)

**Goal**: Run smart contracts using a real Ethereum VM.

**How to implement**:
- Use `Ganache` or `Hardhat` to simulate a local Ethereum blockchain.
- Write contracts in Solidity and deploy them using `web3.py`.
- Integrate contract execution logic via Flask routes.

**Bonus**: Validate contract events inside your blockchain simulator.

---

### 6. ⚠️ Integration with MetaMask / Web3 Frontend

**Goal**: Allow interaction with your blockchain via MetaMask.

**How to implement**:
- Expose compatible endpoints for `web3.js` in the frontend.
- Deploy your blockchain simulation as a backend proxy to Ethereum.
- Let users sign transactions using MetaMask and send them to your API.

**Bonus**: Sync your simulated chain state with a real chain (e.g., Sepolia Testnet).