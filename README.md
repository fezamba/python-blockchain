## Blockchain in Python with Flask  

This project implements a simple blockchain using Python and Flask, with REST endpoints for block mining and chain querying.  

### Features  

- Block mining using the Proof of Work (PoW) algorithm.  
- Secure hash generation with SHA-256.  
- REST API with endpoints for mining and querying the blockchain.  
- Validation of the blockchain's integrity.  

### Technologies Used  

- Python 3.12  
- Flask (Framework for building REST APIs)  
- Postman (for API testing)  

### Installation  

1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/python-blockchain.git
   cd python-blockchain
   ```

2. Install dependencies:  
   ```bash
   pip install flask
   ```

### How to Run  

1. Start the Flask server:  
   ```bash
   python blockchain.py
   ```

2. Access the endpoints:  
   - Mine a block: [http://127.0.0.1:5000/mine_block](http://127.0.0.1:5000/mine_block)  
   - View the blockchain: [http://127.0.0.1:5000/get_chain](http://127.0.0.1:5000/get_chain)  
   - Verify the blockchain: [http://127.0.0.1:5000/is_valid](http://127.0.0.1:5000/is_valid)  

### Available Endpoints  

- `GET /mine_block`: Mines a new block and adds it to the blockchain.  
- `GET /get_chain`: Returns the entire blockchain.  
- `GET /is_valid`: Checks if the blockchain is valid.  

### Future Improvements  

- Create a cryptocurrency using Smart Contracts.  
- Implement real transactions between users.  
- Integrate a distributed consensus system.  
- Develop a web interface for blockchain interaction.  

**Fernando Azambuja**  
[LinkedIn](https://www.linkedin.com/in/feazambuja)
