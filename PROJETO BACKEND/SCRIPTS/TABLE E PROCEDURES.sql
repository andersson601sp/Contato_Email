CREATE TABLE EMAIL(
  ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  NOME VARCHAR(30) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL
)

--PROCEDURE CONSULTA CONTATO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'CONSULTA_CONTATO')
DROP PROCEDURE CONSULTA_CONTATO
GO

CREATE PROCEDURE CONSULTA_CONTATO
AS
BEGIN
     SELECT * FROM  EMAIL	
END
GO

--PROCEDURE INSERT CONTATO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'INSERT_CONTATO')
DROP PROCEDURE INSERT_CONTATO
GO

CREATE PROCEDURE INSERT_CONTATO(@NOME VARCHAR(30), @EMAIL VARCHAR(50))
AS
BEGIN
  INSERT INTO EMAIL(NOME, EMAIL) VALUES(@NOME, @EMAIL)
END


--PROCEDURE UPDATE CONTATO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'UPDATE_CONTATO')
DROP PROCEDURE UPDATE_CONTATO
GO

CREATE PROCEDURE UPDATE_CONTATO(@ID INT, @NOME VARCHAR(30), @EMAIL VARCHAR(50))
AS
BEGIN
    UPDATE EMAIL SET NOME =  @NOME, EMAIL = @EMAIL WHERE ID =  @ID
END

--PROCEDURE DELETE CONTATO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'DELETE_CONTATO')
DROP PROCEDURE DELETE_CONTATO
GO

CREATE PROCEDURE DELETE_CONTATO(@ID INT)
AS
BEGIN
    DELETE FROM EMAIL WHERE ID =  @ID
END

