from flask import Flask
import psutil
import shutil
import subprocess

app = Flask(__name__)

@app.route("/")
def dashboard():
    cpu = psutil.cpu_percent(interval=1)
    mem = psutil.virtual_memory()
    disk = shutil.disk_usage("/")

    docker = subprocess.getoutput("docker ps --format '{{.Names}} {{.Status}}'")

    return f"""
    <h1>GitHub Runner Monitoring</h1>
    <p>CPU: {cpu}%</p>
    <p>Memory: {mem.percent}%</p>
    <p>Disk: {disk.used // (1024**3)} GB / {disk.total // (1024**3)} GB</p>
    <h2>Docker Containers</h2>
    <pre>{docker}</pre>
    """

app.run(host="0.0.0.0", port=5000)

