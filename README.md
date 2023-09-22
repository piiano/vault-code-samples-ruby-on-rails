<p>
  <a href="https://piiano.com/pii-data-privacy-vault/">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://docs.piiano.com/img/logo-developers-dark.svg">
      <source media="(prefers-color-scheme: light)" srcset="https://docs.piiano.com/img/logo-developers.svg">
      <img alt="Piiano Vault" src="https://docs.piiano.com/img/logo-developers.svg" height="40" />
    </picture>
  </a>
</p>

_Piiano Vault: The secure home for sensitive personal data_  

*Safely store sensitive personal data in your own cloud environment with automated compliance controls.*

Piiano Vault Ruby on Rails framework samples
============================================

The code in this directory contains sample code in Ruby on Rails (RoR) framework for a safe User management CRUD API with [Piiano Vault](http://piiano.com) with [ActiveRecord record encryption](https://guides.rubyonrails.org/active_record_encryption.html).

This demo application version is 0.9.3 and is compatible with Vault version 1.8.3 .

## Background

Piiano Vault is the secure home for sensitive personal data. It allows you to safely store sensitive personal data in your own cloud environment with automated compliance controls.  

Vault is deployed within your own architecture, next to other DBs used by the applications, and should be used to store the most critical sensitive personal data, such as credit cards and bank account numbers, names, emails, national IDs (e.g. SSN), phone numbers, etc.

The main benefits are:  

- Field level encryption, including key rotation.
- Searchability is allowed over the encrypted data.
- Full audit log for all data accesses.
- Granular access controls.
- Easy masking and tokenization of data.
- Out of the box privacy compliance functionality.

More details can be found [on our website](https://piiano.com/pii-data-privacy-vault/) and on the [developers portal](https://piiano.com/docs/).

## Prerequisites

- [Ruby v3.2.2+](https://www.ruby-lang.org/en/)
- [Docker](https://www.docker.com/)
- [Piiano Vault](https://piiano.com/docs/guides/get-started)

## Running locally

Clone the project from GitHub:
```bash
git clone https://github.com/piiano/vault-code-samples-ruby-on-rails.git
```

This sample code requires a valid Piiano Vault service license in order to run Piiano Vault locally.

```bash
export PVAULT_SERVICE_LICENSE=<your Piiano Vault license>
export PVAULT_API_KEY="pvaultauth"
```

`make clean` - Clean project dependencies.

`make app-run` - Start the application and its prerequisites (Piiano Vault).  

When the application is started, you can make API calls to the API endpoints:

```bash
# Create a new user
curl -X POST http://localhost:5100/users \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{ "email": "email@example.com", "name": "John Doe", "ssn": "123-12-1234" }'

# List all users
curl -X GET http://localhost:5100/users \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json'
```

Or, manage users through the web interface: http://localhost:5100/users

You can verify that your users table values are tokenized by running the following command:

```bash
rails runner 'pp User.connection.execute("SELECT * FROM users")'
```

## Updating Piiano Vault Ruby SDK

`make generate-sdk` - The generated code is already committed in this repository. Use this option to re-generate the Ruby SDK from the [openapi.yaml](/pvault-sdk-generator/openapi.yaml) file.

## Testing

Tests for this example include a full integration test with a single-container Piiano Vault and a local SQLite database.

`make app-test` - Test the high-level functionality of the CRUD as integrated with SQLite and Piiano Vault.

  * `list` - Lists all users that are partially protected by Piiano Vault. All the protected properties are detokenized.
  * `update`: Update a user with a nested protected property. The protected property is updated on Vault, and the resulting token is stored in the app's DB. Unmodified properties remain the same.


```bash
export PVAULT_SERVICE_LICENSE=<your Piiano Vault license>
export PVAULT_API_KEY="pvaultauth"

make clean
make generate-sdk
make app-test
```

## Folder structure

This repository contains the following projects:

1. `pvault-sdk-generator` - A small utility to generate the Piiano Vault Ruby SDK from an OpenAPI file.

2. `pvault-sdk` - An auto-generated Piiano Vault Ruby SDK.

3. `rails` - A Ruby on Rails project that shows how Piiano Vault can be integrated to protect certain user entity properties in common User CRUD API operations.
