## Deploy to the server

Changes that I made to the project related to the ssl and security. As described in instruction it is not working, so I swiched off security. For testing reasons it is not needed.
So, the steps that left:

1. The biggest challenge is to put all needed into .env file.
- Postgres credentials. HOST and PORT is the most important, user and db will be created with script. Also, superuser credentials will be needed.
- Sendgrid. Need to add API_KEY to make emails work (locally it didn't work for some reason, so just print needed info into the console).
- Plaid. Client_Id and Secret is needed. Easy to register and copy it for Sandbox. The rest should be like:
```
export PLAID_ENV="sandbox"
export PLAID_PRODUCTS="auth"
export PLAID_COUNTRY_CODES="US"
```
- Broker (Alpaca API). Need to generate BROKER_TOKEN using base64 basic auth. Use Alpaca Sandbox key:secret. And ruby irb: 
```Base64::encode64("key:secret")```
Result will be like:
```BROKER_TOKEN=Basic encoded_token```
To test the token you could make GET resuest to https://broker-api.sandbox.alpaca.markets/v1/assets with Header: `Authorization: your_token.`
- Looks like twilio and magic services are not obligatory.

2. After .env file is ready, you could run the app. On the server may be better to use doker: ```docker compose up```. Didn't try. Or use next commends(works locally):
- ```source .env``` (be awaire that you need to run this each time you change data inseide .env file)
- ```go get -v ./...``` - get dependancies
- ```go run ./entry/ generate_secret``` (copy the cli output of the command above and replace {JWT_SECRET} with it) ```export JWT_SECRET={JWT_SECRET}```
- DB commands:
```
go run ./entry create_db
go run ./entry create_schema
go run ./entry create_superadmin
```
- ```go run ./entry/main.go``` to run the app

3. After back-end is up and running, update back-end address on IOS app:
```EndPoints.swift -> kServerBase variable```

4. Also in the root of the project you could find DB dump from my local DB: alpaca_db_demo.sql. You could use it on the server and then use my user credentials: fedorniakl@gmail.com/qweqweqwe.


# Ribbit Reference Implementation (Backend)

The reference implementation for the backend of a broker-dealer trading application with the Alpaca [Broker API](https://alpaca.markets/docs/broker/). The backend is implemented using Go. 

To read more about what Ribbit is, it’s use cases, how it works with Broker API, and more check out our [Ribbit documentation](https://alpaca.markets/docs/broker/ribbit/). 

You can also access the [Ribbit Reference Implementation (Android)](https://github.com/alpacahq/ribbit-android) and [Ribbit Reference Implementation (iOS)](https://github.com/alpacahq/ribbit-ios) for a reference implementation of Ribbit’s user interface for both iOS and Android.

## Caveat

This code is provided as open source for the purpose of demonstration of the Broker API usage. It is not designed for the production use and Alpaca does not offer official support of the code available in this repository.

## Development Setup
Ribbit uses golang gin as webserver, and go-pg library for connecting with a PostgreSQL database.

## High-level Architecture

![ribbit](https://user-images.githubusercontent.com/22711718/139060730-a1628b12-cf45-4d6f-ad59-0a36b055b5c5.jpeg)


## Third Party Dependencies

The application uses the following third party apps in order to enable functionality reuse:
1. Twilio Verify(Used for email/mobile verification) 
    - Twilio Verify API (https://www.twilio.com/docs/verify/api)
    - The Application requires the Twilio Account SID under the `TWILIO_ACCOUNT` variable in `env.sample`
    - The Application requires the Twilio Account Auth Token under the `TWILIO_TOKEN` variable in `env.sample`
2. Plaid (Used for quickly transferring funds from your bank to Alpaca)
    - Plaid feature is only currently supported for US customers. Integration with UK and EU customers is coming soon
    - Plaid is used for ACH transfers to Alpaca. Check Alpaca's [funding documentation](https://alpaca.markets/docs/broker/integration/funding/) for more info. Alpaca's [ACH API](https://alpaca.markets/docs/broker/api-references/funding/ach/) might be helpful as well
    - Environment variables (in `env.sample`):
      - `PLAID_CLIENT_ID`: Plaid API account ID
      - `PLAID_SECRET`: Plaid authentication token
      - `PLAID_ENV`: [sandbox|development|production]
      - `PLAID_PRODUCTS`: currently, the app only needs `auth` to authenticate ACH transfers
3. Magic Labs (Used for seemless sign up and login using a single link)
    - Environment variables (in `env.sample`):
      - `MAGIC_API_KEY`: API key provided by Magic labs
      - `MAGIC_API_SECRET`: Secret token provided by Magic labs
4. SendGrid (Used for the traditional sign up flow)
    - Environment variables (in `env.sample`):
      - `SENDGRID_API_KEY`: API key provided by SendGrid

## Get started
----

### Generating private keys
A simple and efficient way of generating private keys is through mkcert. To install it, go over to their [repo](https://github.com/FiloSottile/mkcert#readme).

After successfully installing it in your machine, run `mkcert -install`

``` bash
# allow read write execute for current user
chmod 700 ./generate-ssl.sh
```

The command will do two things:
1. Generate certificates Caddy reverse proxy namely (ribbit.com.pem — private key; ribbit-public.com.pem — public cert)
2. Generate certificates for the client side payload encryption via openssl

After running the script, the give the client side (iOS and Android apps) the public key namely `public_key.pem`

### Initializing and starting the application
-----
#### Run it with docker compose
```
docker compose up
```

#### Run it locally

_Note_: Change `POSTGRES_HOST` to `localhost` when running on local machine and not docker. The same goes for `POSTGRES_SUPERUSER_PASSWORD`, set it to empty.

```bash
# postgresql config
cp .env.sample .env
source .env

# get dependencies and run
go get -v ./...
go run ./entry/ generate_secret
# copy the cli output of the command above and replace {JWT_SECRET} with it
export JWT_SECRET={JWT_SECRET}

# create a new database based on config values in .env
go run ./entry create_db

# create our database schema
go run ./entry create_schema

# create our superadmin user, which is used to administer our API server
go run ./entry create_superadmin

# schema migration and subcommands are available in the migrate subcommand
# go run ./entry migrate [command]

# run the application
go run ./entry/main.go
```

## Tests and coverage

### Run all tests

```bash
go test -coverprofile c.out ./...
go tool cover -html=c.out

# or simply
./test.sh
```

### Run only integration tests

```bash
go test -v -run Integration ./...

./test.sh -i
```

### Run only unit tests

```bash
go test -v -short ./...

# without coverage
./test.sh -s
# with coverage
./test.sh -s -c
```

## Schema migration and cli management commands

```bash
# create a new database based on config values in .env
go run ./entry create_db

# create our database schema
go run ./entry create_schema

# create our superadmin user, which is used to administer our API server
go run ./entry create_superadmin

# schema migration and subcommands are available in the migrate subcommand
# go run ./entry migrate [command]
```
