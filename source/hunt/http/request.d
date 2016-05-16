module hunt.http.request;

import collie.codec.http;

import hunt.http.webfrom;

class Request
{

    this(HTTPRequest req)
    {
        assert(req);
        _req = req;
    }

    @property WebForm postForm()
    {
        if (_form is null)
            _form = new WebForm(_req);
        return _form;
    }

    alias httpRequest this;

    @property httpRequest()
    {
        return _req;
    }

    @property meat()
    {
        return _mate;
    }

    string getMate(string key)
    {
        return _mate.get(key, "");
    }

    void addMate(string key, string value)
    {
        _mate[key] = value;
    }

private:
    HTTPRequest _req;
    WebForm _form = null;
    string[string] _mate;
}