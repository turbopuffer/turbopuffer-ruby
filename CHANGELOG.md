# Changelog

## 1.1.0 (2025-09-11)

Full Changelog: [v1.0.0...v1.1.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.0.0...v1.1.0)

### Features

* spec: add dedicated type for AggregationGroup response ([e30bb79](https://github.com/turbopuffer/turbopuffer-ruby/commit/e30bb796ff91b36d3f9424674470eb84feeaad63))
* tpuf: add include_ground_truth option to recall endpoint ([9d535c4](https://github.com/turbopuffer/turbopuffer-ruby/commit/9d535c44ce64f47a312a693d009506d635230322))

## 1.0.0 (2025-08-28)

Full Changelog: [v0.2.6...v1.0.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.6...v1.0.0)

### Features

* Make word_v2 the default FTS tokenizer ([80b7df4](https://github.com/turbopuffer/turbopuffer-ruby/commit/80b7df45beb96368a97af615330eb9bdff415577))


### Bug Fixes

* bump sorbet version and fix new type errors from the breaking change ([751bf80](https://github.com/turbopuffer/turbopuffer-ruby/commit/751bf8010f07d33521d73c40b49ca341f9d26505))


### Chores

* add json schema comment for rubocop.yml ([ce20bd0](https://github.com/turbopuffer/turbopuffer-ruby/commit/ce20bd0db6a9cead8cd66874a29a4c99c857b31e))

## 0.2.6 (2025-08-18)

Full Changelog: [v0.2.5...v0.2.6](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.5...v0.2.6)

### Bug Fixes

* **api:** add support for `group_by` query parameter ([c4e6261](https://github.com/turbopuffer/turbopuffer-ruby/commit/c4e626148df5642d654e5ae739d07588fcd4ad5d))
* remove 200 error code for hint_cache_warm API call (always 202 now) ([bbd6d75](https://github.com/turbopuffer/turbopuffer-ruby/commit/bbd6d759e25a1b7b4dd8e3208acc1089f1d35f36))


### Chores

* **internal:** codegen related update ([880022b](https://github.com/turbopuffer/turbopuffer-ruby/commit/880022bea36595da811d14bd5a2e610624b283eb))

## 0.2.5 (2025-08-11)

Full Changelog: [v0.2.4...v0.2.5](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.4...v0.2.5)

### Chores

* collect metadata from type DSL ([79bb9bd](https://github.com/turbopuffer/turbopuffer-ruby/commit/79bb9bd39297006af6693580f09d35c1c801500f))
* **internal:** update comment in script ([0b151c0](https://github.com/turbopuffer/turbopuffer-ruby/commit/0b151c035ce5ba8785c3499247843428ba8267bd))
* update @stainless-api/prism-cli to v5.15.0 ([bb9a4b1](https://github.com/turbopuffer/turbopuffer-ruby/commit/bb9a4b1de0ac931671b2abeefa9c4cf8a67bae63))

## 0.2.4 (2025-08-01)

Full Changelog: [v0.2.3...v0.2.4](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.3...v0.2.4)

### Bug Fixes

* **api:** api update ([900bd73](https://github.com/turbopuffer/turbopuffer-ruby/commit/900bd73a945bdb8af7d1c23d7f44a359a154c1aa))
* **api:** api update ([d63b961](https://github.com/turbopuffer/turbopuffer-ruby/commit/d63b9613a0827be0969a218a29df23934ef8c46f))


### Chores

* **internal:** increase visibility of internal helper method ([fc6e1e7](https://github.com/turbopuffer/turbopuffer-ruby/commit/fc6e1e7c7a5824c751d32bb3f88ab8c716f763cf))

## 0.2.3 (2025-07-29)

Full Changelog: [v0.2.2...v0.2.3](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.2...v0.2.3)

### Bug Fixes

* **api:** api update ([fc8709f](https://github.com/turbopuffer/turbopuffer-ruby/commit/fc8709fbebe7d26a2d82a8ba3c28b0e7f606cea2))
* **api:** api update ([5295ae2](https://github.com/turbopuffer/turbopuffer-ruby/commit/5295ae24caff9edd7acc8f14a8321323a831cf70))

## 0.2.2 (2025-07-29)

Full Changelog: [v0.2.1...v0.2.2](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.1...v0.2.2)

### Bug Fixes

* **api:** api update ([9650229](https://github.com/turbopuffer/turbopuffer-ruby/commit/965022936b5551d035ccba9dceb98f7b180ed34d))
* **api:** api update ([f27319a](https://github.com/turbopuffer/turbopuffer-ruby/commit/f27319a7f811a5f6975acbb2d714c113f32fb8e8))
* **internal:** ensure sorbet test always runs serially ([954ee15](https://github.com/turbopuffer/turbopuffer-ruby/commit/954ee1533f161a7da823cd98077edb0d7bb4b750))

## 0.2.1 (2025-07-28)

Full Changelog: [v0.2.0...v0.2.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.0...v0.2.1)

### Bug Fixes

* **api:** api update ([1e4eca8](https://github.com/turbopuffer/turbopuffer-ruby/commit/1e4eca8d1810c7b692a2922b6b2e0093f0a5cab3))


### Chores

* update contribute.md ([3eba4ef](https://github.com/turbopuffer/turbopuffer-ruby/commit/3eba4ef08cf0ab697a19a9fec242926badf5e9e9))

## 0.2.0 (2025-07-22)

Full Changelog: [v0.2.0-beta.1...v0.2.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.0-beta.1...v0.2.0)

### Chores

* **internal:** version bump ([fbca51e](https://github.com/turbopuffer/turbopuffer-ruby/commit/fbca51ebf45d575644d28890d2717cf31d2306dc))

## 0.2.0-beta.1 (2025-07-22)

Full Changelog: [v0.2.0-alpha.3...v0.2.0-beta.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.0-alpha.3...v0.2.0-beta.1)

### Chores

* **internal:** version bump ([e91cbf9](https://github.com/turbopuffer/turbopuffer-ruby/commit/e91cbf90846f748935512620e0c46bd765c8790c))

## 0.2.0-alpha.3 (2025-07-22)

Full Changelog: [v0.2.0-alpha.2...v0.2.0-alpha.3](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.0-alpha.2...v0.2.0-alpha.3)

### Bug Fixes

* allow modifying Row objects in place ([269929a](https://github.com/turbopuffer/turbopuffer-ruby/commit/269929aace3a3b69a5db972d1382a01080f0c70a))
* improve the README example ([84793e6](https://github.com/turbopuffer/turbopuffer-ruby/commit/84793e649a8b45d3e7c0826c90899a3b25220190))
* **internal:** tests should use normalized property names ([a2bfe81](https://github.com/turbopuffer/turbopuffer-ruby/commit/a2bfe81c3149796e0d2fed0e54db8e6deacef03b))


### Chores

* **internal:** version bump ([9ac2013](https://github.com/turbopuffer/turbopuffer-ruby/commit/9ac201321f311c97923ed9c667d88d1b9c4221f0))

## 0.2.0-alpha.2 (2025-07-21)

Full Changelog: [v0.2.0-alpha.1...v0.2.0-alpha.2](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.2.0-alpha.1...v0.2.0-alpha.2)

### Chores

* **internal:** version bump ([1f8048f](https://github.com/turbopuffer/turbopuffer-ruby/commit/1f8048f35780345a9f8de1ff55daa136fab72ff1))

## 0.2.0-alpha.1 (2025-07-21)

Full Changelog: [v0.1.0-alpha.2...v0.2.0-alpha.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.1.0-alpha.2...v0.2.0-alpha.1)

### Features

* **api:** introduce dedicated Query model ([420e42b](https://github.com/turbopuffer/turbopuffer-ruby/commit/420e42b03f05bafb3441e15167349184ac6705da))


### Bug Fixes

* **api:** api update ([7348b90](https://github.com/turbopuffer/turbopuffer-ruby/commit/7348b90f988b59a00f5bb6adb76467a699da8273))
* **api:** api update ([e600278](https://github.com/turbopuffer/turbopuffer-ruby/commit/e60027807e7ca72cc92dae225c1afebb2b5bc455))
* **api:** api update ([823d059](https://github.com/turbopuffer/turbopuffer-ruby/commit/823d05948dfb60656d7388ea7d25f11b86e41eb3))
* **api:** api update ([6380572](https://github.com/turbopuffer/turbopuffer-ruby/commit/63805720cbaf84f048907907e86831fdaa19c546))
* **api:** api update ([ca95879](https://github.com/turbopuffer/turbopuffer-ruby/commit/ca958796c50576e1c3beb80d4e1eba4b63563b56))
* **api:** api update ([6f54464](https://github.com/turbopuffer/turbopuffer-ruby/commit/6f544641410f009b954f499a5771fb62965d2750))
* **ci:** plumb API key to tests ([25603e1](https://github.com/turbopuffer/turbopuffer-ruby/commit/25603e1dff1af7f8d0a4cc5163341b039b3483fc))
* **ci:** release-doctor — report correct token name ([df0b386](https://github.com/turbopuffer/turbopuffer-ruby/commit/df0b386b694d8b46df995553dd4c4e8116eab1b5))
* don't require region unless baseUrl contains {region} placeholder ([2d537ff](https://github.com/turbopuffer/turbopuffer-ruby/commit/2d537ff0a6ce8af113b724143b38ab573591c62e))
* formatting ([5d1aa92](https://github.com/turbopuffer/turbopuffer-ruby/commit/5d1aa92fb0a17331a4c228b01301581601767d22))
* issue where we cannot mutate arrays on base model derivatives ([bc889aa](https://github.com/turbopuffer/turbopuffer-ruby/commit/bc889aa6865671327bf7f6349bff783f2242a005))
* request parameters should not be marked required if they can be derived from client properties ([aaa1c73](https://github.com/turbopuffer/turbopuffer-ruby/commit/aaa1c73043810c7d7a12aae8972c0e616765308a))
* **test:** provide distance_metric ([2c41aee](https://github.com/turbopuffer/turbopuffer-ruby/commit/2c41aee42d290fd3bbd8641eb937f8644b324311))


### Chores

* **ci:** enable for pull requests ([0abb0af](https://github.com/turbopuffer/turbopuffer-ruby/commit/0abb0afaaf0ab9b749eaee2fe602b65a64457945))
* **ci:** only run for pushes and fork pull requests ([eb299b8](https://github.com/turbopuffer/turbopuffer-ruby/commit/eb299b82e3884da5fa620d338be2c2bc6e7e79a9))
* **internal:** allow streams to also be unwrapped on a per-row basis ([85fbc15](https://github.com/turbopuffer/turbopuffer-ruby/commit/85fbc151fba8e0262a5ae106beecaa6e8eb310c7))

## 0.1.0-alpha.2 (2025-06-14)

Full Changelog: [v0.1.0-alpha.1...v0.1.0-alpha.2](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.1.0-alpha.1...v0.1.0-alpha.2)

### Features

* add namespace resource and example ([5340ac0](https://github.com/turbopuffer/turbopuffer-ruby/commit/5340ac0b02ccf08dc23df33b1e75ccaa0d7c4ee7))


### Chores

* sync repo ([816cc8d](https://github.com/turbopuffer/turbopuffer-ruby/commit/816cc8d9a8ac706c77023e7833c2cad49bc63357))

## 0.1.0-alpha.1 (2025-06-14)

Full Changelog: [v0.0.1-alpha.0...v0.1.0-alpha.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v0.0.1-alpha.0...v0.1.0-alpha.1)

### Features

* add namespace resource and example ([f72d1f8](https://github.com/turbopuffer/turbopuffer-ruby/commit/f72d1f8d4bdb726f1a05b70be104eff825913fe9))


### Chores

* configure new SDK language ([80e0005](https://github.com/turbopuffer/turbopuffer-ruby/commit/80e0005caa84cf6b8d120f78c2d13245d7b2db48))
* sync repo ([3498e80](https://github.com/turbopuffer/turbopuffer-ruby/commit/3498e802bc2ae9cfe2292b33c803a7762999a5ac))
