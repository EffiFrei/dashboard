## Admin

## Carrier

- has many trucks
- has many drivers through trucks
- has many requests through trucks
<!-- - has many requests -->
<!-- - has many shippers through requests -->

## Shipper

- has many requests
<!-- - has many carriers through requests -->

## Request

<!-- - belongs to carrier -->
- belongs to shipper
- belongs to truck
<!-- - has many trucks -->
<!-- - has many carriers through trucks -->

## Truck

- has many requests
<!-- - belongs to request -->
- belongs to carrier
- has many drivers

## Driver

- belongs to truck