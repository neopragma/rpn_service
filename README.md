[![Build Status](https://travis-ci.org/neopragma/rpn-service.png)](https://travis-ci.org/neopragma/rpn-service)

# rpn_service

This is part of a toy project to explore different ways to package and deploy applications. It's a RESTful service wrapper around ```rpn_ruby```, a Reverse Polish Notation calculator.

## Local testing

To get started:

```shell
bundle install
```

To start the RPN calculator service locally (it uses port 3000):

```shell
ruby rpn_service.rb
```

To run the tests of the ```rpn_service``` microservice (the service must be running):

```shell
rake
```

You can also invoke the RPN calculator service from the command line like this:

```shell
curl -X GET \
     -H "Accept: application/json" \
     -H "Content-type: application/json" \
     'http://localhost:3000/calc/2/5/4/+/*'
```

## Related projects

```rpn_ruby``` is the 'application logic' this service wraps.

```rpn_ui``` is a webapp that presents a user interface and calls ```rpn_service```.
