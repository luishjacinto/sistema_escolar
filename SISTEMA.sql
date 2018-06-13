--TABELAS

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
    "nota" boolean,
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