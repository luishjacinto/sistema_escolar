--TABELAS
--CREATE DATABASE "sistema";

CREATE TABLE "curso" (
    "codigoCurso" int NOT NULL,
    "nomeCurso" varchar(40) NOT NULL,
    CONSTRAINT "cursoPK" PRIMARY KEY ("codigoCurso")
);

CREATE TABLE "disciplina" (
    "codigoDisciplina" int NOT NULL,
    "nomeDisciplina" varchar(40) NOT NULL,
    CONSTRAINT "disciplinaPK" PRIMARY KEY ("codigoDisciplina")
);

CREATE TABLE "CursoDisciplina" (
    "codigoCurso" int,
    "codigoDisciplina" int,
    CONSTRAINT "CursoDisciplinaPK" PRIMARY KEY ("codigoCurso","codigoDisciplina"),
    CONSTRAINT "CursoFK" FOREIGN KEY ("codigoCurso")
    REFERENCES "curso" ("codigoCurso")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT "DisciplinaFK" FOREIGN KEY ("codigoDisciplina")
    REFERENCES "disciplina" ("codigoDisciplina")
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE "professor" (
    "registro" int NOT NULL,
    "nome" varchar(40) NOT NULL,
    "cpf" varchar(14) NOT NULL,
  CONSTRAINT "professorPK" PRIMARY KEY ("registro")
);

CREATE TABLE "aluno" (
    "matricula" int NOT NULL,
    "nome" varchar(40) NOT NULL,
    "cpf" varchar(14) NOT NULL,
  CONSTRAINT "alunoPK" PRIMARY KEY ("matricula")
);

CREATE TABLE "turma" (
    "id" int,
    "ano" int,
    "registroProfessor" int,
    "codigoDisciplina" int,
    CONSTRAINT "turmaPK" PRIMARY KEY ("id"),
    CONSTRAINT "turmaProfessorFK" FOREIGN KEY ("registroProfessor")
    REFERENCES "professor" ("registro")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT "turmaDisciplinaFK" FOREIGN KEY ("codigoDisciplina")
    REFERENCES "disciplina" ("codigoDisciplina")
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE "TurmaAluno" (
    "matriculaAluno" int,
    "idTurma" int,
    "periodo_letivo" int,
    "nota" FLOAT,
    CONSTRAINT "TurmaAlunoPK" PRIMARY KEY ("matriculaAluno","idTurma","periodo_letivo"),
    CONSTRAINT "AlunoFK" FOREIGN KEY ("matriculaAluno")
    REFERENCES "aluno" ("matricula")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT "TurmaFK" FOREIGN KEY ("idTurma")
    REFERENCES "turma" ("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


--INSERTS ---------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
--INSERT CURSO -----------
INSERT INTO "curso" ("codigoCurso","nomeCurso")
VALUES (01,'Engenharia da Computação');

INSERT INTO "curso" ("codigoCurso","nomeCurso")
VALUES (02,'Engenharia Civil');

--INSERT DISCIPLINA -------------

INSERT INTO "disciplina" ("codigoDisciplina","nomeDisciplina")
VALUES (100,'Engenharia de Software');

INSERT INTO "disciplina" ("codigoDisciplina","nomeDisciplina")
VALUES (200,'Calculo I');

INSERT INTO "disciplina" ("codigoDisciplina","nomeDisciplina")
VALUES (201,'Calculo II');

INSERT INTO "disciplina" ("codigoDisciplina","nomeDisciplina")
VALUES (300,'Probabilidade e Estatística');

--INSERT CURSODISCIPLINA -----------
INSERT INTO "CursoDisciplina" ("codigoCurso","codigoDisciplina")
VALUES (01,100);

INSERT INTO "CursoDisciplina" ("codigoCurso","codigoDisciplina")
VALUES (01,200);

INSERT INTO "CursoDisciplina" ("codigoCurso","codigoDisciplina")
VALUES (02,201);

INSERT INTO "CursoDisciplina" ("codigoCurso","codigoDisciplina")
VALUES (02,200);

INSERT INTO "CursoDisciplina" ("codigoCurso","codigoDisciplina")
VALUES (01,300);

--INSERT PROFESSOR -----------
INSERT INTO "professor" ("registro","nome","cpf")
VALUES (10000,'Frederico Novaes','021.322.345-23');

INSERT INTO "professor" ("registro","nome","cpf")
VALUES (10001,'David Draiman' ,'011.666.345-66');

INSERT INTO "professor" ("registro","nome","cpf")
VALUES (10002,'Claudia Becker' ,'045.765.867-69');

--INSERT TURMA -------------
INSERT INTO "turma" ("id", "ano", "registroProfessor", "codigoDisciplina")
VALUES (100000, 2018, 10000, 100); --Frederico para E.S

INSERT INTO "turma" ("id", "ano", "registroProfessor", "codigoDisciplina")
VALUES (100001, 2018, 10001, 200); --David para Calculo I

INSERT INTO "turma" ("id", "ano", "registroProfessor", "codigoDisciplina")
VALUES (100002, 2018, 10001, 201); --David para Calculo II

INSERT INTO "turma" ("id", "ano", "registroProfessor", "codigoDisciplina")
VALUES (100003, 2018, 10002, 300); --Claudia para P. e Estatistica

--INSERT ALUNO -------------
INSERT INTO "aluno" ("matricula","nome","cpf")
VALUES (111000101,'Mario Antunes','024.321.345-23');

INSERT INTO "aluno" ("matricula","nome","cpf")
VALUES (111000102,'Karen Castro','082.871.233-73');

INSERT INTO "aluno" ("matricula","nome","cpf")
VALUES (111000103,'Yuri Martins','078.342.125-33');

--INSERT ALUNOTURMA -------------

--Mario
INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000101, 100000, 1, 6.5);

INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000101, 100000, 2, 8.2);

--Karen turma 1
INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000102, 100000, 1, 8.9);

INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000102, 100000, 2, 7.8);

--Karen turma 2
INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000102, 100001, 1, 4.2);

INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000102, 100001, 2, 5.1);

--Karen turma 3
INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000102, 100002, 1, 6.4);

INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000102, 100002, 2, 7.7);

--Yuri
INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000103, 100003, 1, 7.7);

INSERT INTO "TurmaAluno" ("matriculaAluno", "idTurma", "periodo_letivo", "nota")
VALUES (111000103, 100003, 2, 7.1);

--SELECTS ---------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

SELECT * FROM "curso"
WHERE "codigoCurso" = 01;

SELECT "nomeDisciplina"
FROM "disciplina"
WHERE "codigoDisciplina" = 200;

SELECT * FROM "CursoDisciplina"
WHERE "codigoCurso" = 01;

SELECT "codigoCurso", "disciplina"."nomeDisciplina"
FROM "CursoDisciplina"
INNER JOIN "disciplina" ON "CursoDisciplina"."codigoDisciplina" = "disciplina"."codigoDisciplina"
ORDER BY "nomeDisciplina";

SELECT "nome","cpf"
FROM "professor"
WHERE "registro" = 10001;

SELECT * FROM "turma"
WHERE "id" = 100003;

SELECT "id", "professor"."nome", "disciplina"."nomeDisciplina"
FROM "turma"
INNER JOIN "professor" ON "turma"."registroProfessor" = "professor"."registro"
INNER JOIN "disciplina" ON "turma"."codigoDisciplina" = "disciplina"."codigoDisciplina";

SELECT "nome","cpf"
FROM "aluno"
WHERE "matricula" = 111000103;

SELECT * FROM "TurmaAluno"
ORDER BY "matriculaAluno";

SELECT * FROM "TurmaAluno"
WHERE "matriculaAluno" = 111000101;

SELECT "idTurma", "matriculaAluno", "aluno"."nome", "periodo_letivo", "nota"
FROM "TurmaAluno"
INNER JOIN "aluno" ON "TurmaAluno"."matriculaAluno" = "aluno"."matricula"
WHERE "periodo_letivo" = 1 AND "idTurma" = 100000
ORDER BY "matriculaAluno";

SELECT "idTurma", "matriculaAluno", "aluno"."nome", "nota"
FROM "TurmaAluno"
INNER JOIN "aluno" ON "TurmaAluno"."matriculaAluno" = "aluno"."matricula"
WHERE "periodo_letivo" = 2 AND "nota" >= 7.0
ORDER BY "idTurma";