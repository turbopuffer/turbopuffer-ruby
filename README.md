# Turbopuffer Ruby API library

The Turbopuffer Ruby library provides convenient access to the Turbopuffer REST API from any Ruby 3.2.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/turbopuffer/turbopuffer-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

It is generated with [Stainless](https://www.stainless.com/).

## MCP Server

Use the Turbopuffer MCP Server to enable AI assistants to interact with this API, allowing them to explore endpoints, make test requests, and use documentation to help integrate this SDK into your application.

[![Add to Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/en-US/install-mcp?name=%40turbopuffer%2Fturbopuffer-mcp&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsIkB0dXJib3B1ZmZlci90dXJib3B1ZmZlci1tY3AiXSwiZW52Ijp7IlRVUkJPUFVGRkVSX0FQSV9LRVkiOiJ0cHVmX0ExLi4uIiwiVFVSQk9QVUZGRVJfUkVHSU9OIjoiZ2NwLXVzLWNlbnRyYWwxIiwiVFVSQk9QVUZGRVJfREVGQVVMVF9OQU1FU1BBQ0UiOiJNeSBEZWZhdWx0IE5hbWVzcGFjZSJ9fQ)
[![Install in VS Code](https://img.shields.io/badge/_-Add_to_VS_Code-blue?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9Im5vbmUiIHZpZXdCb3g9IjAgMCA0MCA0MCI+PHBhdGggZmlsbD0iI0VFRSIgZmlsbC1ydWxlPSJldmVub2RkIiBkPSJNMzAuMjM1IDM5Ljg4NGEyLjQ5MSAyLjQ5MSAwIDAgMS0xLjc4MS0uNzNMMTIuNyAyNC43OGwtMy40NiAyLjYyNC0zLjQwNiAyLjU4MmExLjY2NSAxLjY2NSAwIDAgMS0xLjA4Mi4zMzggMS42NjQgMS42NjQgMCAwIDEtMS4wNDYtLjQzMWwtMi4yLTJhMS42NjYgMS42NjYgMCAwIDEgMC0yLjQ2M0w3LjQ1OCAyMCA0LjY3IDE3LjQ1MyAxLjUwNyAxNC41N2ExLjY2NSAxLjY2NSAwIDAgMSAwLTIuNDYzbDIuMi0yYTEuNjY1IDEuNjY1IDAgMCAxIDIuMTMtLjA5N2w2Ljg2MyA1LjIwOUwyOC40NTIuODQ0YTIuNDg4IDIuNDg4IDAgMCAxIDEuODQxLS43MjljLjM1MS4wMDkuNjk5LjA5MSAxLjAxOS4yNDVsOC4yMzYgMy45NjFhMi41IDIuNSAwIDAgMSAxLjQxNSAyLjI1M3YuMDk5LS4wNDVWMzMuMzd2LS4wNDUuMDk1YTIuNTAxIDIuNTAxIDAgMCAxLTEuNDE2IDIuMjU3bC04LjIzNSAzLjk2MWEyLjQ5MiAyLjQ5MiAwIDAgMS0xLjA3Ny4yNDZabS43MTYtMjguOTQ3LTExLjk0OCA5LjA2MiAxMS45NTIgOS4wNjUtLjAwNC0xOC4xMjdaIi8+PC9zdmc+)](https://vscode.stainless.com/mcp/%7B%22name%22%3A%22%40turbopuffer%2Fturbopuffer-mcp%22%2C%22command%22%3A%22npx%22%2C%22args%22%3A%5B%22-y%22%2C%22%40turbopuffer%2Fturbopuffer-mcp%22%5D%2C%22env%22%3A%7B%22TURBOPUFFER_API_KEY%22%3A%22tpuf_A1...%22%2C%22TURBOPUFFER_REGION%22%3A%22gcp-us-central1%22%2C%22TURBOPUFFER_DEFAULT_NAMESPACE%22%3A%22My%20Default%20Namespace%22%7D%7D)

> Note: You may need to set environment variables in your MCP client.

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/turbopuffer).

The REST API documentation can be found on [turbopuffer.com](https://turbopuffer.com/docs/auth).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "turbopuffer", "~> 1.12.1"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "turbopuffer"
require "json"

tpuf = Turbopuffer::Client.new(
  # API tokens are created in the dashboard: https://turbopuffer.com/dashboard
  api_key: ENV["TURBOPUFFER_API_KEY"],
  # Pick the right region: https://turbopuffer.com/docs/regions
  region: "gcp-us-central1",
)

ns = tpuf.namespace("example")

# Query nearest neighbors with filter
result = ns.query(
  rank_by: ["vector", "ANN", openai_or_rand_vector("walrus narwhal")],
  top_k: 10,
  filters: ["And", [["name", "Eq", "foo"], ["public", "Eq", 1]]],
  include_attributes: ["name"],
)
puts result.rows
# {id: 1, "$dist": 0.0, name: "foo"}

# Full-text search on an attribute
# If you want to combine FTS and vector search, see https://turbopuffer.com/docs/hybrid-search
result = ns.query(
  top_k: 10,
  filters: ["name", "Eq", "foo"],
  rank_by: ["text", "BM25", "quick walrus"],
)
puts result.rows
# {id: 1, "$dist": 0.19856808}
# {id: 2, "$dist": 0.16853257}

# See https://turbopuffer.com/docs/quickstart for more.s
```

### Pagination

List methods in the Turbopuffer API are paginated.

This library provides auto-paginating iterators with each list response, so you do not have to request successive pages manually:

```ruby
page = turbopuffer.namespaces(prefix: "products")

# Fetch single item from page.
client = page.namespaces[0]
puts(client.id)

# Automatically fetches more pages as needed.
page.auto_paging_each do |client|
  puts(client.id)
end
```

Alternatively, you can use the `#next_page?` and `#next_page` methods for more granular control working with pages.

```ruby
if page.next_page?
  new_page = page.next_page
  puts(new_page.namespaces[0].id)
end
```

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `Turbopuffer::Errors::APIError` will be thrown:

```ruby
begin
  client = turbopuffer.namespaces(prefix: "foo")
rescue Turbopuffer::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue Turbopuffer::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue Turbopuffer::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 4 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
turbopuffer = Turbopuffer::Client.new(
  max_retries: 0 # default is 4
)

# Or, configure per-request:
turbopuffer.namespaces(prefix: "foo", request_options: {max_retries: 5})
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
turbopuffer = Turbopuffer::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
turbopuffer.namespaces(prefix: "foo", request_options: {timeout: 5})
```

On timeout, `Turbopuffer::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

### Compression

By default, the client does not request compressed responses. To enable compression:

```ruby
turbopuffer = Turbopuffer::Client.new(
  compression: true
)

# Or, configure per-request:
turbopuffer.namespaces(prefix: "foo", request_options: {compression: true})
```

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `Turbopuffer::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
page =
  turbopuffer.namespaces(
    prefix: "foo",
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(page[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `Turbopuffer::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `Turbopuffer::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
turbopuffer.namespace("products").write(
  distance_metric: "cosine_distance",
  upsert_rows: [Turbopuffer::Row.new(id: "2108ed60-6851-49a0-9016-8325434f3845", vector: [0.1, 0.2])]
)
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
turbopuffer.namespace("products").write(
  distance_metric: "cosine_distance",
  upsert_rows: [{id: "2108ed60-6851-49a0-9016-8325434f3845", vector: [0.1, 0.2]}]
)

# You can also splat a full Params class:
params = Turbopuffer::NamespaceWriteParams.new(
  distance_metric: "cosine_distance",
  upsert_rows: [Turbopuffer::Row.new(id: "2108ed60-6851-49a0-9016-8325434f3845", vector: [0.1, 0.2])]
)
turbopuffer.namespace("products").write(**params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :cosine_distance
puts(Turbopuffer::DistanceMetric::COSINE_DISTANCE)

# Revealed type: `T.all(Turbopuffer::DistanceMetric, Symbol)`
T.reveal_type(Turbopuffer::DistanceMetric::COSINE_DISTANCE)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
turbopuffer.namespaces.explain_query(
  distance_metric: Turbopuffer::DistanceMetric::COSINE_DISTANCE,
  # …
)

# Literal values are also permissible:
turbopuffer.namespaces.explain_query(
  distance_metric: :cosine_distance,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/turbopuffer/turbopuffer-ruby/tree/main/CONTRIBUTING.md).
