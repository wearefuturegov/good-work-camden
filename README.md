# Good Work Camden
## Based on the AlphaGov Rails Template

## Prerequisites

- Ruby >=2.6.5
- PostgreSQL >= 12
- NodeJS >= 12.13.x
- Yarn >= 1.12.x

### Setting up the app in development

The app is containerised for ease of use, and can be run in Docker, by building the `Dockerfile`, or it can be run in a system running Postgres, Ruby and Node at the right versions, if it meets the pre-requisites.

Docker is the simplest way to run up a development environment, and you'll have to configure a connection to the database.

### Settings

Setup of various things is achieved using the following environment variables.

- `CAMDEN_ADVISOR_EMAIL` - The email the app should send completed questionnaires to
- `CAMDEN_CONTACT_EMAIL` - The email completed contact forms should be sent to
- `GOVUK_NOTIFY_API_KEY` - An API Key for Gov Notify (Used for sending emails)
- `GOVUK_NOTIFY_TEMPLATE_ID` - Template ID for Gov Notify
- `AIRTABLE_API_KEY` - API key for Airtable, which is used for seeding the database
- `AIRTABLE_BASE_ID` - Airtable base ID
- `POSTGRES_PASSWORD` - The password for the Postgres user - used in development environment
- `DATABASE_URL` - The full connection string for the database in production - Heroku compatible.

### Deployment

The app is setup to be deployed in Heroku, Dokku, or a Herokuish based environment.

#### Pre-setup

- Use the Heroku CLI to create a Dyno to deploy into
- Add a postgres database available to the dyno

#### Deployment

Add the Heroku app repo as a remote on the git repo and then deploy by pushing to heroku master.

```
$ git push heroku master
```