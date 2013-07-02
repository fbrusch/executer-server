require "should"
request = require("request")
describe "code execution", ->
    f = """
    #include <stdio.h>
    int main()
    {
        printf("hello");
    }"""
    it "hello world should print out hello world", (done) ->
        request.post(
            {
                uri: "http://localhost:3012/exec"
                method:"post"
                json: true
                form:
                    code: f
            },
            (error, response, body) ->
                body.stdout.should.equal("hello")
                done()
        )



