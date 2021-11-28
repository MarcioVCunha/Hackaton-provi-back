CREATE TABLE "users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"type" integer NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	"phone" TEXT UNIQUE,
	"CRM" TEXT UNIQUE,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "sessions" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL UNIQUE,
	"token" uuid NOT NULL UNIQUE,
	CONSTRAINT "sessions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "medic" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL UNIQUE,
	"specialization" TEXT NOT NULL,
	"address" bigint NOT NULL,
	"address_number" bigint NOT NULL,
	CONSTRAINT "medic_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "medic_localization" (
	"id" serial NOT NULL,
	"medic_id" integer NOT NULL UNIQUE,
	"city_id" integer NOT NULL UNIQUE,
	"state_id" integer NOT NULL,
	CONSTRAINT "medic_localization_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "cities" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "states" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "accusations" (
	"id" serial NOT NULL,
	"user_id" integer,
	"accusation" TEXT NOT NULL,
	CONSTRAINT "accusations_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "patient_history" (
	"id" serial NOT NULL,
	"patient_id" integer NOT NULL,
	"history_id" integer NOT NULL,
	CONSTRAINT "patient_history_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "history" (
	"id" serial NOT NULL,
	"text" TEXT NOT NULL,
	CONSTRAINT "history_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "avaliations" (
	"id" serial NOT NULL,
	"medic_id" integer NOT NULL,
	"user_id" integer,
	"text" TEXT NOT NULL,
	CONSTRAINT "avaliations_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "preventions" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"text" TEXT NOT NULL,
	CONSTRAINT "preventions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "sessions" ADD CONSTRAINT "sessions_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "medic" ADD CONSTRAINT "medic_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "medic_localization" ADD CONSTRAINT "medic_localization_fk0" FOREIGN KEY ("medic_id") REFERENCES "medic"("id");
ALTER TABLE "medic_localization" ADD CONSTRAINT "medic_localization_fk1" FOREIGN KEY ("city_id") REFERENCES "cities"("id");
ALTER TABLE "medic_localization" ADD CONSTRAINT "medic_localization_fk2" FOREIGN KEY ("state_id") REFERENCES "states"("id");



ALTER TABLE "accusations" ADD CONSTRAINT "accusations_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "patient_history" ADD CONSTRAINT "patient_history_fk0" FOREIGN KEY ("patient_id") REFERENCES "users"("id");
ALTER TABLE "patient_history" ADD CONSTRAINT "patient_history_fk1" FOREIGN KEY ("history_id") REFERENCES "history"("id");


ALTER TABLE "avaliations" ADD CONSTRAINT "avaliations_fk0" FOREIGN KEY ("medic_id") REFERENCES "medic"("id");
ALTER TABLE "avaliations" ADD CONSTRAINT "avaliations_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");













