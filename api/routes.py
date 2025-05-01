from flask import Flask, jsonify, request
from uuid import uuid4
from core.blockchain import Blockchain

app = Flask(__name__)
node_address = str(uuid4()).replace('-', '')
blockchain = Blockchain()

@app.route('/mine_block', methods=['GET'])
def mine_block():
    previous_block = blockchain.get_previous_block()
    proof = blockchain.proof_of_work(previous_block['proof'])
    previous_hash = blockchain.hash(previous_block)
    blockchain.add_transaction(sender=node_address, receiver='Fernando', amount=1)
    block = blockchain.create_block(proof, previous_hash)
    response = {
        'message': 'Congratulations, you just mined a block!',
        'index': block['index'],
        'timestamp': block['timestamp'],
        'proof': block['proof'],
        'previous_hash': block['previous_hash'],
        'transactions': block['transactions']
    }
    return jsonify(response), 200

@app.route('/get_chain', methods=['GET'])
def get_chain():
    return jsonify({'chain': blockchain.chain, 'length': len(blockchain.chain)}), 200

@app.route('/is_valid', methods=['GET'])
def is_valid():
    valid = blockchain.is_chain_valid(blockchain.chain)
    message = 'This blockchain is valid.' if valid else 'This blockchain is corrupted.'
    return jsonify({'message': message}), 200

@app.route('/add_transaction', methods=['POST'])
def add_transaction():
    json_data = request.get_json()
    required_keys = ['sender', 'receiver', 'amount']
    if not all(key in json_data for key in required_keys):
        return 'Some elements of the transactions are missing', 400
    index = blockchain.add_transaction(json_data['sender'], json_data['receiver'], json_data['amount'])
    return jsonify({'message': f'This transaction will be added to Block {index}'}), 201

@app.route('/connect_node', methods=['POST'])
def connect_node():
    json_data = request.get_json()
    nodes = json_data.get('nodes')
    if nodes is None:
        return "No node", 400
    for node in nodes:
        blockchain.add_node(node)
    return jsonify({
        'message': 'All the nodes are now connected.',
        'total_nodes': list(blockchain.nodes)
    }), 201

@app.route('/replace_chain', methods=['GET'])
def replace_chain():
    replaced = blockchain.replace_chain()
    chain_key = 'new_chain' if replaced else 'actual_chain'
    return jsonify({
        'message': 'Chain was replaced!' if replaced else 'The chain is already up to date.',
        chain_key: blockchain.chain
    }), 200

def run():
    app.run(host='0.0.0.0', port=5000)
