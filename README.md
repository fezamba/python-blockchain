Blockchain em Python com Flask

Este projeto implementa uma blockchain simples utilizando Python e Flask, com endpoints REST para mineração de blocos e consulta da cadeia.

Funcionalidades

- Mineração de blocos utilizando o algoritmo de Proof of Work (PoW).
- Geração de hashes seguros com SHA-256.
- API REST com endpoints para mineração e consulta da blockchain.
- Validação da integridade da cadeia de blocos.

Tecnologias Utilizadas

- Python 3.12
- Flask (Framework para criação de APIs REST)
- Postman (para testes da API)

Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/python-blockchain.git
   cd python-blockchain
   ```

2. Crie um ambiente virtual (opcional, mas recomendado):
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/macOS
   venv\Scripts\activate     # Windows
   ```

3. Instale as dependências:
   ```bash
   pip install flask
   ```

Como Executar

1. Execute o servidor Flask:
   ```bash
   python blockchain.py
   ```

2. Acesse os endpoints:
   - Minerar um bloco: [http://127.0.0.1:5000/mine_block](http://127.0.0.1:5000/mine_block)
   - Visualizar a blockchain: [http://127.0.0.1:5000/get_chain](http://127.0.0.1:5000/get_chain)
   - Verificar o blockchain: [http://127.0.0.1:5000/is_valid](http://127.0.0.1:5000/is_valid)
   
Endpoints Disponíveis

- `GET /mine_block`: Minera um novo bloco e o adiciona à blockchain.
- `GET /get_chain`: Retorna toda a blockchain.
- `GET /is_valid`: Verifica se a blockchain é válida.

Futuras Melhorias

- Criar um Criptoativo utilizando Smart Contracts
- Implementação de transações reais entre usuários.
- Integração de um sistema de consenso distribuído.
- Interface web para interação com a blockchain.

Fernando Azambuja  
[LinkedIn](https://www.linkedin.com/feazambuja)  

