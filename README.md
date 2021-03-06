# Good Work Camden
## Based on the AlphaGov Rails Template

## Prerequisites

- Ruby >=2.6.5
- PostgreSQL >= 12
- NodeJS >= 12.13.x
- Yarn >= 1.12.x


### Installation

* `npm install`
* `bundle install`
* `rails db:setup`
* `rails server`


### Troubleshooting

* application.scss errors - try building with yarn instead of npm.

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

The app is setup to be deployed in Heroku.
