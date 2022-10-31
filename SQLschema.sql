CREATE TABLE "User" (
  "id" SERIAL PRIMARY KEY,
  "firstname" varchar,
  "lastname" varchar,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "country" varchar,
  "created_at" date DEFAULT (now())
);

CREATE TABLE "Post" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "content" varchar NOT NULL,
  "author" varchar NOT NULL,
  "author_id" int,
  "created_at" date DEFAULT (now())
);

CREATE TABLE "Comments" (
  "id" SERIAL PRIMARY KEY,
  "author_id" int,
  "author" varchar,
  "post_id" int,
  "content" varchar NOT NULL,
  "created_at" date DEFAULT (now())
);

CREATE TABLE "Category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" varchar,
  "created_at" date DEFAULT (now())
);

CREATE TABLE "rel_categoryPost" (
  "id" SERIAL PRIMARY KEY,
  "post_id" int,
  "category_id" int
);

ALTER TABLE "rel_categoryPost" ADD FOREIGN KEY ("post_id") REFERENCES "Post" ("id");

ALTER TABLE "rel_categoryPost" ADD FOREIGN KEY ("category_id") REFERENCES "Category" ("id");

ALTER TABLE "Comments" ADD FOREIGN KEY ("post_id") REFERENCES "Post" ("id");

ALTER TABLE "Comments" ADD FOREIGN KEY ("author_id") REFERENCES "User" ("id");

ALTER TABLE "Post" ADD FOREIGN KEY ("author_id") REFERENCES "User" ("id");

insert into "Category" (name, description)  values ('Noticias', 'Información política del País'), ('Comedia', 'Comedia para todas las edades'), ('Entretenimiento', 'Videojuegos y Resumenes de Películas');

insert into "User" (firstname, lastname, email, password, country) values ('Jean', 'Ticona', 'jean123@gmail.com', '123', 'PE'), ('Jose', 'Perez', 'jose123@gmail.com', '123', 'CO');

insert into "Post" (title, content, author, author_id) values ('Videojuegos 2022', 'Mi experiencia con los videojuegos','Jean',1);

insert into "Comments" (author_id, post_id, content, author) values (2,1, 'Una gran experiencia sin lugar a dudas', 'Jose');

insert into "Comments" (author_id, post_id, content, author) values (1,1, 'Gracias, se vendrán muchas más', 'Jean');