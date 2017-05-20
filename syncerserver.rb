require 'socket'               # Get sockets from stdlib
require 'win32ole'

wsh = WIN32OLE.new('Wscript.Shell')
server = TCPServer.open('192.168.xx.xxx', 3000)  # IPv4 address goes here
loop {                         # Server stays up in case you need to pause
   client = server.accept       # Waits until client is launched
   client.puts("ping")     # Initiate the client code
   sleep(0.020)            # Add ping delay
  if wsh.AppActivate('VLC media player') # Add the Windows task bar name of the video player
    wsh.SendKeys(' ')  # Send the play key
  end
  client.close                 # Disconnect the client
}
