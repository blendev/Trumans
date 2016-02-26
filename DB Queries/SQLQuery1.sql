Create Table tblDirectDepositData(
[intSeqID][int] identity(1,1) not null,
[AccountNumber][nvarchar](100) not null,
[Amount][money] not null,
[DDAccountName][nvarchar](100) not null,
[DDBranchNumber][nvarchar](100) not null,
[DDAccountNumber][nvarchar](100) not null,
[CreatedDate][DateTime] not null,
[ProcessedDate][DateTime],
[ProcessedBy][nvarchar](100),
[RefNo][nvarchar](100) 
)

