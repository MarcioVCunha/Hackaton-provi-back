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
	"address" TEXT NOT NULL,
	"address_number" integer NOT NULL,
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
	"birth_date" TEXT NOT NULL,
	"blood_type" TEXT NOT NULL,
	"height" TEXT NOT NULL,
	"weight" TEXT NOT NULL,
	"sex" TEXT NOT NULL,
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



CREATE TABLE "user_medication" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"medication_id" integer NOT NULL,
	CONSTRAINT "user_medication_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "medication" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"begin_date" TEXT NOT NULL,
	"dosage" TEXT NOT NULL,
	CONSTRAINT "medication_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "sessions" ADD CONSTRAINT "sessions_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "medic" ADD CONSTRAINT "medic_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "medic_localization" ADD CONSTRAINT "medic_localization_fk0" FOREIGN KEY ("medic_id") REFERENCES "medic"("user_id");
ALTER TABLE "medic_localization" ADD CONSTRAINT "medic_localization_fk1" FOREIGN KEY ("city_id") REFERENCES "cities"("id");
ALTER TABLE "medic_localization" ADD CONSTRAINT "medic_localization_fk2" FOREIGN KEY ("state_id") REFERENCES "states"("id");



ALTER TABLE "accusations" ADD CONSTRAINT "accusations_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "patient_history" ADD CONSTRAINT "patient_history_fk0" FOREIGN KEY ("patient_id") REFERENCES "users"("id");
ALTER TABLE "patient_history" ADD CONSTRAINT "patient_history_fk1" FOREIGN KEY ("history_id") REFERENCES "history"("id");


ALTER TABLE "avaliations" ADD CONSTRAINT "avaliations_fk0" FOREIGN KEY ("medic_id") REFERENCES "medic"("user_id");
ALTER TABLE "avaliations" ADD CONSTRAINT "avaliations_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");


ALTER TABLE "user_medication" ADD CONSTRAINT "user_medication_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");
ALTER TABLE "user_medication" ADD CONSTRAINT "user_medication_fk1" FOREIGN KEY ("medication_id") REFERENCES "medication"("id");




INSERT INTO preventions (name, text) VALUES ('Redesignação sexual e nutrição', 'A população LGBT sempre foi marginalizada em vários campos da sociedade, inclusive na área de saúde. Apesar de leis mais livres, o acesso aos serviços não está livre de discriminação, nem no setor público nem no privado. As últimas décadas foram de avanço com a instituição do Plano Nacional de Promoção da Cidadania e Direitos Humanos de LGBT e da Política Nacional de Saúde Integral de Lésbicas, Gays, Bissexuais.
Travestis e Transexuais. Mesmo assim, a implantação é lenta e o atendimento integral, gratuito, de qualidade e que atenda às demandas destes enorme grupo continua um desafio.');


INSERT INTO preventions (name, text) VALUES ('O que pessoas trans e não-binária precisam saber sobre métodos  anticoncepcionais?', 'As pessoas trans e não-binárias que estão fazendo o tratamento hormonal de afirmação de gênero podem pensar que não precisam usar métodos anticoncepcionais. No entanto, o tratamento hormonal isolado não protegerá as pessoas trans e não-binárias de uma gravidez.
A menstruação para de aparecer para a maioria dos homens trans e não-binários AFAB (pessoas que receberam a atribuição do gênero feminino ao nascer) depois de tomar testosterona por alguns meses (1), mas a ovulação (liberação de um óvulo do ovário) ainda pode acontecer mesmo que nunca tenham menstruado (2, 3). ');


INSERT INTO preventions (name, text) VALUES ('Como acontece a transição hormonal em pessoas transgênero?', 'A hormonioterapia é um tratamento seguido por muitas pessoas transgênero para modificar o seu corpo através do uso de hormônios, sejam eles masculinos ou femininos. No Brasil, as terapias hormonais são proibidas para menores de 16 anos, e as cirurgias só são liberadas a partir dos 18.
Leia o texto a seguir e entenda como acontece a transição hormonal, seus estágios e quais passos estão envolvidos. O objetivo da terapia hormonal é fazer a pessoa transgênero ficar mais à vontade consigo mesmo, de maneira física e psicológica. Isso também vai depender da visão do paciente e seus desejos, assim como os pacientes que não buscam a cirurgia de redesignação sexual, por exemplo.');



