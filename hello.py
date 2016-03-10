def wsgi_application(environ, start_responce):
    status = '200 OK'
    headers = [('Content-Type', 'text/plain')]
    start_responce(status, headers)
    resp = environ['QUERY_STRING'].split("&")
    resp = [item + "\r\n" for item in resp]
    return resp
