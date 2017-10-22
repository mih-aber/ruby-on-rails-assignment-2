CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "surname" varchar NOT NULL, "firstname" varchar NOT NULL, "phone" varchar, "grad_year" integer NOT NULL, "jobs" boolean DEFAULT 'f', "email" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_users_on_surname" ON "users" ("surname");
CREATE INDEX "index_users_on_email" ON "users" ("email");
CREATE TABLE "images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "photo_file_name" varchar, "photo_content_type" varchar, "photo_file_size" integer, "photo_updated_at" datetime);
CREATE INDEX "index_images_on_user_id" ON "images" ("user_id");
CREATE TABLE "user_details" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar, "salt" varchar, "crypted_password" varchar, "user_id" integer);
CREATE INDEX "index_user_details_on_user_id" ON "user_details" ("user_id");
CREATE TABLE "broadcasts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_broadcasts_on_user_id" ON "broadcasts" ("user_id");
CREATE TABLE "feeds" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "broadcasts_feeds" ("broadcast_id" integer, "feed_id" integer);
CREATE INDEX "index_broadcasts_feeds_on_broadcast_id" ON "broadcasts_feeds" ("broadcast_id");
CREATE INDEX "index_broadcasts_feeds_on_feed_id" ON "broadcasts_feeds" ("feed_id");
INSERT INTO schema_migrations (version) VALUES ('20160801132823'), ('20160809180122'), ('20160810133031'), ('20160811081528'), ('20160811081752'), ('20160811081932');


