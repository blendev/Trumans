Alter Proc sp_InsertDDPaymentDetails
@AccNum as nvarchar(100),
@Amount money,
@DDAccName nvarchar(100),
@DDBranchNum nvarchar(100),
@DDAccNum nvarchar(100)
as
Begin
Set nocount on
begin try
Insert into tblDirectDepositData values(@AccNum,@Amount,@DDAccName,@DDBranchNum,@DDAccNum,getdate(),null,null,null);
end try
begin catch

end catch
end

