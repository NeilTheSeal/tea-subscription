# Tea Subscription API
> An API used to subscribe tea enthusiasts to weekly tea deliveries

![Ruby][ruby-image]
![Rails][rails-image]

## Example API requests

<details>
 <summary><code>GET</code> <code>/api/v1/customer</code></summary>


##### Parameters

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | customer_id      |  required | integer   | the ID number associated with the customer's entry in the customers table  |

##### Headers

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | accept      |  optional | string   | application/json  |

##### Responses

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `201`         | `application/json`        | `[{"id": 2, "subscription_id": 9, "customer_id": 2, "created_at": "2024-06-28T22:01:35.501Z", "updated_at": "2024-06-28T22:01:35.501Z", "status": 0},`                                |
> | `422`         | `application/json`        | `{ error: "Customer not found" }`                                |

##### Example cURL

> ```javascript
>  curl -X GET -H "accept: application/json" "http://localhost:3000/api/v1/customer?customer_id=1"
> ```
</details>

<details>
 <summary><code>POST</code> <code>/api/v1/subscription</code></summary>


##### Parameters

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | customer_id      |  required | integer  |  the ID number associated with the customer's entry in the customers table |
> | subscription_id      |  required | integer  |  the ID number associated with the subscription entry in the subscriptions table |

##### Headers

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | accept      |  optional | string   | application/json  |

##### Responses

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `201`         | `application/json`        | `{"id": 22, "subscription_id": 3, "customer_id": 3, "created_at": "2024-06-30T20:16:30.803Z", "updated_at": "2024-06-30T20:16:30.803Z", "status": 1}`                                |
> | `422`         | `application/json`        | `{"customer": ["must exist"]}`                                |

##### Example cURL

> ```javascript
>  curl -X POST -H "accept: application/json" "http://localhost:3000/api/v1/subscription?customer_id=1&subscription_id=1"
> ```
</details>

<details>
 <summary><code>DELETE</code> <code>/api/v1/subscription/<customer_id></code></summary>


##### Parameters

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | subscription_id      |  required | integer   | the ID number associated with the subscription entry in the subscriptions table  |

##### Headers

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | accept      |  optional | string   | application/json  |

##### Responses

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `200`         | `application/json`        | `{"status": 0, "subscription_id": 1, "customer_id": 1, "id": 21, "created_at": "2024-06-28T22:17:34.754Z", "updated_at": "2024-06-28T22:17:40.261Z"}`                                |
> | `422`         | `application/json`        | `{ error: "customer or subscription not found" }`                                |                            |

##### Example cURL

> ```javascript
>  curl -X DELETE -H "accept: application/json" "http://localhost:3000/api/v1/subscription/1?subscription_id=1"
> ```
</details>

## Database Schema

### customers table

| Column         | Data Type |  Required  |
|----------------|-----------|------------|
| first_name        | string    |     true   |
| last_name | string   |     true   |
| email     | string  |     true   |
| address     | string  |     true   |

### teas table

| Column         | Data Type |  Required  |
|----------------|-----------|------------|
| title        | string    |     true   |
| description | string   |     true   |
| temperature     | integer  |     true   |
| brew time     | integer  |     true   |

### subscriptions table

| Column         | Data Type |  Required  |
|----------------|-----------|------------|
| title        | string    |     true   |
| price | integer   |     true   |
| status     | integer  |     true   |
| frequency     | integer  |     true   |

### subscription_customers join table

| Column         | Data Type |  Required  |
|----------------|-----------|------------|
| subscription_id        | integer    |     true   |
| customer_id | integer   |     true   |
| status | integer | true |

### subscription_teas join table

| Column         | Data Type |  Required  |
|----------------|-----------|------------|
| tea_id        | integer    |     true   |
| subscription_id | integer   |     true   |


## Development setup

This guide assumes you have installed [Rails 7.1.3](https://guides.rubyonrails.org/v7.1/getting_started.html) and [PostgreSQL >= 14](https://www.postgresql.org/download/)

First, clone the repository to your computer

```sh
git clone git@github.com:NeilTheSeal/tea-subscription.git
```

Next, install all of the Gems

```sh
bundle install
```

Create, migrate, and seed the databases

```sh
rails db:{create,migrate,seed}
```

Finally, start the development server

```sh
rails s
```

The API will be served on `localhost:3000`.

Run the test suite to diagnose issues -

```sh
bundle exec rspec
```

## Meta

Neil Hendren | [NeiltheSeal](https://github.com/NeiltheSeal) | neil.hendren@gmail.com | [LinkedIn](https://www.linkedin.com/in/neilhendren/)
