# Changelog

## 2.0.0 (2026-05-10)

Full Changelog: [v2.0.0-alpha.4...v2.0.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v2.0.0-alpha.4...v2.0.0)

### Documentation

* document v2.0 breaking changes in UPGRADING.md ([083dd60](https://github.com/turbopuffer/turbopuffer-ruby/commit/083dd60d68b364c9dcf57f48761fada93e50213a))

## 2.0.0-alpha.4 (2026-05-10)

Full Changelog: [v2.0.0-alpha.3...v2.0.0-alpha.4](https://github.com/turbopuffer/turbopuffer-ruby/compare/v2.0.0-alpha.3...v2.0.0-alpha.4)

### Features

* spec: rename RankByVector/RankBySparseVector to RankByAnn/RankBySparseKnn ([a3b9c2c](https://github.com/turbopuffer/turbopuffer-ruby/commit/a3b9c2c2eb19716ff6a7ce5da86ee6d6901420ea))

## 2.0.0-alpha.3 (2026-05-08)

Full Changelog: [v2.0.0-alpha.2...v2.0.0-alpha.3](https://github.com/turbopuffer/turbopuffer-ruby/compare/v2.0.0-alpha.2...v2.0.0-alpha.3)

### Features

* spec: move update_metadata to v1 ([531fec9](https://github.com/turbopuffer/turbopuffer-ruby/commit/531fec94c2331f2361af31b5158031a56d23cef1))

## 2.0.0-alpha.2 (2026-04-29)

Full Changelog: [v2.0.0-alpha.1...v2.0.0-alpha.2](https://github.com/turbopuffer/turbopuffer-ruby/compare/v2.0.0-alpha.1...v2.0.0-alpha.2)

### Features

* Spec: Add sparse_distance_metric to the list of models. ([81f2998](https://github.com/turbopuffer/turbopuffer-ruby/commit/81f29982fb72e5f90923a35975841633b40aacc5))

## 2.0.0-alpha.1 (2026-04-29)

Full Changelog: [v1.19.0...v2.0.0-alpha.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.19.0...v2.0.0-alpha.1)

### Features

* Add sparse vectors to the spec. ([060434a](https://github.com/turbopuffer/turbopuffer-ruby/commit/060434a1516b678fdf8090b9c7d37c9b9102c3f3))
* Enable Stainless normalizer v2 while keeping Query inlined ([20d751b](https://github.com/turbopuffer/turbopuffer-ruby/commit/20d751b10ff3a74dfc27f5f5baf4ac41ee50f71d))
* Require `fuzzy: true` in the schema to use the `Fuzzy` filter ([7408995](https://github.com/turbopuffer/turbopuffer-ruby/commit/7408995fefd4c32638309feefe39e1c4d474213b))
* set up branchFrom and copyFrom sugar in the OpenAPI spec ([3b0df07](https://github.com/turbopuffer/turbopuffer-ruby/commit/3b0df076ee081ed3ddf129be8762d683a949845c))
* spec: flatten branchFrom/copyFrom sugar endpoint params ([06214bc](https://github.com/turbopuffer/turbopuffer-ruby/commit/06214bcbded87f2c214b3fc7b2cf2309540b197b))
* spec: update OpenAPI spec for v2 encryption API ([0c2654f](https://github.com/turbopuffer/turbopuffer-ruby/commit/0c2654fdb779231b867c4c40f9ff9e904601ca3c))
* support setting headers via env ([a0c4d53](https://github.com/turbopuffer/turbopuffer-ruby/commit/a0c4d53342da77dfbf07f60350246ab418926cff))


### Bug Fixes

* multipart encoding for file arrays ([bca18a3](https://github.com/turbopuffer/turbopuffer-ruby/commit/bca18a3d40304187b478ec130b274316fb95125a))


### Chores

* **internal:** more robust bootstrap script ([0b727d5](https://github.com/turbopuffer/turbopuffer-ruby/commit/0b727d5f42db0363d4143b8a912621c2c892c93f))

## 1.19.0 (2026-04-06)

Full Changelog: [v1.18.0...v1.19.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.18.0...v1.19.0)

### Features

* add update_metadata method to configure pinning ([f59a80b](https://github.com/turbopuffer/turbopuffer-ruby/commit/f59a80b8ff95b181a07d7bf2feb9715bf6ed2080))
* docs for glob/regex acceleration ([bafcf09](https://github.com/turbopuffer/turbopuffer-ruby/commit/bafcf09b3b25db23394a76cf6acb688f471a35ea))
* Multiple Vector Columns Docs ([76392ee](https://github.com/turbopuffer/turbopuffer-ruby/commit/76392ee17ea6ea2d177b7002ca791c27bff394d6))
* spec: include pinning status in /metadata response ([0ff4fa4](https://github.com/turbopuffer/turbopuffer-ruby/commit/0ff4fa4877dea26f3c5786891632b060e97ad7a2))


### Bug Fixes

* align path encoding with RFC 3986 section 3.3 ([77633f8](https://github.com/turbopuffer/turbopuffer-ruby/commit/77633f885d255631ce1d4b48075c87f5120973ab))
* **internal:** correct multipart form field name encoding ([7f54d40](https://github.com/turbopuffer/turbopuffer-ruby/commit/7f54d4035b422d568d640ad74d0a311135743927))
* variable name typo ([7b17a7a](https://github.com/turbopuffer/turbopuffer-ruby/commit/7b17a7a9830198e0ffa46c406bdf87ea865f5863))


### Chores

* **ci:** skip lint on metadata-only changes ([016dab3](https://github.com/turbopuffer/turbopuffer-ruby/commit/016dab37b9e2e92fb14dfea9e814590f329a7cc5))
* **ci:** support opting out of skipping builds on metadata-only commits ([afc1d7d](https://github.com/turbopuffer/turbopuffer-ruby/commit/afc1d7d3f532ac4d79b73a171308d627e14afd68))
* **internal:** update gitignore ([cb07b77](https://github.com/turbopuffer/turbopuffer-ruby/commit/cb07b772afcb6337e032217f724cc9d121004adc))

## 1.18.0 (2026-03-20)

Full Changelog: [v1.17.0...v1.18.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.17.0...v1.18.0)

### Features

* spec: disable CopyFromNamespace syntax sugar in Go ([93d9e4b](https://github.com/turbopuffer/turbopuffer-ruby/commit/93d9e4b4501ed7f444f2365b09baa5231349edf8))
* tpuf-engine: add verbose form of branch_from_namespace ([1ae049a](https://github.com/turbopuffer/turbopuffer-ruby/commit/1ae049ad623d519817d4d9b71228f5f4e7a55aec))

## 1.17.0 (2026-03-18)

Full Changelog: [v1.16.0...v1.17.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.16.0...v1.17.0)

### Features

* Response performance object ([c3ca5e3](https://github.com/turbopuffer/turbopuffer-ruby/commit/c3ca5e32f6cc4cfcdc29bc30e8cd11cd6e5550ef))
* tpuf: add branching to openapi spec ([7abdd2f](https://github.com/turbopuffer/turbopuffer-ruby/commit/7abdd2fb4f0fc1d2776dae20510b969e6c144b8b))


### Bug Fixes

* **client:** use higher retry delay precision ([bf9becb](https://github.com/turbopuffer/turbopuffer-ruby/commit/bf9becb1a4c0ef1d654e403b75032657a4dbde49))


### Chores

* **internal:** tweak CI branches ([f11cac6](https://github.com/turbopuffer/turbopuffer-ruby/commit/f11cac6b51f4c31c1c013537032ac67711c5e39d))

## 1.16.0 (2026-03-15)

Full Changelog: [v1.15.0...v1.16.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.15.0...v1.16.0)

### Features

* spec: host MCP on stainless ([8627719](https://github.com/turbopuffer/turbopuffer-ruby/commit/862771973985668cbb26e9ff89b8e32fd6a71c19))


### Chores

* **ci:** skip uploading artifacts on stainless-internal branches ([00cde42](https://github.com/turbopuffer/turbopuffer-ruby/commit/00cde42296d0cd795c1dfebf938a40f47285e1b6))

## 1.15.0 (2026-03-03)

Full Changelog: [v1.14.1...v1.15.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.14.1...v1.15.0)

### Features

* Remove `queries` from recall endpoint ([04d1dcd](https://github.com/turbopuffer/turbopuffer-ruby/commit/04d1dcd4e57ff0ba0a278011fa7d3834f3fec681))


### Bug Fixes

* **client:** serialize query parameters properly ([2b88e7d](https://github.com/turbopuffer/turbopuffer-ruby/commit/2b88e7dcb9c4b09eee1019993a01e6818102357c))
* properly mock time in ruby ci tests ([1a1f81d](https://github.com/turbopuffer/turbopuffer-ruby/commit/1a1f81d3952a0e040ecf572724152ebd76ad6092))


### Chores

* **ci:** add build step ([7b0fe2f](https://github.com/turbopuffer/turbopuffer-ruby/commit/7b0fe2ff926fe87953963e314fc9534ce243fce0))

## 1.14.1 (2026-02-19)

Full Changelog: [v1.14.0...v1.14.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.14.0...v1.14.1)

### Chores

* **internal:** remove mock server code ([073b9d0](https://github.com/turbopuffer/turbopuffer-ruby/commit/073b9d07da2a20d0313a9bb7aaa1233f08d3cd32))
* update mock server docs ([50a7ba1](https://github.com/turbopuffer/turbopuffer-ruby/commit/50a7ba122d8268837cb64bb653f9e81ba945cec5))

## 1.14.0 (2026-02-17)

Full Changelog: [v1.13.0...v1.14.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.13.0...v1.14.0)

### Features

* Add ranking-by-attribute to the spec. ([7341bcb](https://github.com/turbopuffer/turbopuffer-ruby/commit/7341bcb0b8de0c9652e60788db87163787762275))

## 1.13.0 (2026-02-08)

Full Changelog: [v1.12.2...v1.13.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.12.2...v1.13.0)

### Features

* add support for `limit` query parameter ([e7de801](https://github.com/turbopuffer/turbopuffer-ruby/commit/e7de80171a0d67759c0f04d15bf1f47f4bde6a6f))
* spec: clean up limit codegen ([383ab43](https://github.com/turbopuffer/turbopuffer-ruby/commit/383ab4339dd079c33d01c1ef53c470be58994544))

## 1.12.2 (2026-02-06)

Full Changelog: [v1.12.1...v1.12.2](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.12.1...v1.12.2)

### Bug Fixes

* **client:** loosen json header parsing ([93077e3](https://github.com/turbopuffer/turbopuffer-ruby/commit/93077e35351b42ec7f90e4817f65af7bf34bf443))

## 1.12.1 (2026-02-04)

Full Changelog: [v1.12.0...v1.12.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.12.0...v1.12.1)

### Chores

* **docs:** remove www prefix ([ffdfaf2](https://github.com/turbopuffer/turbopuffer-ruby/commit/ffdfaf26086a5f39be1adabb62dd361f3773fae4))

## 1.12.0 (2026-02-03)

Full Changelog: [v1.11.2...v1.12.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.11.2...v1.12.0)

### Features

* ContainsAnyToken last_as_prefix docs ([c8c63c7](https://github.com/turbopuffer/turbopuffer-ruby/commit/c8c63c787618c2cd65d894c57a234c4e11632a45))

## 1.11.2 (2026-02-02)

Full Changelog: [v1.11.1...v1.11.2](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.11.1...v1.11.2)

### Bug Fixes

* **client:** always add content-length to post body, even when empty ([ccd1efa](https://github.com/turbopuffer/turbopuffer-ruby/commit/ccd1efabdea8c75198f6db192883b4ba577be570))

## 1.11.1 (2026-01-28)

Full Changelog: [v1.11.0...v1.11.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.11.0...v1.11.1)

### Bug Fixes

* **docs:** fix mcp installation instructions for remote servers ([754db38](https://github.com/turbopuffer/turbopuffer-ruby/commit/754db38608cb849745555b57ecfab7ebff7e357c))

## 1.11.0 (2026-01-22)

Full Changelog: [v1.10.1...v1.11.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.10.1...v1.11.0)

### Features

* [TPUF-1097] tpuf: return failed IDs for conditional writes ([5b8d225](https://github.com/turbopuffer/turbopuffer-ruby/commit/5b8d2252d81caecd59c3d44458def2a107a263ed))
* Apigen integration ([11ae24b](https://github.com/turbopuffer/turbopuffer-ruby/commit/11ae24be6ffab51d5676abca1e5082a962037ccd))
* disable response compression by default ([#34](https://github.com/turbopuffer/turbopuffer-ruby/issues/34)) ([2ca1437](https://github.com/turbopuffer/turbopuffer-ruby/commit/2ca143712013e6eab35e9de8847ad7e644dbbf58))


### Chores

* configure new SDK language ([abc9dfe](https://github.com/turbopuffer/turbopuffer-ruby/commit/abc9dfe9d94f2d3d5cda214f1c9f4625a002cdb1))
* fix typo in descriptions ([5ce373b](https://github.com/turbopuffer/turbopuffer-ruby/commit/5ce373b8c0de6f51917446464420cb51c021c067))
* **internal:** update `actions/checkout` version ([09e5d5c](https://github.com/turbopuffer/turbopuffer-ruby/commit/09e5d5c35c7e9254227e3c4005849543c4f51b9e))

## 1.10.1 (2026-01-09)

Full Changelog: [v1.10.0...v1.10.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.10.0...v1.10.1)

### Chores

* **internal:** codegen related update ([9e7e7d2](https://github.com/turbopuffer/turbopuffer-ruby/commit/9e7e7d266eacb75f33f4de588cfc0506be914e6b))
* move `cgi` into dependencies for ruby 4 ([1aeb65f](https://github.com/turbopuffer/turbopuffer-ruby/commit/1aeb65f39a5ea6ee889d01c3b3cf98546739fd27))

## 1.10.0 (2025-12-18)

Full Changelog: [v1.9.1...v1.10.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.9.1...v1.10.0)

### Features

* add word_v3 to the spec ([b484b4b](https://github.com/turbopuffer/turbopuffer-ruby/commit/b484b4b23f7ada10116c46ccbc3ed5476077eea4))


### Bug Fixes

* calling `break` out of streams should be instantaneous ([42f9fe1](https://github.com/turbopuffer/turbopuffer-ruby/commit/42f9fe1d5160bf02e7299db28cf3d45630dfabe0))
* issue where json.parse errors when receiving HTTP 204 with nobody ([fcbd409](https://github.com/turbopuffer/turbopuffer-ruby/commit/fcbd409ff069545dffc700c4c05ace36d6c39fe9))


### Chores

* codegen updates ([fef9366](https://github.com/turbopuffer/turbopuffer-ruby/commit/fef9366834e72a7b966aa0695718240026b44ebf))

## 1.9.1 (2025-12-02)

Full Changelog: [v1.9.0...v1.9.1](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.9.0...v1.9.1)

### Documentation

* add cross-region copy_from_namespace to write API docs ([bf6a887](https://github.com/turbopuffer/turbopuffer-ruby/commit/bf6a8873718ce040cf6677bca238069fff8a4950))

## 1.9.0 (2025-12-02)

Full Changelog: [v1.8.0...v1.9.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.8.0...v1.9.0)

### Features

* sdks: add &lt;patch|delete&gt;_by_filter_allow_partial options ([cd557aa](https://github.com/turbopuffer/turbopuffer-ruby/commit/cd557aaa7482c6d23a744d582e4f377616c2078f))

## 1.8.0 (2025-11-25)

Full Changelog: [v1.7.0...v1.8.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.7.0...v1.8.0)

### Features

* site: add ascii_folding to docs and SDKs ([3559081](https://github.com/turbopuffer/turbopuffer-ruby/commit/3559081d051884e7ce9b926cd87cedcdda4f8d31))


### Chores

* explicitly require "base64" gem ([eff4748](https://github.com/turbopuffer/turbopuffer-ruby/commit/eff47486ca1e5fa6742cd3f40a17822f2499429a))

## 1.7.0 (2025-11-17)

Full Changelog: [v1.6.0...v1.7.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.6.0...v1.7.0)

### Features

* Allow for a CMEK key to be specified in copy_from_namespace ([5c29fe0](https://github.com/turbopuffer/turbopuffer-ruby/commit/5c29fe01f4fb0e9795d92e7c0d27fbc3fc9c2c52))
* spec: add support for cross-org CFN to SDKs ([eb1028c](https://github.com/turbopuffer/turbopuffer-ruby/commit/eb1028cf9c62e50a1d62866eb399a51fd12424e8))

## 1.6.0 (2025-11-06)

Full Changelog: [v1.5.0...v1.6.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.5.0...v1.6.0)

### Features

* Add vector attribute schema to metadata endpoint ([a509e47](https://github.com/turbopuffer/turbopuffer-ruby/commit/a509e479bc8fdeb6a72b39703636d1ccc331274e))
* handle thread interrupts in the core HTTP client ([ad531ac](https://github.com/turbopuffer/turbopuffer-ruby/commit/ad531ac4776d6445a23033601d7e46900f8824bc))
* Make `type` required on `AttributeSchemaConfig` ([c9300f6](https://github.com/turbopuffer/turbopuffer-ruby/commit/c9300f621999c6937d16c363ba7bdb423605a825))
* openapi: Fix stainless warnings ([1b7685f](https://github.com/turbopuffer/turbopuffer-ruby/commit/1b7685f30fd448eff4d17b809714ee01aa864ffd))
* openapi: name variants of `NamespaceMetadata.index` ([3b7cd24](https://github.com/turbopuffer/turbopuffer-ruby/commit/3b7cd24aa4f0fbb0c7f805d28f3c0e20726697de))


### Bug Fixes

* better thread safety via early initializing SSL store during HTTP client creation ([588faf7](https://github.com/turbopuffer/turbopuffer-ruby/commit/588faf74de4e21652afadd3eb557062818639cd6))


### Chores

* bump dependency version and update sorbet types ([b8c6c9a](https://github.com/turbopuffer/turbopuffer-ruby/commit/b8c6c9a56cf98142d6736e21b25fa3a541fafd47))
* **client:** send user-agent header ([dda4633](https://github.com/turbopuffer/turbopuffer-ruby/commit/dda4633d4fe3cfb16b90d5d4b32aa887ee810d52))

## 1.5.0 (2025-10-21)

Full Changelog: [v1.4.0...v1.5.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.4.0...v1.5.0)

### Features

* Metadata endpoint updates (e.g. to track indexing progress) ([4e631c7](https://github.com/turbopuffer/turbopuffer-ruby/commit/4e631c73375f784d2be0b7acb58c75d336cf1b2c))
* required for patch_by_filter :facepalm: ([f075887](https://github.com/turbopuffer/turbopuffer-ruby/commit/f0758879e11152cec2506509b5e558c1a6e143c8))
* stainless: add patch_by_filter ([da661c2](https://github.com/turbopuffer/turbopuffer-ruby/commit/da661c2d9bf4e8eaf3b70ea9430d22998188a02e))

## 1.4.0 (2025-10-15)

Full Changelog: [v1.3.0...v1.4.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.3.0...v1.4.0)

### Features

* Add float, []float and []bool to the list of valid types in the OpenAPI spec. ([0b809b3](https://github.com/turbopuffer/turbopuffer-ruby/commit/0b809b331e6a9e2121f440e26f47752ac2492459))
* Promote disable_backpressure to first-class Write property ([96b020d](https://github.com/turbopuffer/turbopuffer-ruby/commit/96b020d754bfcef28e285c4fdb6c33aff85c502b))


### Bug Fixes

* absolutely qualified uris should always override the default ([7497b77](https://github.com/turbopuffer/turbopuffer-ruby/commit/7497b770a28cea22db5059aa1506ea316a445dc0))
* always send `filename=...` for multipart requests where a file is expected ([155e39b](https://github.com/turbopuffer/turbopuffer-ruby/commit/155e39bd218655c654daa3815b67f373e7879730))
* coroutine leaks from connection pool ([be9b5c2](https://github.com/turbopuffer/turbopuffer-ruby/commit/be9b5c20c1d73951996136b5db5ffb0f004e7530))
* **internal:** use null byte as file separator in the fast formatting script ([c14be00](https://github.com/turbopuffer/turbopuffer-ruby/commit/c14be00b6284b7ba0c6167a1745b7f72077a7f3a))
* shorten multipart boundary sep to less than RFC specificed max length ([a128bba](https://github.com/turbopuffer/turbopuffer-ruby/commit/a128bba556db8a9a0143ee64577c4bd2f5bbf495))
* should not reuse buffers for `IO.copy_stream` interop ([e1d1753](https://github.com/turbopuffer/turbopuffer-ruby/commit/e1d1753c2dd07742617dfa605229581028fa34a8))


### Performance Improvements

* faster code formatting ([4b2b9b8](https://github.com/turbopuffer/turbopuffer-ruby/commit/4b2b9b87406f19b32283ed7ef4f5eea147b41ffb))


### Chores

* allow fast-format to use bsd sed as well ([9ba0c7d](https://github.com/turbopuffer/turbopuffer-ruby/commit/9ba0c7dd793d88af2e07d9ddfff1a2f49810ac65))
* ignore linter error for tests having large collections ([c6a3403](https://github.com/turbopuffer/turbopuffer-ruby/commit/c6a34033c8a3476ebd0197c5435e637c9619a506))


### Documentation

* hint_cache_warm also update header and openapi ([91dd701](https://github.com/turbopuffer/turbopuffer-ruby/commit/91dd701d5221b5e245de2a14af0c5afcbee58123))

## 1.3.0 (2025-09-19)

Full Changelog: [v1.2.0...v1.3.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.2.0...v1.3.0)

### Features

* add WithParams variant to BM25 and ContainsAllTokens ([77c2acc](https://github.com/turbopuffer/turbopuffer-ruby/commit/77c2accb00d21ffa454dddd3e381c99082358098))


### Chores

* do not install brew dependencies in ./scripts/bootstrap by default ([923bcb0](https://github.com/turbopuffer/turbopuffer-ruby/commit/923bcb05ff927173b23edc446b075f456df4b332))

## 1.2.0 (2025-09-17)

Full Changelog: [v1.1.0...v1.2.0](https://github.com/turbopuffer/turbopuffer-ruby/compare/v1.1.0...v1.2.0)

### Features

* expose response headers for both streams and errors ([05ceb63](https://github.com/turbopuffer/turbopuffer-ruby/commit/05ceb63799123872cae25afcc227ef3e5c0801b6))
* spec: move Ruby gem to `turbopuffer` ([c971adc](https://github.com/turbopuffer/turbopuffer-ruby/commit/c971adcdb550ecdb2796174dc823b7f611ba4686))

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
