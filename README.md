# Postboy

[![Deps Status](https://beta.hexfaktor.org/badge/all/github/Nebo15/postboy.api.svg)](https://beta.hexfaktor.org/github/Nebo15/postboy.api) [![Build Status](https://travis-ci.org/Nebo15/postboy.api.svg?branch=master)](https://travis-ci.org/Nebo15/postboy.api) [![Coverage Status](https://coveralls.io/repos/github/Nebo15/postboy.api/badge.svg?branch=master)](https://coveralls.io/github/Nebo15/postboy.api?branch=master) [![Ebert](https://ebertapp.io/github/Nebo15/postboy.api.svg)](https://ebertapp.io/github/Nebo15/postboy.api)

![Man Logo](https://github.com/Nebo15/postboy.api/raw/master/docs/images/logo.png)

Delivery service for Email or SMS messages.

## Features

- Pluggable upstream adapters.
- Supports HTTP or AMQP protocols.
- Configurable retry limits with backoff strategy.
- Configurable delivery shedules per Channel with timezone setting.
- Webhooks for status notifications.
- Configured concurrency limits.
- Per-message delivery history for easy debugging.
- Integrated Statsd/Dogstatsd metrics reporting.

## Docs

Docs available on [Apiary Postman Page](http://docs.postboy.apiary.io/#). This project uses API Blueprint for documentation, you see source in [apiary.apib](apiary.apib) file.

## Supported upstreams

**Email**

| Service   | Adapter name              | Service URL                  |
| --------- | ------------------------- | ---------------------------- |
| Mailgun   | `Bamboo.MailgunAdapter`   | https://www.mailgun.com/     |
| Mailjet   | `Bamboo.MailjetAdapter`   | https://www.mailjet.com/     |
| Mandrill  | `Bamboo.MandrillAdapter`  | http://www.mandrill.com/     |
| SendGrid  | `Bamboo.SendGridAdapter`  | https://sendgrid.com/        |
| SparkPost | `Bamboo.SparkPostAdapter` | https://www.sparkpost.com/   |
| Postmark  | `Bamboo.PostmarkAdapter`  | https://postmarkapp.com/     |
| Sendcloud | `Bamboo.SendcloudAdapter` | https://www.sendcloud.nl/    |
| SMTP      | `Bamboo.SMTPAdapter`      | N/A                          |

**SMS**

| Service   | Adapter name                  | Service URL             |
| --------- | ----------------------------- | ----------------------- |
| Twilio    | `Postman.SMS.Adapters.Twilio` | https://www.twilio.com/ |
| Nexmo     | `Postman.SMS.Adapters.Nexmo`  | https://www.nexmo.com/  |

## Monitoring Metrics

| Metric Name               | Type    | Tags                          | Description |
| ------------------------- | ------- | ----------------------------- | ----------- |
| `messages_count`          | counter | `channel_id`, `channel_title` | Messages hit rate. |
| `deliveries_latency`      | counter | `status`, `adapter`           | Delivery attempts latency. |
| `deliveries_count`        | counter | `status`, `adapter`           | Delivery attempts count. |
| `adapter_request_count`   | counter | `adapter`, `channel_id`, `channel_title` | Upstream API hit rate. |
| `adapter_request_latency` | counter | `adapter`, `channel_id`, `channel_title` | Upstream API response time. |

## Installation

### One-click deployment

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/Nebo15/postboy_api).

## Configuration

Documentation on environment configuration can be found in [docs/ENVIRONMENT.md](docs/ENVIRONMENT.md).

## License

See [LICENSE.md](LICENSE.md).
