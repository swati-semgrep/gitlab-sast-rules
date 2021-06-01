import requests
import wsgiref.handlers
from twisted.internet import reactor
from twisted.web import static, server, twcgi

def application(environ, start_response):
    r = requests.get('https://192.168.0.42/private/api/foobar')
    start_response('200 OK', [('Content-Type', 'text/plain')])
    return [r.content]

if __name__ == '__main__':
    wsgiref.handlers.CGIHandler().run(application)


root = static.File("/root")
root.putChild("cgi-bin", twcgi.CGIDirectory("/var/www/cgi-bin"))
reactor.listenTCP(80, server.Site(root))
reactor.run()
