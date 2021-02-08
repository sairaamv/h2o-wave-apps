import subprocess
import os

port = os.environ.get['PORT']
print(port)
text = subprocess.Popen('./waved')

