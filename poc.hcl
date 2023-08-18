table "auth" "address" {
  schema = schema.auth
  column "id" {
    null    = false
    type    = uuid
    default = sql("uuid_generate_v4()")
  }
  primary_key {
    columns = [column.id]
  }
}
table "email_token" {
  schema = schema.auth
  column "id" {
    null    = false
    type    = uuid
    default = sql("uuid_generate_v4()")
  }
  column "user_id" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "email_token_user_id_foreign" {
    columns     = [column.user_id]
    ref_columns = [table.user.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
table "user" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  primary_key {
    columns = [column.id]
  }
}
table "user" "address" {
  schema = schema.user
  column "uuid" {
    null    = false
    type    = uuid
    default = sql("uuid_generate_v4()")
  }
  column "user_id" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.uuid]
  }
  foreign_key "address_user_id_foreign" {
    columns     = [column.user_id]
    ref_columns = [table.user.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
schema "auth" {
}
schema "public" {
  comment = "standard public schema"
}
schema "user" {
}
