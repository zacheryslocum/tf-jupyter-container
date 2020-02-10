# Jupyter Notebook Server in Docker

# Set HTTPS certificates
c.NotebookApp.certfile = u'/tf/jn-config/mycert.pem'
c.NotebookApp.keyfile = u'/tf/jn-config/mykey.key'
# Set a password,  docker
c.NotebookApp.password = u'sha1:c74bf54d575f:ced1ef40f9bbf4ef2f513310bafa2d2cce34ba32'
# Do not open a browser in docker
c.NotebookApp.open_browser = False
# Allow jupyter notebook to be run by root in docker
c.NotebookApp.allow_root = True
# Set ip to allow all through docker
c.NotebookApp.ip = '0.0.0.0'
# It is a good idea to set a known, fixed port for server access
c.NotebookApp.port = 8484
# Set directory in docker
c.NotebookApp.notebook_dir = u'/tf'
# Allow xheaders
c.NotebookApp.trust_xheaders = True
c.NotebookApp.allow_origin = '*'
c.NotebookApp.base_url = '/jupyter'
