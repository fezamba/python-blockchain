# Zambacoin – Learning Blockchain with Python

Zambacoin is a personal learning project I built to understand how blockchains work under the hood.  
It's written in Python using Flask and simulates core concepts like Proof of Work mining, transactions, basic consensus, and multi-node synchronization — all in a simple, readable structure.

This isn't production-ready — it's just me exploring how to actually build a blockchain from scratch, step by step.

---

## Project Structure

```
python-blockchain/
├── core/                  # Blockchain logic
│   └── blockchain.py
├── api/                   # REST API with Flask
│   └── routes.py
├── run.py                 # Main entrypoint (port passed as CLI arg)
├── requirements.txt
└── README.md
```

---

## 🚀 How to Run

1. Install dependencies:
```bash
pip install -r requirements.txt
```

2. Launch multiple nodes:
```bash
python run.py 5001
python run.py 5002
python run.py 5003
```

3. Use `/connect_node` and `/replace_chain` to sync them.

---

## 📡 Endpoints Overview

| Method | Endpoint           | What it does                                               |
|--------|--------------------|-------------------------------------------------------------|
| GET    | `/mine_block`      | Mines a block with PoW                                     |
| GET    | `/get_chain`       | Returns the full chain                                     |
| GET    | `/is_valid`        | Validates the chain                                        |
| POST   | `/add_transaction` | Adds a new transaction (JSON: sender, receiver, amount)     |
| POST   | `/connect_node`    | Connects other nodes (JSON: list of node URLs)              |
| GET    | `/replace_chain`   | Syncs with the longest valid chain among connected nodes    |

---

## 📦 Sample Payloads

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

## 🔁 Node Sync Tip

To sync multiple nodes:
1. Run `/connect_node` from one of them
2. Call `/replace_chain` on the others to update to the longest valid chain

---

## 📄 License

MIT — use this code for learning, remixing, or building your own version.
