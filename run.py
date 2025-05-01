import sys
from api.routes import app

port = int(sys.argv[1]) if len(sys.argv) > 1 else 5000
app.run(host='0.0.0.0', port=port)