# Upgrade guide

This document describes the notable breaking changes, if any, in each version of
the Ruby client. See [CHANGELOG.md](./CHANGELOG.md) for a comprehensive list of
changes.

## v2.0

- The `copy_from_namespace` parameter to the `write` method has been replaced
  with a dedicated `copy_from` method.

  Old:

  ```rb
  tpuf.namespace("ns").write(
    copy_from_namespace: {
      source_namespace: "src",
      source_region: "gcp-us-central1",
    },
  )
  ```

  New:

  ```rb
  tpuf.namespace("ns").copy_from(
    source_namespace: "src",
    source_region: "gcp-us-central1",
  )
  ```

- The `branch_from_namespace` parameter to the `write` method has been replaced
  with a dedicated `branch_from` method.

  Old:

  ```rb
  tpuf.namespace("ns").write(branch_from_namespace: "src")
  ```

  New:

  ```rb
  tpuf.namespace("ns").branch_from(source_namespace: "src")
  ```

- The `encryption` parameter has been restructured.

  Old:

  ```rb
  tpuf.namespace("ns").write(
    upsert_rows: [...],
    encryption: { cmek: { key_name: "..." } },
  )
  ```

  New:

  ```rb
  tpuf.namespace("ns").write(
    upsert_rows: [...],
    encryption: { mode: "customer-managed", key_name: "..." },
  )
  ```

  A new `{ mode: :default }` variant lets you migrate a namespace from CMEK
  to default encryption.
