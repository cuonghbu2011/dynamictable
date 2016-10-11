CREATE TABLE [dbo].[tblScore]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [FromUserID] INT NULL, 
    [ToUserID] INT NULL, 
    [TotalStar] NCHAR(10) NULL
)
