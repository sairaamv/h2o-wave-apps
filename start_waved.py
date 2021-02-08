import subprocess
import os

port = os.environ.get['PORT']
text = subprocess.Popen(f'./waved -listen ":{port}"')

