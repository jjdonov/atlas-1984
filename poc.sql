create extension if not exists "uuid-ossp";
create schema "auth";
create schema "user";

create table "public"."user" (
  "id" serial NOT NULL,
  PRIMARY KEY ("id")
);

create table "auth"."email_token" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "user_id" integer NOT NULL,

  primary key("id"),
  constraint "email_token_user_id_foreign" Foreign Key ("user_id") REFERENCES "public"."user"(id)
);

create table "user"."address" (
  "uuid" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "user_id" integer NOT NULL,

  primary key ("uuid"),
  constraint "address_user_id_foreign" foreign key ("user_id") references "public"."user"(id)
);