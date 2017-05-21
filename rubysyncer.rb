require "socket"
require 'win32ole'
wsh = WIN32OLE.new('Wscript.Shell') 

hostname = 'localhost' # Server IP goes here
port = 3000 # Server port goes here

s = TCPSocket.open(hostname, port)

line = s.gets                   # Waits for a line from the server
if line != 1
  wsh.SendKeys('^{ESC}')             # Unfocus textboxes
  wsh.AppActivate('VLC media player') # Add the Windows task bar name of the video player
  wsh.SendKeys(' ')               # Send the play key
end

s.close                               # Close the socket when done
