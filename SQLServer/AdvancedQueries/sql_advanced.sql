﻿USE advanced;

IF OBJECT_ID('dbo.student', 'U') IS NOT NULL
  DROP TABLE dbo.student; 

CREATE TABLE student (
  id int NOT NULL IDENTITY,
  name nvarchar(255) NOT NULL DEFAULT '',
  email nvarchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) 


INSERT INTO student (name, email)
VALUES
	('João da Silva','joao@dasilva.com'),
	('Frederico José','fred@jose.com'),
	('Alberto Santos','alberto@santos.com'),
	('Renata Alonso','renata@alonso.com'),
	('Paulo da Silva','paulo@dasilva.com'),
	('Carlos Cunha','carlos@cunha.com'),
	('Paulo José','paulo@jose.com'),
	('Manoel Santos','manoel@santos.com'),
	('Renata Ferreira','renata@ferreira.com'),
	('Paula Soares','paula@soares.com'),
	('Jose da Silva','jose@dasilva.com'),
	('Danilo Cunha','danilo@cunha.com'),
	('Zilmira José','Zilmira@jose.com'),
	('Cristaldo Santos','cristaldo@santos.com'),
	('Osmir Ferreira','osmir@ferreira.com'),
	('Claudio Soares','claudio@soares.com');

IF OBJECT_ID('dbo.course', 'U') IS NOT NULL
  DROP TABLE dbo.course; 

CREATE TABLE course (
  id int  NOT NULL IDENTITY,
  name nvarchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
);



INSERT INTO course ( name)
VALUES
	('SQL e banco de dados'),
	('Desenvolvimento web com VRaptor'),
	('Scrum e métodos ágeis'),
	('C# e orientação a objetos'),
	('Java e orientação a objetos'),
	('Desenvolvimento mobile com iOS'),
	('Desenvolvimento mobile com Android'),
	('Ruby on Rails'),
	('PHP e MySql');


IF OBJECT_ID('dbo.exercise', 'U') IS NOT NULL
  DROP TABLE dbo.exercise; 

CREATE TABLE exercise (
  id int  NOT NULL IDENTITY,
  section_id int NOT NULL,
  question nvarchar(max) NOT NULL,
  official_answer nvarchar(max) NOT NULL,
  PRIMARY KEY (id)
); 

INSERT INTO exercise ( section_id, question, official_answer)
VALUES
	(1,'O que é um select?','Uma consulta que devolve resultados'),
	(1,'Como funciona um select?','select campos from tabela'),
	(2,'O que é um update?','serve pra alterar dados'),
	(2,'Perigos do update?','Nao pode esquecer de colocar where'),
	(3,'O que é um delete?','deleta uma linha do banco de dados'),
	(3,'Cuidados com ele?','nao pode esquecer do where'),
	(4,'o que eh um insert?','serve para inserir um dado no banco'),
	(4,'como funciona?','insert into (coluna1, coluna2) values (v1, v2)'),
	(5,'Como funciona a web?','requisicao e resposta'),
	(5,'Que linguagens posso ajudar?','varias, java, php, c#, etc'),
	(6,'O que eh MVC?','model view controller'),
	(6,'Frameworks que usam?','vraptor, spring mvc, struts, etc'),
	(7,'O que é a classe Result?','serve para lidar com o resultado'),
	(8,'O que é um interceptor?','eh como se fosse um filtro que eh executado antes'),
	(8,'quando usar?','tratamento de excecoes, conexao com o banco de dados'),
	(9,'o que eh iteracao','tempo que vc tem pra agregar valor'),
	(9,'qual tamanho bom?','de 2 a 4 semanas, segundo o scrum guide antigo'),
	(10,'o que sao retrospectiva?','reunioes onde a ideia eh melhorar o processo'),
	(10,'quando devemos fazer?','geralmente a cada iteracao'),
	(11,'o que eh a reuniao diaria?','uma pequena reuniao para informar a equipe sobre o andamento da iteracao'),
	(11,'quando fazemos?','uma vez por dia, em um horario fixo e pre definido'),
	(12,'o que eh kanban?','um metodo agil tb'),
	(12,'o que eh xp?','outro metodo agil'),
	(12,'tem outros?','lean, crystal, fdd'),
	(13,'o que eh a web?','eh a internet, ue'),
	(13,'como funciona a web?','requisicao e resposta'),
	(14,'o que eh o apache?','servidor que sabe trabalhar com HTTP'),
	(14,'java funciona?','sim, quando colocamos o tomcat junto com ele'),
	(15,'o que eh mysql','essa voce sabe, certo? :)'),
	(16,'o que eh deploy?','eh o processo de colocarmos a aplicacao no ar'),
	(16,'como faz?','em php, basta copiar os arquivos php, em java, basta copiar o jar');


IF OBJECT_ID('dbo.registration', 'U') IS NOT NULL
  DROP TABLE dbo.registration; 

CREATE TABLE registration (
  id int  NOT NULL IDENTITY,
  student_id int NOT NULL,
  course_id int NOT NULL,
  reg_date datetime2 NOT NULL,
  reg_type nvarchar(20) NOT NULL CHECK (reg_type IN ('PAGA_PF', 'PAGA_PJ', 'PAGA_CHEQUE', 'PAGA_BOLETO')),
  PRIMARY KEY (id)
); 


INSERT INTO registration (student_id, course_id, reg_date, reg_type)
VALUES
	(1,1,'2014-11-25 16:16:05','PAGA_PF'),
	(2,1,'2015-05-25 16:16:25','PAGA_PJ'),
	(3,3,'2015-07-21 16:16:30','PAGA_PF'),
	(4,4,'2015-05-15 16:15:35','PAGA_CHEQUE'),
	(7,1,'2015-03-10 16:15:35','PAGA_BOLETO'),
	(8,3,'2014-05-05 16:15:35','PAGA_PJ'),
	(9,2,'2015-02-07 16:15:35','PAGA_PF'),
	(10,7,'2015-01-15 16:15:35','PAGA_PJ'),
	(4,7,'2014-07-08 16:15:35','PAGA_PJ'),
	(8,1,'2014-06-01 16:15:35','PAGA_CHEQUE'),
	(1,4,'2014-11-10 16:15:35','PAGA_BOLETO'),
	(2,4,'2014-10-01 16:15:35','PAGA_PJ'),
	(3,4,'2014-11-15 16:15:35','PAGA_PF'),
	(2,2,'2015-01-04 16:15:35','PAGA_PJ');


IF OBJECT_ID('dbo.note', 'U') IS NOT NULL
  DROP TABLE dbo.note; 

CREATE TABLE note (
  id int  NOT NULL IDENTITY,
  answer_id int DEFAULT NULL,
  note decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (id)
) 

INSERT INTO note (answer_id, note)
VALUES
	(1,8),
	(2,0),
	(3,7),
	(4,6),
	(5,9),
	(6,10),
	(7,4),
	(8,4),
	(9,7),
	(10,8),
	(11,6),
	(12,7),
	(13,4),
	(14,9),
	(15,3),
	(16,5),
	(17,5),
	(18,5),
	(19,6),
	(20,8),
	(21,8),
	(22,9),
	(23,10),
	(24,2),
	(25,0),
	(26,1),
	(27,4);

IF OBJECT_ID('dbo.answer', 'U') IS NOT NULL
  DROP TABLE dbo.answer; 
  
CREATE TABLE answer (
  id int  NOT NULL IDENTITY,
  exercise_id int DEFAULT NULL,
  student_id int DEFAULT NULL,
  answer_dada nvarchar(max),
  PRIMARY KEY (id)
) 

INSERT INTO answer (exercise_id, student_id, answer_dada)
VALUES
	(1,1,'uma selecao'),
	(2,1,'ixi, nao sei'),
	(3,1,'alterar dados'),
	(4,1,'eskecer o where e alterar tudo'),
	(5,1,'apagar coisas'),
	(6,1,'tb nao pode eskecer o where'),
	(7,1,'inserir dados'),
	(1,2,'buscar dados'),
	(2,2,'select campos from tabela'),
	(13,2,'alterar coisas'),
	(4,2,'ixi, nao sei'),
	(16,3,'tempo pra fazer algo'),
	(17,3,'1 a 4 semanas'),
	(18,3,'melhoria do processo'),
	(19,3,'todo dia'),
	(20,3,'reuniao de status'),
	(21,3,'todo dia'),
	(22,3,'o quadro branco'),
	(23,3,'um metodo agil'),
	(24,3,'tem varios outros'),
	(25,4,'eh a internet'),
	(26,4,'browser faz requisicao, servidor manda resposta'),
	(27,4,'eh o servidor que lida com http'),
	(28,4,'nao sei'),
	(29,4,'banco de dados!'),
	(30,4,'eh colocar a app na internet'),
	(31,4,'depende da tecnologia, mas geralmente eh levar pra um servidor que ta na internet');


IF OBJECT_ID('dbo.section', 'U') IS NOT NULL
  DROP TABLE dbo.section; 

CREATE TABLE section (
  id int  NOT NULL IDENTITY,
  course_id int NOT NULL,
  title nvarchar(255) NOT NULL DEFAULT '',
  explanation nvarchar(max) NOT NULL,
  number int NOT NULL,
  PRIMARY KEY (id)
) 


INSERT INTO section (course_id, title, explanation, number)
VALUES
	(1,'Aprendendo o SELECT','explicacao do capitulo Aprendendo o SELECT',1),
	(1,'Aprendendo o UPDATE','explicacao do capitulo Aprendendo o UPDATE',2),
	(1,'Aprendendo o DELETE','explicacao do capitulo Aprendendo o DELETE',3),
	(1,'Aprendendo o INSERT','explicacao do capitulo Aprendendo o INSERT',4),
	(2,'O que é a Web?','explicacao do capitulo O que é a Web?',1),
	(2,'Entendendo o MVC','explicacao do capitulo Entendendo o MVC',2),
	(2,'O objeto Result','explicacao do capitulo O objeto Result',3),
	(2,'Interceptor','explicacao do capitulo Interceptor',4),
	(3,'Planejando a iteração','explicacao do capitulo Planejando a iteração',1),
	(3,'Retrospectivas','explicacao do capitulo Retrospectivas',2),
	(3,'Reunião Diária','explicacao do capitulo Reunião Diária',3),
	(3,'Kanban e XP','explicacao do capitulo Kanban e XP',4),
	(4,'Introdução a Web','explicacao do capitulo Introdução a Web',1),
	(4,'O servidor Apache','explicacao do capitulo O servidor Apache',2),
	(4,'Lidando com o MySql','explicacao do capitulo Lidando com o MySql',3),
	(4,'Instalando a aplicação','explicacao do capitulo Instalando a aplicação',4);