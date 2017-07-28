/****** Object:  ForeignKey [FK_AdvancedFields_AdvancedFieldsEntities]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFields_AdvancedFieldsEntities]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFields]'))
ALTER TABLE [dbo].[AdvancedFields] DROP CONSTRAINT [FK_AdvancedFields_AdvancedFieldsEntities]
GO
/****** Object:  ForeignKey [FK_AdvancedFields_AdvancedFieldsTypes]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFields_AdvancedFieldsTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFields]'))
ALTER TABLE [dbo].[AdvancedFields] DROP CONSTRAINT [FK_AdvancedFields_AdvancedFieldsTypes]
GO
/****** Object:  ForeignKey [FK_AdvancedFieldsCollections_AdvancedFields]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsCollections_AdvancedFields]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsCollections]'))
ALTER TABLE [dbo].[AdvancedFieldsCollections] DROP CONSTRAINT [FK_AdvancedFieldsCollections_AdvancedFields]
GO
/****** Object:  ForeignKey [FK_AdvancedFieldsValues_AdvancedFields]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsValues_AdvancedFields]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]'))
ALTER TABLE [dbo].[AdvancedFieldsValues] DROP CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFields]
GO
/****** Object:  ForeignKey [FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]'))
ALTER TABLE [dbo].[AdvancedFieldsValues] DROP CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]
GO
/****** Object:  ForeignKey [FK_AllowedRoleActions_ActionItems]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_ActionItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_ActionItems]
GO
/****** Object:  ForeignKey [FK_AllowedRoleActions_AllowedRoleActions]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_AllowedRoleActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_AllowedRoleActions]
GO
/****** Object:  ForeignKey [FK_AllowedRoleActions_Roles]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_Roles]
GO
/****** Object:  ForeignKey [FK_AllowedRoleMenus_Roles]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleMenus_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleMenus]'))
ALTER TABLE [dbo].[AllowedRoleMenus] DROP CONSTRAINT [FK_AllowedRoleMenus_Roles]
GO
/****** Object:  ForeignKey [FK_AmountCycles_Cycles]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AmountCycles_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AmountCycles]'))
ALTER TABLE [dbo].[AmountCycles] DROP CONSTRAINT [FK_AmountCycles_Cycles]
GO
/****** Object:  ForeignKey [FK_City_Districts]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Districts]') AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City] DROP CONSTRAINT [FK_City_Districts]
GO
/****** Object:  ForeignKey [FK_ClientBranchHistory_Branches]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] DROP CONSTRAINT [FK_ClientBranchHistory_Branches]
GO
/****** Object:  ForeignKey [FK_ClientBranchHistory_Tiers]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] DROP CONSTRAINT [FK_ClientBranchHistory_Tiers]
GO
/****** Object:  ForeignKey [FK_ClientBranchHistory_Users]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] DROP CONSTRAINT [FK_ClientBranchHistory_Users]
GO
/****** Object:  ForeignKey [FK_CollateralProperties_CollateralProducts]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralProperties_CollateralProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralProperties]'))
ALTER TABLE [dbo].[CollateralProperties] DROP CONSTRAINT [FK_CollateralProperties_CollateralProducts]
GO
/****** Object:  ForeignKey [FK_CollateralProperties_CollateralPropertyTypes]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralProperties_CollateralPropertyTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralProperties]'))
ALTER TABLE [dbo].[CollateralProperties] DROP CONSTRAINT [FK_CollateralProperties_CollateralPropertyTypes]
GO
/****** Object:  ForeignKey [FK_CollateralPropertyCollections_CollateralProperties]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyCollections_CollateralProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyCollections]'))
ALTER TABLE [dbo].[CollateralPropertyCollections] DROP CONSTRAINT [FK_CollateralPropertyCollections_CollateralProperties]
GO
/****** Object:  ForeignKey [FK_CollateralPropertyValues_CollateralProperties]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyValues_CollateralProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]'))
ALTER TABLE [dbo].[CollateralPropertyValues] DROP CONSTRAINT [FK_CollateralPropertyValues_CollateralProperties]
GO
/****** Object:  ForeignKey [FK_CollateralPropertyValues_CollateralsLinkContracts]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyValues_CollateralsLinkContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]'))
ALTER TABLE [dbo].[CollateralPropertyValues] DROP CONSTRAINT [FK_CollateralPropertyValues_CollateralsLinkContracts]
GO
/****** Object:  ForeignKey [FK_CollateralsLinkContracts_Contracts]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralsLinkContracts_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralsLinkContracts]'))
ALTER TABLE [dbo].[CollateralsLinkContracts] DROP CONSTRAINT [FK_CollateralsLinkContracts_Contracts]
GO
/****** Object:  ForeignKey [FK_ContractAssignHistory_Contracts]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] DROP CONSTRAINT [FK_ContractAssignHistory_Contracts]
GO
/****** Object:  ForeignKey [FK_ContractAssignHistory_Users]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] DROP CONSTRAINT [FK_ContractAssignHistory_Users]
GO
/****** Object:  ForeignKey [FK_ContractAssignHistory_Users1]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Users1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] DROP CONSTRAINT [FK_ContractAssignHistory_Users1]
GO
/****** Object:  ForeignKey [FK_ContractEvents_Contracts]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Contracts]
GO
/****** Object:  ForeignKey [FK_ContractEvents_LoanInterestAccruingEvents]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_LoanInterestAccruingEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_LoanInterestAccruingEvents]
GO
/****** Object:  ForeignKey [FK_ContractEvents_Tellers]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Tellers]
GO
/****** Object:  ForeignKey [FK_ContractEvents_Users]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Users]
GO
/****** Object:  ForeignKey [FK_Contracts_EconomicActivities]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_EconomicActivities]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_EconomicActivities]
GO
/****** Object:  ForeignKey [FK_Contracts_Projects]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_Projects]
GO
/****** Object:  ForeignKey [FK_Contracts_Villages]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_Villages]
GO
/****** Object:  ForeignKey [FK_CorporatePersonBelonging_Corporates]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorporatePersonBelonging_Corporates]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]'))
ALTER TABLE [dbo].[CorporatePersonBelonging] DROP CONSTRAINT [FK_CorporatePersonBelonging_Corporates]
GO
/****** Object:  ForeignKey [FK_CorporatePersonBelonging_Persons]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorporatePersonBelonging_Persons]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]'))
ALTER TABLE [dbo].[CorporatePersonBelonging] DROP CONSTRAINT [FK_CorporatePersonBelonging_Persons]
GO
/****** Object:  ForeignKey [FK_Corporates_DomainOfApplications]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Corporates_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[Corporates]'))
ALTER TABLE [dbo].[Corporates] DROP CONSTRAINT [FK_Corporates_DomainOfApplications]
GO
/****** Object:  ForeignKey [FK_Credit_Contracts]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Contracts]
GO
/****** Object:  ForeignKey [FK_Credit_InstallmentTypes]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_InstallmentTypes]
GO
/****** Object:  ForeignKey [FK_Credit_Packages]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Packages]
GO
/****** Object:  ForeignKey [FK_Credit_Temp_FundingLines]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Temp_FundingLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Temp_FundingLines]
GO
/****** Object:  ForeignKey [FK_Credit_Users]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Users]
GO
/****** Object:  ForeignKey [FK_CreditEntryFees_Credit]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditEntryFees_Credit]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditEntryFees]'))
ALTER TABLE [dbo].[CreditEntryFees] DROP CONSTRAINT [FK_CreditEntryFees_Credit]
GO
/****** Object:  ForeignKey [FK_Districts_Provinces]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Districts_Provinces]') AND parent_object_id = OBJECT_ID(N'[dbo].[Districts]'))
ALTER TABLE [dbo].[Districts] DROP CONSTRAINT [FK_Districts_Provinces]
GO
/****** Object:  ForeignKey [FK_DomainOfApplications_DomainOfApplications]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DomainOfApplications_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[EconomicActivities]'))
ALTER TABLE [dbo].[EconomicActivities] DROP CONSTRAINT [FK_DomainOfApplications_DomainOfApplications]
GO
/****** Object:  ForeignKey [FK_EventAttributes_EventTypes]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventAttributes_EventTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventAttributes]'))
ALTER TABLE [dbo].[EventAttributes] DROP CONSTRAINT [FK_EventAttributes_EventTypes]
GO
/****** Object:  ForeignKey [FK_ExoticInstallments_Exotics]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExoticInstallments_Exotics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExoticInstallments]'))
ALTER TABLE [dbo].[ExoticInstallments] DROP CONSTRAINT [FK_ExoticInstallments_Exotics]
GO
/****** Object:  ForeignKey [FK_FollowUp_Projects]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FollowUp_Projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[FollowUp]'))
ALTER TABLE [dbo].[FollowUp] DROP CONSTRAINT [FK_FollowUp_Projects]
GO
/****** Object:  ForeignKey [FK_FundingLineEvents_FundingLines]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FundingLineEvents_FundingLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[FundingLineEvents]'))
ALTER TABLE [dbo].[FundingLineEvents] DROP CONSTRAINT [FK_FundingLineEvents_FundingLines]
GO
/****** Object:  ForeignKey [FK_FundingLines_Currencies]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FundingLines_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[FundingLines]'))
ALTER TABLE [dbo].[FundingLines] DROP CONSTRAINT [FK_FundingLines_Currencies]
GO
/****** Object:  ForeignKey [FK_Groups_Tiers]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Groups_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Groups]'))
ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [FK_Groups_Tiers]
GO
/****** Object:  ForeignKey [FK_InstallmentHistory_ContractEvents]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstallmentHistory_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstallmentHistory]'))
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [FK_InstallmentHistory_ContractEvents]
GO
/****** Object:  ForeignKey [FK_Installments_Credit]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Installments_Credit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Installments]'))
ALTER TABLE [dbo].[Installments] DROP CONSTRAINT [FK_Installments_Credit]
GO
/****** Object:  ForeignKey [FK_LinkBranchesPaymentMethods_PaymentMethods]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkBranchesPaymentMethods_PaymentMethods]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkBranchesPaymentMethods]'))
ALTER TABLE [dbo].[LinkBranchesPaymentMethods] DROP CONSTRAINT [FK_LinkBranchesPaymentMethods_PaymentMethods]
GO
/****** Object:  ForeignKey [FK_LinkGuarantorCredit_Contracts]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkGuarantorCredit_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]'))
ALTER TABLE [dbo].[LinkGuarantorCredit] DROP CONSTRAINT [FK_LinkGuarantorCredit_Contracts]
GO
/****** Object:  ForeignKey [FK_LinkGuarantorCredit_Tiers]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkGuarantorCredit_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]'))
ALTER TABLE [dbo].[LinkGuarantorCredit] DROP CONSTRAINT [FK_LinkGuarantorCredit_Tiers]
GO
/****** Object:  ForeignKey [FK_LoanDisbursmentEvents_ContractEvents]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanDisbursmentEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanDisbursmentEvents]'))
ALTER TABLE [dbo].[LoanDisbursmentEvents] DROP CONSTRAINT [FK_LoanDisbursmentEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_LoansLinkSavingsBook_Contracts]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoansLinkSavingsBook_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]'))
ALTER TABLE [dbo].[LoansLinkSavingsBook] DROP CONSTRAINT [FK_LoansLinkSavingsBook_Contracts]
GO
/****** Object:  ForeignKey [FK_LoansLinkSavingsBook_SavingContracts]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoansLinkSavingsBook_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]'))
ALTER TABLE [dbo].[LoansLinkSavingsBook] DROP CONSTRAINT [FK_LoansLinkSavingsBook_SavingContracts]
GO
/****** Object:  ForeignKey [FK_OverdueEvents_ContractEvents]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OverdueEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[OverdueEvents]'))
ALTER TABLE [dbo].[OverdueEvents] DROP CONSTRAINT [FK_OverdueEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_Packages_Currencies]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Currencies]
GO
/****** Object:  ForeignKey [FK_Packages_Cycles]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Cycles]
GO
/****** Object:  ForeignKey [FK_Packages_Exotics]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Exotics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Exotics]
GO
/****** Object:  ForeignKey [FK_Packages_InstallmentTypes]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_InstallmentTypes]
GO
/****** Object:  ForeignKey [FK_PersonGroupBelonging_Persons1]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonGroupBelonging_Persons1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]'))
ALTER TABLE [dbo].[PersonGroupBelonging] DROP CONSTRAINT [FK_PersonGroupBelonging_Persons1]
GO
/****** Object:  ForeignKey [FK_PersonGroupCorrespondance_Groups]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonGroupCorrespondance_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]'))
ALTER TABLE [dbo].[PersonGroupBelonging] DROP CONSTRAINT [FK_PersonGroupCorrespondance_Groups]
GO
/****** Object:  ForeignKey [FK_Persons_DomainOfApplications]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Persons_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK_Persons_DomainOfApplications]
GO
/****** Object:  ForeignKey [FK_Persons_Tiers]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Persons_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK_Persons_Tiers]
GO
/****** Object:  ForeignKey [FK_Projects_Tiers]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Projects_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Projects]'))
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_Tiers]
GO
/****** Object:  ForeignKey [FK_ProvisionEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProvisionEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProvisionEvents]'))
ALTER TABLE [dbo].[ProvisionEvents] DROP CONSTRAINT [FK_ProvisionEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_RepaymentEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RepaymentEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[RepaymentEvents]'))
ALTER TABLE [dbo].[RepaymentEvents] DROP CONSTRAINT [FK_RepaymentEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_LoanPenaltyAccrualEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanPenaltyAccrualEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanPenaltyAccrualEvents]'))
ALTER TABLE [dbo].[LoanPenaltyAccrualEvents] DROP CONSTRAINT [FK_LoanPenaltyAccrualEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_AccrualInterestLoanEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccrualInterestLoanEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccrualInterestLoanEvents]'))
ALTER TABLE [dbo].[AccrualInterestLoanEvents] DROP CONSTRAINT [FK_AccrualInterestLoanEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_ReschedulingOfALoanEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReschedulingOfALoanEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReschedulingOfALoanEvents]'))
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [FK_ReschedulingOfALoanEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_SavingBookContract_SavingContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingBookContract_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingBookContracts]'))
ALTER TABLE [dbo].[SavingBookContracts] DROP CONSTRAINT [FK_SavingBookContract_SavingContracts]
GO
/****** Object:  ForeignKey [FK_SavingBookProducts_SavingProducts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingBookProducts_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingBookProducts]'))
ALTER TABLE [dbo].[SavingBookProducts] DROP CONSTRAINT [FK_SavingBookProducts_SavingProducts]
GO
/****** Object:  ForeignKey [FK_SavingContracts_Tiers]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingContracts_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_SavingContracts_Tiers]
GO
/****** Object:  ForeignKey [FK_SavingContracts_Users]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingContracts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_SavingContracts_Users]
GO
/****** Object:  ForeignKey [FK_Savings_SavingProducts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Savings_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_Savings_SavingProducts]
GO
/****** Object:  ForeignKey [FK_SavingDepositContract_SavingContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingDepositContract_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingDepositContracts]'))
ALTER TABLE [dbo].[SavingDepositContracts] DROP CONSTRAINT [FK_SavingDepositContract_SavingContracts]
GO
/****** Object:  ForeignKey [FK_SavingEvents_SavingContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_SavingContracts]
GO
/****** Object:  ForeignKey [FK_SavingEvents_Tellers]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_Tellers]
GO
/****** Object:  ForeignKey [FK_SavingEvents_Users]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_Users]
GO
/****** Object:  ForeignKey [FK_SavingProducts_Currencies]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingProducts_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingProducts]'))
ALTER TABLE [dbo].[SavingProducts] DROP CONSTRAINT [FK_SavingProducts_Currencies]
GO
/****** Object:  ForeignKey [FK_TellerEvents_Tellers]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TellerEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TellerEvents]'))
ALTER TABLE [dbo].[TellerEvents] DROP CONSTRAINT [FK_TellerEvents_Tellers]
GO
/****** Object:  ForeignKey [FK_Tellers_Branches]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tellers_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tellers]'))
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [FK_Tellers_Branches]
GO
/****** Object:  ForeignKey [FK_Tellers_Currencies]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tellers_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tellers]'))
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [FK_Tellers_Currencies]
GO
/****** Object:  ForeignKey [FK_TermDepositProducts_InstallmentTypes]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TermDepositProducts_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]'))
ALTER TABLE [dbo].[TermDepositProducts] DROP CONSTRAINT [FK_TermDepositProducts_InstallmentTypes]
GO
/****** Object:  ForeignKey [FK_TermDepositProducts_SavingProducts]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TermDepositProducts_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]'))
ALTER TABLE [dbo].[TermDepositProducts] DROP CONSTRAINT [FK_TermDepositProducts_SavingProducts]
GO
/****** Object:  ForeignKey [FK_Tiers_Branches]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Branches]
GO
/****** Object:  ForeignKey [FK_Tiers_Corporates]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Corporates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Corporates]
GO
/****** Object:  ForeignKey [FK_Tiers_Districts]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Districts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Districts]
GO
/****** Object:  ForeignKey [FK_Tiers_Districts1]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Districts1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Districts1]
GO
/****** Object:  ForeignKey [FK_TrancheEvents_ContractEvents]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrancheEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[TrancheEvents]'))
ALTER TABLE [dbo].[TrancheEvents] DROP CONSTRAINT [FK_TrancheEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_UserRole_Roles]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Roles]
GO
/****** Object:  ForeignKey [FK_UserRole_Users]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Users]
GO
/****** Object:  ForeignKey [FK_UsersBranches_Users]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersBranches_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersBranches]'))
ALTER TABLE [dbo].[UsersBranches] DROP CONSTRAINT [FK_UsersBranches_Users]
GO
/****** Object:  ForeignKey [FK_UsersSubordinates_Users]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersSubordinates_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersSubordinates]'))
ALTER TABLE [dbo].[UsersSubordinates] DROP CONSTRAINT [FK_UsersSubordinates_Users]
GO
/****** Object:  ForeignKey [FK_Villages_Users]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Villages_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Villages]'))
ALTER TABLE [dbo].[Villages] DROP CONSTRAINT [FK_Villages_Users]
GO
/****** Object:  ForeignKey [FK_VillagesAttendance_Villages]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VillagesAttendance_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[VillagesAttendance]'))
ALTER TABLE [dbo].[VillagesAttendance] DROP CONSTRAINT [FK_VillagesAttendance_Villages]
GO
/****** Object:  ForeignKey [FK_VillagesPersons_Villages]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VillagesPersons_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[VillagesPersons]'))
ALTER TABLE [dbo].[VillagesPersons] DROP CONSTRAINT [FK_VillagesPersons_Villages]
GO
/****** Object:  ForeignKey [FK_WriteOffEvents_ContractEvents]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WriteOffEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[WriteOffEvents]'))
ALTER TABLE [dbo].[WriteOffEvents] DROP CONSTRAINT [FK_WriteOffEvents_ContractEvents]
GO
/****** Object:  Check [CK_Packages]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [CK_Packages]

END
GO
/****** Object:  Check [CK_Persons_Sex]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Persons_Sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Persons_Sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [CK_Persons_Sex]

END
GO
/****** Object:  Check [CK_TiersTypeCode]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_TiersTypeCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_TiersTypeCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [CK_TiersTypeCode]

END
GO
/****** Object:  Table [dbo].[CollateralPropertyValues]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyValues_CollateralProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]'))
ALTER TABLE [dbo].[CollateralPropertyValues] DROP CONSTRAINT [FK_CollateralPropertyValues_CollateralProperties]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyValues_CollateralsLinkContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]'))
ALTER TABLE [dbo].[CollateralPropertyValues] DROP CONSTRAINT [FK_CollateralPropertyValues_CollateralsLinkContracts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]') AND type in (N'U'))
DROP TABLE [dbo].[CollateralPropertyValues]
GO
/****** Object:  Table [dbo].[CreditEntryFees]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditEntryFees_Credit]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditEntryFees]'))
ALTER TABLE [dbo].[CreditEntryFees] DROP CONSTRAINT [FK_CreditEntryFees_Credit]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditEntryFees]') AND type in (N'U'))
DROP TABLE [dbo].[CreditEntryFees]
GO
/****** Object:  Table [dbo].[InstallmentHistory]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstallmentHistory_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstallmentHistory]'))
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [FK_InstallmentHistory_ContractEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__paid___019419E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [DF__Installme__paid___019419E5]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__paid___02883E1E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [DF__Installme__paid___02883E1E]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__paid___037C6257]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [DF__Installme__paid___037C6257]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__fees___04708690]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [DF__Installme__fees___04708690]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__pendi__372950EB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [DF__Installme__pendi__372950EB]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__start__62464EB7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [DF__Installme__start__62464EB7]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installment__olb__633A72F0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InstallmentHistory] DROP CONSTRAINT [DF__Installment__olb__633A72F0]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InstallmentHistory]') AND type in (N'U'))
DROP TABLE [dbo].[InstallmentHistory]
GO
/****** Object:  Table [dbo].[Installments]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Installments_Credit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Installments]'))
ALTER TABLE [dbo].[Installments] DROP CONSTRAINT [FK_Installments_Credit]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Installments_fees_unpaid]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Installments] DROP CONSTRAINT [DF_Installments_fees_unpaid]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__paid___64F7DB37]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Installments] DROP CONSTRAINT [DF__Installme__paid___64F7DB37]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__pendi__36352CB2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Installments] DROP CONSTRAINT [DF__Installme__pendi__36352CB2]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installme__start__605E0645]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Installments] DROP CONSTRAINT [DF__Installme__start__605E0645]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Installment__olb__61522A7E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Installments] DROP CONSTRAINT [DF__Installment__olb__61522A7E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Installments]') AND type in (N'U'))
DROP TABLE [dbo].[Installments]
GO
/****** Object:  Table [dbo].[LoanDisbursmentEvents]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanDisbursmentEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanDisbursmentEvents]'))
ALTER TABLE [dbo].[LoanDisbursmentEvents] DROP CONSTRAINT [FK_LoanDisbursmentEvents_ContractEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_LoanDisbursmentEvents_amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LoanDisbursmentEvents] DROP CONSTRAINT [DF_LoanDisbursmentEvents_amount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_LoanDisbursmentEvents_fees]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LoanDisbursmentEvents] DROP CONSTRAINT [DF_LoanDisbursmentEvents_fees]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__LoanDisbu__inter__630F92C5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LoanDisbursmentEvents] DROP CONSTRAINT [DF__LoanDisbu__inter__630F92C5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanDisbursmentEvents]') AND type in (N'U'))
DROP TABLE [dbo].[LoanDisbursmentEvents]
GO
/****** Object:  Table [dbo].[OverdueEvents]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OverdueEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[OverdueEvents]'))
ALTER TABLE [dbo].[OverdueEvents] DROP CONSTRAINT [FK_OverdueEvents_ContractEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OverdueEvents_olb]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OverdueEvents] DROP CONSTRAINT [DF_OverdueEvents_olb]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OverdueEvents_overdue_days]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OverdueEvents] DROP CONSTRAINT [DF_OverdueEvents_overdue_days]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OverdueEvents]') AND type in (N'U'))
DROP TABLE [dbo].[OverdueEvents]
GO
/****** Object:  Table [dbo].[ProvisionEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProvisionEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProvisionEvents]'))
ALTER TABLE [dbo].[ProvisionEvents] DROP CONSTRAINT [FK_ProvisionEvents_ContractEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ProvisionEvents_amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProvisionEvents] DROP CONSTRAINT [DF_ProvisionEvents_amount]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProvisionEvents]') AND type in (N'U'))
DROP TABLE [dbo].[ProvisionEvents]
GO
/****** Object:  Table [dbo].[RepaymentEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RepaymentEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[RepaymentEvents]'))
ALTER TABLE [dbo].[RepaymentEvents] DROP CONSTRAINT [FK_RepaymentEvents_ContractEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Repayment__commi__34A9A997]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RepaymentEvents] DROP CONSTRAINT [DF__Repayment__commi__34A9A997]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Repayment__penal__359DCDD0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RepaymentEvents] DROP CONSTRAINT [DF__Repayment__penal__359DCDD0]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Repayment__payme__7E237356]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RepaymentEvents] DROP CONSTRAINT [DF__Repayment__payme__7E237356]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Repayment__calcu__40E55AEC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RepaymentEvents] DROP CONSTRAINT [DF__Repayment__calcu__40E55AEC]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Repayment__writt__41D97F25]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RepaymentEvents] DROP CONSTRAINT [DF__Repayment__writt__41D97F25]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Repayment__unpai__42CDA35E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RepaymentEvents] DROP CONSTRAINT [DF__Repayment__unpai__42CDA35E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RepaymentEvents]') AND type in (N'U'))
DROP TABLE [dbo].[RepaymentEvents]
GO
/****** Object:  Table [dbo].[ReschedulingOfALoanEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReschedulingOfALoanEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReschedulingOfALoanEvents]'))
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [FK_ReschedulingOfALoanEvents_ContractEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ReschedulingOfALoanEvents_amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [DF_ReschedulingOfALoanEvents_amount]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Reschedul__inter__6403B6FE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [DF__Reschedul__inter__6403B6FE]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Reschedul__nb_of__7251D655]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [DF__Reschedul__nb_of__7251D655]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Reschedul__nb_of__7345FA8E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [DF__Reschedul__nb_of__7345FA8E]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Reschedul__grace__4853DCED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [DF__Reschedul__grace__4853DCED]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Reschedul__charg__4A3C255F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [DF__Reschedul__charg__4A3C255F]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReschedulingOfALoanEvents]') AND type in (N'U'))
DROP TABLE [dbo].[ReschedulingOfALoanEvents]
GO
/****** Object:  Table [dbo].[TrancheEvents]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrancheEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[TrancheEvents]'))
ALTER TABLE [dbo].[TrancheEvents] DROP CONSTRAINT [FK_TrancheEvents_ContractEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__TrancheEv__inter__2F882F23]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TrancheEvents] DROP CONSTRAINT [DF__TrancheEv__inter__2F882F23]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrancheEvents]') AND type in (N'U'))
DROP TABLE [dbo].[TrancheEvents]
GO
/****** Object:  Table [dbo].[WriteOffEvents]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WriteOffEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[WriteOffEvents]'))
ALTER TABLE [dbo].[WriteOffEvents] DROP CONSTRAINT [FK_WriteOffEvents_ContractEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_WriteOffEvents_olb]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WriteOffEvents] DROP CONSTRAINT [DF_WriteOffEvents_olb]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_WriteOffEvents_past_due_days]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WriteOffEvents] DROP CONSTRAINT [DF_WriteOffEvents_past_due_days]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteOffEvents]') AND type in (N'U'))
DROP TABLE [dbo].[WriteOffEvents]
GO
/****** Object:  Table [dbo].[LoansLinkSavingsBook]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoansLinkSavingsBook_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]'))
ALTER TABLE [dbo].[LoansLinkSavingsBook] DROP CONSTRAINT [FK_LoansLinkSavingsBook_Contracts]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoansLinkSavingsBook_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]'))
ALTER TABLE [dbo].[LoansLinkSavingsBook] DROP CONSTRAINT [FK_LoansLinkSavingsBook_SavingContracts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]') AND type in (N'U'))
DROP TABLE [dbo].[LoansLinkSavingsBook]
GO
/****** Object:  Table [dbo].[LinkGuarantorCredit]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkGuarantorCredit_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]'))
ALTER TABLE [dbo].[LinkGuarantorCredit] DROP CONSTRAINT [FK_LinkGuarantorCredit_Contracts]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkGuarantorCredit_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]'))
ALTER TABLE [dbo].[LinkGuarantorCredit] DROP CONSTRAINT [FK_LinkGuarantorCredit_Tiers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]') AND type in (N'U'))
DROP TABLE [dbo].[LinkGuarantorCredit]
GO
/****** Object:  Table [dbo].[CollateralsLinkContracts]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralsLinkContracts_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralsLinkContracts]'))
ALTER TABLE [dbo].[CollateralsLinkContracts] DROP CONSTRAINT [FK_CollateralsLinkContracts_Contracts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralsLinkContracts]') AND type in (N'U'))
DROP TABLE [dbo].[CollateralsLinkContracts]
GO
/****** Object:  Table [dbo].[Credit]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Contracts]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_InstallmentTypes]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Packages]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Temp_FundingLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Temp_FundingLines]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Users]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Credit_synchronize]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [DF_Credit_synchronize]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Credit__interest__621B6E8C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [DF__Credit__interest__621B6E8C]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Credit__grace_pe__09B529F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [DF__Credit__grace_pe__09B529F1]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Credit__anticipa__1EB046D7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [DF__Credit__anticipa__1EB046D7]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Credit__anticipa__307C535C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [DF__Credit__anticipa__307C535C]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Credit__anticipa__31707795]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [DF__Credit__anticipa__31707795]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Credit__schedule__4C246DD1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [DF__Credit__schedule__4C246DD1]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Credit__insuranc__1506D8AE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [DF__Credit__insuranc__1506D8AE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Credit]') AND type in (N'U'))
DROP TABLE [dbo].[Credit]
GO
/****** Object:  Table [dbo].[ContractAssignHistory]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] DROP CONSTRAINT [FK_ContractAssignHistory_Contracts]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] DROP CONSTRAINT [FK_ContractAssignHistory_Users]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Users1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] DROP CONSTRAINT [FK_ContractAssignHistory_Users1]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContractAssignHistory_DateChanged]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ContractAssignHistory] DROP CONSTRAINT [DF_ContractAssignHistory_DateChanged]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ContractAssignHistory]
GO
/****** Object:  Table [dbo].[ContractEvents]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Contracts]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_LoanInterestAccruingEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_LoanInterestAccruingEvents]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Tellers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Users]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ContractE__entry__4B97F389]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [DF__ContractE__entry__4B97F389]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ContractE__is_ex__4C8C17C2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [DF__ContractE__is_ex__4C8C17C2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContractEvents]') AND type in (N'U'))
DROP TABLE [dbo].[ContractEvents]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_EconomicActivities]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_EconomicActivities]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_Projects]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_Villages]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Contracts_project_id]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [DF_Contracts_project_id]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Contracts_status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [DF_Contracts_status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contracts]') AND type in (N'U'))
DROP TABLE [dbo].[Contracts]
GO
/****** Object:  Table [dbo].[CorporatePersonBelonging]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorporatePersonBelonging_Corporates]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]'))
ALTER TABLE [dbo].[CorporatePersonBelonging] DROP CONSTRAINT [FK_CorporatePersonBelonging_Corporates]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorporatePersonBelonging_Persons]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]'))
ALTER TABLE [dbo].[CorporatePersonBelonging] DROP CONSTRAINT [FK_CorporatePersonBelonging_Persons]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]') AND type in (N'U'))
DROP TABLE [dbo].[CorporatePersonBelonging]
GO
/****** Object:  Table [dbo].[PersonGroupBelonging]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonGroupBelonging_Persons1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]'))
ALTER TABLE [dbo].[PersonGroupBelonging] DROP CONSTRAINT [FK_PersonGroupBelonging_Persons1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonGroupCorrespondance_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]'))
ALTER TABLE [dbo].[PersonGroupBelonging] DROP CONSTRAINT [FK_PersonGroupCorrespondance_Groups]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]') AND type in (N'U'))
DROP TABLE [dbo].[PersonGroupBelonging]
GO
/****** Object:  Table [dbo].[FollowUp]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FollowUp_Projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[FollowUp]'))
ALTER TABLE [dbo].[FollowUp] DROP CONSTRAINT [FK_FollowUp_Projects]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FollowUp]') AND type in (N'U'))
DROP TABLE [dbo].[FollowUp]
GO
/****** Object:  Table [dbo].[SavingDepositContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingDepositContract_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingDepositContracts]'))
ALTER TABLE [dbo].[SavingDepositContracts] DROP CONSTRAINT [FK_SavingDepositContract_SavingContracts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingDepositContracts]') AND type in (N'U'))
DROP TABLE [dbo].[SavingDepositContracts]
GO
/****** Object:  Table [dbo].[SavingEvents]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_SavingContracts]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_Tellers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_Users]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingEve__is_ex__505CA8A6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [DF__SavingEve__is_ex__505CA8A6]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingEve__pendi__5150CCDF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [DF__SavingEve__pendi__5150CCDF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingEvents]') AND type in (N'U'))
DROP TABLE [dbo].[SavingEvents]
GO
/****** Object:  Table [dbo].[SavingBookContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingBookContract_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingBookContracts]'))
ALTER TABLE [dbo].[SavingBookContracts] DROP CONSTRAINT [FK_SavingBookContract_SavingContracts]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingBoo__in_ov__018C5A49]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingBookContracts] DROP CONSTRAINT [DF__SavingBoo__in_ov__018C5A49]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingBoo__use_t__45AA1009]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingBookContracts] DROP CONSTRAINT [DF__SavingBoo__use_t__45AA1009]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[period_default]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingBookContracts] DROP CONSTRAINT [period_default]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingBookContracts]') AND type in (N'U'))
DROP TABLE [dbo].[SavingBookContracts]
GO
/****** Object:  Table [dbo].[SavingContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingContracts_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_SavingContracts_Tiers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingContracts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_SavingContracts_Users]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Savings_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_Savings_SavingProducts]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingCon__savin__3A6D6787]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [DF__SavingCon__savin__3A6D6787]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingCon__initi__10422391]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [DF__SavingCon__initi__10422391]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingCon__entry__113647CA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [DF__SavingCon__entry__113647CA]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingContracts]') AND type in (N'U'))
DROP TABLE [dbo].[SavingContracts]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Projects_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Projects]'))
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_Tiers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Projects]') AND type in (N'U'))
DROP TABLE [dbo].[Projects]
GO
/****** Object:  Table [dbo].[TellerEvents]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TellerEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TellerEvents]'))
ALTER TABLE [dbo].[TellerEvents] DROP CONSTRAINT [FK_TellerEvents_Tellers]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__TellerEve__is_ex__6616DF9B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TellerEvents] DROP CONSTRAINT [DF__TellerEve__is_ex__6616DF9B]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TellerEvents]') AND type in (N'U'))
DROP TABLE [dbo].[TellerEvents]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Persons_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK_Persons_DomainOfApplications]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Persons_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK_Persons_Tiers]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Persons_Sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [CK_Persons_Sex]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Persons_povertylevel_economiceducation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [DF_Persons_povertylevel_economiceducation]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persons]') AND type in (N'U'))
DROP TABLE [dbo].[Persons]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Groups_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Groups]'))
ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [FK_Groups_Tiers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
DROP TABLE [dbo].[Groups]
GO
/****** Object:  Table [dbo].[ClientBranchHistory]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] DROP CONSTRAINT [FK_ClientBranchHistory_Branches]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] DROP CONSTRAINT [FK_ClientBranchHistory_Tiers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] DROP CONSTRAINT [FK_ClientBranchHistory_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ClientBranchHistory]
GO
/****** Object:  Table [dbo].[AdvancedFieldsValues]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsValues_AdvancedFields]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]'))
ALTER TABLE [dbo].[AdvancedFieldsValues] DROP CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFields]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]'))
ALTER TABLE [dbo].[AdvancedFieldsValues] DROP CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]') AND type in (N'U'))
DROP TABLE [dbo].[AdvancedFieldsValues]
GO
/****** Object:  Table [dbo].[AdvancedFieldsCollections]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsCollections_AdvancedFields]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsCollections]'))
ALTER TABLE [dbo].[AdvancedFieldsCollections] DROP CONSTRAINT [FK_AdvancedFieldsCollections_AdvancedFields]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsCollections]') AND type in (N'U'))
DROP TABLE [dbo].[AdvancedFieldsCollections]
GO
/****** Object:  Table [dbo].[CollateralPropertyCollections]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyCollections_CollateralProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyCollections]'))
ALTER TABLE [dbo].[CollateralPropertyCollections] DROP CONSTRAINT [FK_CollateralPropertyCollections_CollateralProperties]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralPropertyCollections]') AND type in (N'U'))
DROP TABLE [dbo].[CollateralPropertyCollections]
GO
/****** Object:  Table [dbo].[City]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Districts]') AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City] DROP CONSTRAINT [FK_City_Districts]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__City__deleted__172E5549]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[City] DROP CONSTRAINT [DF__City__deleted__172E5549]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND type in (N'U'))
DROP TABLE [dbo].[City]
GO
/****** Object:  Table [dbo].[LinkBranchesPaymentMethods]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkBranchesPaymentMethods_PaymentMethods]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkBranchesPaymentMethods]'))
ALTER TABLE [dbo].[LinkBranchesPaymentMethods] DROP CONSTRAINT [FK_LinkBranchesPaymentMethods_PaymentMethods]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__LinkBranc__delet__4F337A43]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LinkBranchesPaymentMethods] DROP CONSTRAINT [DF__LinkBranc__delet__4F337A43]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__LinkBranch__date__50279E7C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LinkBranchesPaymentMethods] DROP CONSTRAINT [DF__LinkBranch__date__50279E7C]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__LinkBranc__accou__520FE6EE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LinkBranchesPaymentMethods] DROP CONSTRAINT [DF__LinkBranc__accou__520FE6EE]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LinkBranchesPaymentMethods]') AND type in (N'U'))
DROP TABLE [dbo].[LinkBranchesPaymentMethods]
GO
/****** Object:  Table [dbo].[FundingLineEvents]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FundingLineEvents_FundingLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[FundingLineEvents]'))
ALTER TABLE [dbo].[FundingLineEvents] DROP CONSTRAINT [FK_FundingLineEvents_FundingLines]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__FundingLi__fundi__5B6E70FD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FundingLineEvents] DROP CONSTRAINT [DF__FundingLi__fundi__5B6E70FD]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FundingLineEvents]') AND type in (N'U'))
DROP TABLE [dbo].[FundingLineEvents]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_EntryFees_is_deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EntryFees] DROP CONSTRAINT [DF_EntryFees_is_deleted]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__EntryFees__fee_i__05C4951E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EntryFees] DROP CONSTRAINT [DF__EntryFees__fee_i__05C4951E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntryFees]') AND type in (N'U'))
DROP TABLE [dbo].[EntryFees]
GO
/****** Object:  Table [dbo].[Tellers]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tellers_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tellers]'))
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [FK_Tellers_Branches]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tellers_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tellers]'))
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [FK_Tellers_Currencies]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Tellers__deleted__0B7D6E74]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [DF__Tellers__deleted__0B7D6E74]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Tellers__branch___4C570D98]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [DF__Tellers__branch___4C570D98]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tellers]') AND type in (N'U'))
DROP TABLE [dbo].[Tellers]
GO
/****** Object:  Table [dbo].[TermDepositProducts]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TermDepositProducts_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]'))
ALTER TABLE [dbo].[TermDepositProducts] DROP CONSTRAINT [FK_TermDepositProducts_InstallmentTypes]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TermDepositProducts_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]'))
ALTER TABLE [dbo].[TermDepositProducts] DROP CONSTRAINT [FK_TermDepositProducts_SavingProducts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]') AND type in (N'U'))
DROP TABLE [dbo].[TermDepositProducts]
GO
/****** Object:  Table [dbo].[VillagesAttendance]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VillagesAttendance_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[VillagesAttendance]'))
ALTER TABLE [dbo].[VillagesAttendance] DROP CONSTRAINT [FK_VillagesAttendance_Villages]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__VillagesA__atten__20788B5A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VillagesAttendance] DROP CONSTRAINT [DF__VillagesA__atten__20788B5A]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__VillagesA__loan___469E3442]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VillagesAttendance] DROP CONSTRAINT [DF__VillagesA__loan___469E3442]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VillagesAttendance]') AND type in (N'U'))
DROP TABLE [dbo].[VillagesAttendance]
GO
/****** Object:  Table [dbo].[VillagesPersons]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VillagesPersons_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[VillagesPersons]'))
ALTER TABLE [dbo].[VillagesPersons] DROP CONSTRAINT [FK_VillagesPersons_Villages]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__VillagesP__is_le__1CA7FA76]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VillagesPersons] DROP CONSTRAINT [DF__VillagesP__is_le__1CA7FA76]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__VillagesP__curre__1D9C1EAF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VillagesPersons] DROP CONSTRAINT [DF__VillagesP__curre__1D9C1EAF]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VillagesPersons]') AND type in (N'U'))
DROP TABLE [dbo].[VillagesPersons]
GO
/****** Object:  Table [dbo].[SavingBookProducts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingBookProducts_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingBookProducts]'))
ALTER TABLE [dbo].[SavingBookProducts] DROP CONSTRAINT [FK_SavingBookProducts_SavingProducts]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingBoo__manag__6F6DAA0E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingBookProducts] DROP CONSTRAINT [DF__SavingBoo__manag__6F6DAA0E]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingBoo__agio___00983610]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingBookProducts] DROP CONSTRAINT [DF__SavingBoo__agio___00983610]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingBoo__is_ib__0D65B6E6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingBookProducts] DROP CONSTRAINT [DF__SavingBoo__is_ib__0D65B6E6]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingBoo__use_t__43C1C797]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingBookProducts] DROP CONSTRAINT [DF__SavingBoo__use_t__43C1C797]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingBookProducts]') AND type in (N'U'))
DROP TABLE [dbo].[SavingBookProducts]
GO
/****** Object:  Table [dbo].[StandardBookings]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StandardBookings]') AND type in (N'U'))
DROP TABLE [dbo].[StandardBookings]
GO
/****** Object:  Table [dbo].[Tiers]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Branches]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Corporates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Corporates]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Districts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Districts]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Districts1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Districts1]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_TiersTypeCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [CK_TiersTypeCode]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tiers_loan_cycle]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [DF_Tiers_loan_cycle]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Tiers_status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [DF_Tiers_status]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Tiers__branch_id__6EE12FC6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [DF__Tiers__branch_id__6EE12FC6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tiers]') AND type in (N'U'))
DROP TABLE [dbo].[Tiers]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Roles]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
DROP TABLE [dbo].[UserRole]
GO
/****** Object:  Table [dbo].[SavingProducts]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingProducts_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingProducts]'))
ALTER TABLE [dbo].[SavingProducts] DROP CONSTRAINT [FK_SavingProducts_Currencies]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingPro__delet__5DC0CDC3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingProducts] DROP CONSTRAINT [DF__SavingPro__delet__5DC0CDC3]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__SavingPro__clien__5EB4F1FC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SavingProducts] DROP CONSTRAINT [DF__SavingPro__clien__5EB4F1FC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingProducts]') AND type in (N'U'))
DROP TABLE [dbo].[SavingProducts]
GO
/****** Object:  Table [dbo].[UsersBranches]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersBranches_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersBranches]'))
ALTER TABLE [dbo].[UsersBranches] DROP CONSTRAINT [FK_UsersBranches_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersBranches]') AND type in (N'U'))
DROP TABLE [dbo].[UsersBranches]
GO
/****** Object:  Table [dbo].[UsersSubordinates]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersSubordinates_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersSubordinates]'))
ALTER TABLE [dbo].[UsersSubordinates] DROP CONSTRAINT [FK_UsersSubordinates_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersSubordinates]') AND type in (N'U'))
DROP TABLE [dbo].[UsersSubordinates]
GO
/****** Object:  Table [dbo].[Villages]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Villages_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Villages]'))
ALTER TABLE [dbo].[Villages] DROP CONSTRAINT [FK_Villages_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Villages]') AND type in (N'U'))
DROP TABLE [dbo].[Villages]
GO
/****** Object:  Table [dbo].[EventAttributes]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventAttributes_EventTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventAttributes]'))
ALTER TABLE [dbo].[EventAttributes] DROP CONSTRAINT [FK_EventAttributes_EventTypes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventAttributes]') AND type in (N'U'))
DROP TABLE [dbo].[EventAttributes]
GO
/****** Object:  Table [dbo].[ExoticInstallments]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExoticInstallments_Exotics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExoticInstallments]'))
ALTER TABLE [dbo].[ExoticInstallments] DROP CONSTRAINT [FK_ExoticInstallments_Exotics]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExoticInstallments]') AND type in (N'U'))
DROP TABLE [dbo].[ExoticInstallments]
GO
/****** Object:  Table [dbo].[FundingLines]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FundingLines_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[FundingLines]'))
ALTER TABLE [dbo].[FundingLines] DROP CONSTRAINT [FK_FundingLines_Currencies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FundingLines]') AND type in (N'U'))
DROP TABLE [dbo].[FundingLines]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Districts_Provinces]') AND parent_object_id = OBJECT_ID(N'[dbo].[Districts]'))
ALTER TABLE [dbo].[Districts] DROP CONSTRAINT [FK_Districts_Provinces]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Districts__delet__18227982]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Districts] DROP CONSTRAINT [DF__Districts__delet__18227982]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Districts]') AND type in (N'U'))
DROP TABLE [dbo].[Districts]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Currencies]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Cycles]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Exotics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Exotics]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_InstallmentTypes]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [CK_Packages]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Tmp_Packa__delet__6F2063EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Tmp_Packa__delet__6F2063EF]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Packages_code]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF_Packages_code]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Tmp_Packa__clien__70148828]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Tmp_Packa__clien__70148828]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__roundi__07CCE17F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__roundi__07CCE17F]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__grace___08C105B8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__grace___08C105B8]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__antici__1CC7FE65]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__antici__1CC7FE65]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__antici__1DBC229E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__antici__1DBC229E]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__activa__3358C007]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__activa__3358C007]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__allow___4B304998]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__allow___4B304998]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__use_gu__4D18920A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__use_gu__4D18920A]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__set_se__4E0CB643]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__set_se__4E0CB643]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__percen__4F00DA7C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__percen__4F00DA7C]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__percen__4FF4FEB5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__percen__4FF4FEB5]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__percen__50E922EE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__percen__50E922EE]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__use_co__3B618BC0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__use_co__3B618BC0]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__insura__131E903C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__insura__131E903C]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__insura__1412B475]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__insura__1412B475]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Packages__use_en__3573A840]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [DF__Packages__use_en__3573A840]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Packages]') AND type in (N'U'))
DROP TABLE [dbo].[Packages]
GO
/****** Object:  Table [dbo].[CollateralProperties]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralProperties_CollateralProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralProperties]'))
ALTER TABLE [dbo].[CollateralProperties] DROP CONSTRAINT [FK_CollateralProperties_CollateralProducts]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralProperties_CollateralPropertyTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralProperties]'))
ALTER TABLE [dbo].[CollateralProperties] DROP CONSTRAINT [FK_CollateralProperties_CollateralPropertyTypes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralProperties]') AND type in (N'U'))
DROP TABLE [dbo].[CollateralProperties]
GO
/****** Object:  Table [dbo].[Corporates]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Corporates_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[Corporates]'))
ALTER TABLE [dbo].[Corporates] DROP CONSTRAINT [FK_Corporates_DomainOfApplications]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Corporates]') AND type in (N'U'))
DROP TABLE [dbo].[Corporates]
GO
/****** Object:  Table [dbo].[AllowedRoleActions]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_ActionItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_ActionItems]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_AllowedRoleActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_AllowedRoleActions]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_Roles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]') AND type in (N'U'))
DROP TABLE [dbo].[AllowedRoleActions]
GO
/****** Object:  Table [dbo].[AllowedRoleMenus]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleMenus_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleMenus]'))
ALTER TABLE [dbo].[AllowedRoleMenus] DROP CONSTRAINT [FK_AllowedRoleMenus_Roles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AllowedRoleMenus]') AND type in (N'U'))
DROP TABLE [dbo].[AllowedRoleMenus]
GO
/****** Object:  Table [dbo].[AmountCycles]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AmountCycles_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AmountCycles]'))
ALTER TABLE [dbo].[AmountCycles] DROP CONSTRAINT [FK_AmountCycles_Cycles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AmountCycles]') AND type in (N'U'))
DROP TABLE [dbo].[AmountCycles]
GO
/****** Object:  Table [dbo].[AdvancedFields]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFields_AdvancedFieldsEntities]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFields]'))
ALTER TABLE [dbo].[AdvancedFields] DROP CONSTRAINT [FK_AdvancedFields_AdvancedFieldsEntities]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFields_AdvancedFieldsTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFields]'))
ALTER TABLE [dbo].[AdvancedFields] DROP CONSTRAINT [FK_AdvancedFields_AdvancedFieldsTypes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFields]') AND type in (N'U'))
DROP TABLE [dbo].[AdvancedFields]
GO
/****** Object:  Table [dbo].[AlertSettings]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlertSettings]') AND type in (N'U'))
DROP TABLE [dbo].[AlertSettings]
GO
/****** Object:  Table [dbo].[ClientTypes]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientTypes]') AND type in (N'U'))
DROP TABLE [dbo].[ClientTypes]
GO
/****** Object:  Table [dbo].[CollateralProducts]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralProducts]') AND type in (N'U'))
DROP TABLE [dbo].[CollateralProducts]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banks]') AND type in (N'U'))
DROP TABLE [dbo].[Banks]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Branches__delete__7C3B2AE4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Branches] DROP CONSTRAINT [DF__Branches__delete__7C3B2AE4]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Branches]') AND type in (N'U'))
DROP TABLE [dbo].[Branches]
GO
/****** Object:  Table [dbo].[AdvancedFieldsEntities]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsEntities]') AND type in (N'U'))
DROP TABLE [dbo].[AdvancedFieldsEntities]
GO
/****** Object:  Table [dbo].[AdvancedFieldsLinkEntities]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__AdvancedF__link___30AEF323]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdvancedFieldsLinkEntities] DROP CONSTRAINT [DF__AdvancedF__link___30AEF323]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsLinkEntities]') AND type in (N'U'))
DROP TABLE [dbo].[AdvancedFieldsLinkEntities]
GO
/****** Object:  Table [dbo].[AdvancedFieldsTypes]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsTypes]') AND type in (N'U'))
DROP TABLE [dbo].[AdvancedFieldsTypes]
GO
/****** Object:  Table [dbo].[ActionItems]    Script Date: 02/13/2013 12:43:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionItems]') AND type in (N'U'))
DROP TABLE [dbo].[ActionItems]
GO
/****** Object:  Table [dbo].[CollateralPropertyTypes]    Script Date: 02/13/2013 12:43:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralPropertyTypes]') AND type in (N'U'))
DROP TABLE [dbo].[CollateralPropertyTypes]
GO
/****** Object:  Table [dbo].[ConsolidatedData]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConsolidatedData]') AND type in (N'U'))
DROP TABLE [dbo].[ConsolidatedData]
GO
/****** Object:  Table [dbo].[CorporateEventsType]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorporateEventsType]') AND type in (N'U'))
DROP TABLE [dbo].[CorporateEventsType]
GO
/****** Object:  Table [dbo].[PackagesClientTypes]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackagesClientTypes]') AND type in (N'U'))
DROP TABLE [dbo].[PackagesClientTypes]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__PaymentMe__pendi__02E82873]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PaymentMethods] DROP CONSTRAINT [DF__PaymentMe__pendi__02E82873]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentMethods]') AND type in (N'U'))
DROP TABLE [dbo].[PaymentMethods]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_MenuItems_type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuItems] DROP CONSTRAINT [DF_MenuItems_type]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MenuItems]') AND type in (N'U'))
DROP TABLE [dbo].[MenuItems]
GO
/****** Object:  Table [dbo].[MFI]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MFI]') AND type in (N'U'))
DROP TABLE [dbo].[MFI]
GO
/****** Object:  Table [dbo].[Monitoring]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_LoanMonitoring_type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Monitoring] DROP CONSTRAINT [DF_LoanMonitoring_type]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Monitoring]') AND type in (N'U'))
DROP TABLE [dbo].[Monitoring]
GO
/****** Object:  Table [dbo].[PersonsPhotos]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonsPhotos]') AND type in (N'U'))
DROP TABLE [dbo].[PersonsPhotos]
GO
/****** Object:  Table [dbo].[ProjectPurposes]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProjectPurposes]') AND type in (N'U'))
DROP TABLE [dbo].[ProjectPurposes]
GO
/****** Object:  Table [dbo].[LoanEntryFeeEvents]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanEntryFeeEvents]') AND type in (N'U'))
DROP TABLE [dbo].[LoanEntryFeeEvents]
GO
/****** Object:  Table [dbo].[LoanInterestAccruingEvents]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_LoanInterestAccruingEvents_installment_number]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LoanInterestAccruingEvents] DROP CONSTRAINT [DF_LoanInterestAccruingEvents_installment_number]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanInterestAccruingEvents]') AND type in (N'U'))
DROP TABLE [dbo].[LoanInterestAccruingEvents]
GO
/****** Object:  Table [dbo].[LoanScale]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanScale]') AND type in (N'U'))
DROP TABLE [dbo].[LoanScale]
GO
/****** Object:  Table [dbo].[LoanShareAmounts]    Script Date: 02/13/2013 12:43:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanShareAmounts]') AND type in (N'U'))
DROP TABLE [dbo].[LoanShareAmounts]
GO
/****** Object:  Table [dbo].[HousingSituation]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HousingSituation]') AND type in (N'U'))
DROP TABLE [dbo].[HousingSituation]
GO
/****** Object:  Table [dbo].[Info]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Info]') AND type in (N'U'))
DROP TABLE [dbo].[Info]
GO
/****** Object:  Table [dbo].[InstallmentTypes]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InstallmentTypes]') AND type in (N'U'))
DROP TABLE [dbo].[InstallmentTypes]
GO
/****** Object:  Table [dbo].[EconomicActivities]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DomainOfApplications_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[EconomicActivities]'))
ALTER TABLE [dbo].[EconomicActivities] DROP CONSTRAINT [FK_DomainOfApplications_DomainOfApplications]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EconomicActivities]') AND type in (N'U'))
DROP TABLE [dbo].[EconomicActivities]
GO
/****** Object:  Table [dbo].[EconomicActivityLoanHistory]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EconomicActivityLoanHistory]') AND type in (N'U'))
DROP TABLE [dbo].[EconomicActivityLoanHistory]
GO
/****** Object:  Table [dbo].[CreditInsuranceEvents]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditInsuranceEvents]') AND type in (N'U'))
DROP TABLE [dbo].[CreditInsuranceEvents]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 02/13/2013 12:43:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Currencie__is_sw__6D8D2138]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Currencies] DROP CONSTRAINT [DF__Currencie__is_sw__6D8D2138]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Currencie__use_c__0AA94E2A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Currencies] DROP CONSTRAINT [DF__Currencie__use_c__0AA94E2A]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Currencies]') AND type in (N'U'))
DROP TABLE [dbo].[Currencies]
GO
/****** Object:  Table [dbo].[CycleObjects]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CycleObjects]') AND type in (N'U'))
DROP TABLE [dbo].[CycleObjects]
GO
/****** Object:  Table [dbo].[CycleParameters]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CycleParameters]') AND type in (N'U'))
DROP TABLE [dbo].[CycleParameters]
GO
/****** Object:  Table [dbo].[Cycles]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cycles]') AND type in (N'U'))
DROP TABLE [dbo].[Cycles]
GO
/****** Object:  Table [dbo].[GeneralParameters]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeneralParameters]') AND type in (N'U'))
DROP TABLE [dbo].[GeneralParameters]
GO
/****** Object:  Table [dbo].[Exotics]    Script Date: 02/13/2013 12:43:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exotics]') AND type in (N'U'))
DROP TABLE [dbo].[Exotics]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__EventType__accou__03DC4CAC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EventTypes] DROP CONSTRAINT [DF__EventType__accou__03DC4CAC]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes]') AND type in (N'U'))
DROP TABLE [dbo].[EventTypes]
GO
/****** Object:  Table [dbo].[ExchangeRates]    Script Date: 02/13/2013 12:43:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExchangeRates]') AND type in (N'U'))
DROP TABLE [dbo].[ExchangeRates]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Test]') AND type in (N'U'))
DROP TABLE [dbo].[Test]
GO
/****** Object:  Table [dbo].[SavingProductsClientTypes]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingProductsClientTypes]') AND type in (N'U'))
DROP TABLE [dbo].[SavingProductsClientTypes]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses]') AND type in (N'U'))
DROP TABLE [dbo].[Statuses]
GO
/****** Object:  Table [dbo].[TechnicalParameters]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TechnicalParameters]') AND type in (N'U'))
DROP TABLE [dbo].[TechnicalParameters]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_delete]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_delete]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_mail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_mail]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_sex]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_sex]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[TraceUserLogs]    Script Date: 02/13/2013 12:43:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TraceUserLogs]') AND type in (N'U'))
DROP TABLE [dbo].[TraceUserLogs]
GO
/****** Object:  Table [dbo].[SetUp_ActivityState]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_ActivityState]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_ActivityState]
GO
/****** Object:  Table [dbo].[SetUp_BankSituation]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_BankSituation]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_BankSituation]
GO
/****** Object:  Table [dbo].[SetUp_BusinessPlan]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_BusinessPlan]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_BusinessPlan]
GO
/****** Object:  Table [dbo].[SetUp_DwellingPlace]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_DwellingPlace]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_DwellingPlace]
GO
/****** Object:  Table [dbo].[SetUp_FamilySituation]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_FamilySituation]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_FamilySituation]
GO
/****** Object:  Table [dbo].[SetUp_FiscalStatus]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_FiscalStatus]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_FiscalStatus]
GO
/****** Object:  Table [dbo].[SetUp_HousingLocation]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_HousingLocation]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_HousingLocation]
GO
/****** Object:  Table [dbo].[SetUp_HousingSituation]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_HousingSituation]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_HousingSituation]
GO
/****** Object:  Table [dbo].[SetUp_InsertionTypes]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_InsertionTypes]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_InsertionTypes]
GO
/****** Object:  Table [dbo].[SetUp_LegalStatus]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_LegalStatus]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_LegalStatus]
GO
/****** Object:  Table [dbo].[SetUp_PersonalSituation]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_PersonalSituation]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_PersonalSituation]
GO
/****** Object:  Table [dbo].[SetUp_ProfessionalExperience]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_ProfessionalExperience]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_ProfessionalExperience]
GO
/****** Object:  Table [dbo].[SetUp_ProfessionalSituation]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_ProfessionalSituation]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_ProfessionalSituation]
GO
/****** Object:  Table [dbo].[SetUp_Registre]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_Registre]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_Registre]
GO
/****** Object:  Table [dbo].[SetUp_SageJournal]    Script Date: 02/13/2013 12:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_SageJournal]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_SageJournal]
GO
/****** Object:  Table [dbo].[SetUp_SocialSituation]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_SocialSituation]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_SocialSituation]
GO
/****** Object:  Table [dbo].[SetUp_Sponsor1]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_Sponsor1]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_Sponsor1]
GO
/****** Object:  Table [dbo].[SetUp_Sponsor2]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_Sponsor2]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_Sponsor2]
GO
/****** Object:  Table [dbo].[SetUp_StudyLevel]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_StudyLevel]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_StudyLevel]
GO
/****** Object:  Table [dbo].[SetUp_SubventionTypes]    Script Date: 02/13/2013 12:43:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_SubventionTypes]') AND type in (N'U'))
DROP TABLE [dbo].[SetUp_SubventionTypes]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 02/13/2013 12:43:26 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Provinces__delet__19169DBB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Provinces] DROP CONSTRAINT [DF__Provinces__delet__19169DBB]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provinces]') AND type in (N'U'))
DROP TABLE [dbo].[Provinces]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/13/2013 12:43:28 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Roles__deleted__381D7524]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [DF__Roles__deleted__381D7524]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Roles__descripti__45DF1A33]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [DF__Roles__descripti__45DF1A33]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Roles__role_of_l__70C97838]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [DF__Roles__role_of_l__70C97838]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Roles__role_of_s__71BD9C71]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [DF__Roles__role_of_s__71BD9C71]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Roles__role_of_t__122A6C03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [DF__Roles__role_of_t__122A6C03]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[ProvisioningRules]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProvisioningRules]') AND type in (N'U'))
DROP TABLE [dbo].[ProvisioningRules]
GO
/****** Object:  Table [dbo].[PublicHolidays]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicHolidays]') AND type in (N'U'))
DROP TABLE [dbo].[PublicHolidays]
GO
/****** Object:  Table [dbo].[Questionnaire]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Questionn__is_se__59B108B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Questionnaire] DROP CONSTRAINT [DF__Questionn__is_se__59B108B6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Questionnaire]') AND type in (N'U'))
DROP TABLE [dbo].[Questionnaire]
GO
/****** Object:  Table [dbo].[Rep_Active_Loans_Data]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Active_Loans_Data]') AND type in (N'U'))
DROP TABLE [dbo].[Rep_Active_Loans_Data]
GO
/****** Object:  Table [dbo].[Rep_Disbursements_Data]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Disbursements_Data]') AND type in (N'U'))
DROP TABLE [dbo].[Rep_Disbursements_Data]
GO
/****** Object:  Table [dbo].[Rep_OLB_and_LLP_Data]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_OLB_and_LLP_Data]') AND type in (N'U'))
DROP TABLE [dbo].[Rep_OLB_and_LLP_Data]
GO
/****** Object:  Table [dbo].[Rep_Par_Analysis_Data]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Par_Analysis_Data]') AND type in (N'U'))
DROP TABLE [dbo].[Rep_Par_Analysis_Data]
GO
/****** Object:  Table [dbo].[Rep_Repayments_Data]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Repayments_Data]') AND type in (N'U'))
DROP TABLE [dbo].[Rep_Repayments_Data]
GO
/****** Object:  Table [dbo].[Rep_Rescheduled_Loans_Data]    Script Date: 02/13/2013 12:43:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Rescheduled_Loans_Data]') AND type in (N'U'))
DROP TABLE [dbo].[Rep_Rescheduled_Loans_Data]
GO
/****** Object:  Table [dbo].[Rep_Rescheduled_Loans_Data]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Rescheduled_Loans_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rep_Rescheduled_Loans_Data](
	[id] [int] NOT NULL,
	[branch_name] [nvarchar](50) NULL,
	[load_date] [datetime] NULL,
	[loan_officer] [nvarchar](255) NULL,
	[client_name] [nvarchar](255) NULL,
	[contract_code] [nvarchar](255) NULL,
	[package_name] [nvarchar](255) NULL,
	[loan_amount] [money] NULL,
	[amount_rescheduled] [money] NULL,
	[maturity] [int] NULL,
	[reschedule_date] [datetime] NULL,
	[olb] [money] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Rep_Repayments_Data]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Repayments_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rep_Repayments_Data](
	[id] [int] NOT NULL,
	[branch_name] [nvarchar](50) NULL,
	[load_date] [datetime] NULL,
	[event_id] [int] NULL,
	[contract_code] [nvarchar](255) NULL,
	[client_name] [nvarchar](255) NULL,
	[district_name] [nvarchar](255) NULL,
	[loan_officer_name] [nvarchar](255) NULL,
	[loan_product_name] [nvarchar](255) NULL,
	[early_fee] [money] NULL,
	[late_fee] [money] NULL,
	[principal] [money] NULL,
	[interest] [money] NULL,
	[total] [money] NULL,
	[written_off] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Rep_Par_Analysis_Data]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Par_Analysis_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rep_Par_Analysis_Data](
	[id] [int] NOT NULL,
	[branch_name] [nvarchar](50) NULL,
	[load_date] [datetime] NULL,
	[break_down] [nvarchar](150) NULL,
	[break_down_type] [varchar](20) NULL,
	[olb] [money] NULL,
	[par] [money] NULL,
	[contracts] [int] NULL,
	[clients] [int] NULL,
	[all_contracts] [int] NULL,
	[all_clients] [int] NULL,
	[par_30] [money] NULL,
	[contracts_30] [int] NULL,
	[clients_30] [int] NULL,
	[par_1_30] [money] NULL,
	[contracts_1_30] [int] NULL,
	[clients_1_30] [int] NULL,
	[par_31_60] [money] NULL,
	[contracts_31_60] [int] NULL,
	[clients_31_60] [int] NULL,
	[par_61_90] [money] NULL,
	[contracts_61_90] [int] NULL,
	[clients_61_90] [int] NULL,
	[par_91_180] [money] NULL,
	[contracts_91_180] [int] NULL,
	[clients_91_180] [int] NULL,
	[par_181_365] [money] NULL,
	[contracts_181_365] [int] NULL,
	[clients_181_365] [int] NULL,
	[par_365] [money] NULL,
	[contracts_365] [int] NULL,
	[clients_365] [int] NULL,
	[break_down_id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rep_OLB_and_LLP_Data]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_OLB_and_LLP_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rep_OLB_and_LLP_Data](
	[id] [int] NOT NULL,
	[branch_name] [nvarchar](50) NULL,
	[load_date] [datetime] NULL,
	[contract_code] [nvarchar](255) NULL,
	[olb] [money] NULL,
	[interest] [money] NULL,
	[late_days] [int] NULL,
	[client_name] [nvarchar](255) NULL,
	[loan_officer_name] [nvarchar](255) NULL,
	[product_name] [nvarchar](255) NULL,
	[district_name] [nvarchar](255) NULL,
	[start_date] [datetime] NULL,
	[close_date] [datetime] NULL,
	[range_from] [int] NULL,
	[range_to] [int] NULL,
	[llp_rate] [int] NULL,
	[llp] [money] NULL,
	[rescheduled] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Rep_Disbursements_Data]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Disbursements_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rep_Disbursements_Data](
	[id] [int] NOT NULL,
	[branch_name] [nvarchar](50) NULL,
	[load_date] [datetime] NULL,
	[contract_code] [nvarchar](255) NULL,
	[district] [nvarchar](255) NULL,
	[loan_product] [nvarchar](255) NULL,
	[client_name] [nvarchar](255) NULL,
	[loan_cycle] [int] NULL,
	[loan_officer] [nvarchar](255) NULL,
	[disbursement_date] [datetime] NULL,
	[amount] [money] NULL,
	[interest] [money] NULL,
	[fees] [money] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Rep_Active_Loans_Data]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rep_Active_Loans_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rep_Active_Loans_Data](
	[id] [int] NOT NULL,
	[branch_name] [nvarchar](50) NULL,
	[load_date] [datetime] NULL,
	[break_down] [nvarchar](150) NULL,
	[break_down_type] [nvarchar](20) NULL,
	[contracts] [int] NULL,
	[individual] [int] NULL,
	[group] [int] NULL,
	[corporate] [int] NULL,
	[clients] [int] NULL,
	[in_groups] [int] NULL,
	[projects] [int] NULL,
	[olb] [money] NULL,
	[break_down_id] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Questionnaire]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Questionnaire]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Questionnaire](
	[Name] [nvarchar](256) NULL,
	[Country] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[PositionInCompony] [nvarchar](100) NULL,
	[OtherMessages] [nvarchar](4000) NULL,
	[GrossPortfolio] [nvarchar](50) NULL,
	[NumberOfClients] [nvarchar](50) NULL,
	[PersonName] [nvarchar](200) NULL,
	[Phone] [nvarchar](200) NULL,
	[Skype] [nvarchar](200) NULL,
	[PurposeOfUsage] [nvarchar](200) NULL,
	[is_sent] [bit] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PublicHolidays]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicHolidays]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PublicHolidays](
	[date] [datetime] NOT NULL,
	[name] [nvarchar](100) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProvisioningRules]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProvisioningRules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProvisioningRules](
	[id] [int] NOT NULL,
	[number_of_days_min] [int] NOT NULL,
	[number_of_days_max] [int] NOT NULL,
	[provisioning_value] [float] NOT NULL,
	[provisioning_interest] [float] NOT NULL,
	[provisioning_penalty] [float] NOT NULL
 CONSTRAINT [PK_ProvisioningRules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](256) NOT NULL,
	[deleted] [bit] NOT NULL DEFAULT ((0)),
	[description] [nvarchar](2048) NULL DEFAULT (''),
	[default_start_view] [varchar](20) NOT NULL DEFAULT ('START_PAGE'),
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provinces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Provinces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_SubventionTypes]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_SubventionTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_SubventionTypes](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_StudyLevel]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_StudyLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_StudyLevel](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_Sponsor2]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_Sponsor2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_Sponsor2](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_Sponsor1]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_Sponsor1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_Sponsor1](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_SocialSituation]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_SocialSituation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_SocialSituation](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_SageJournal]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_SageJournal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_SageJournal](
	[product_code] [nvarchar](50) NOT NULL,
	[journal_code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SetUp_SageJournal] PRIMARY KEY CLUSTERED 
(
	[product_code] ASC,
	[journal_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_Registre]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_Registre]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_Registre](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_ProfessionalSituation]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_ProfessionalSituation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_ProfessionalSituation](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_ProfessionalExperience]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_ProfessionalExperience]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_ProfessionalExperience](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_PersonalSituation]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_PersonalSituation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_PersonalSituation](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_LegalStatus]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_LegalStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_LegalStatus](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_InsertionTypes]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_InsertionTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_InsertionTypes](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_HousingSituation]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_HousingSituation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_HousingSituation](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_HousingLocation]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_HousingLocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_HousingLocation](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_FiscalStatus]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_FiscalStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_FiscalStatus](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_FamilySituation]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_FamilySituation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_FamilySituation](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_DwellingPlace]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_DwellingPlace]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_DwellingPlace](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_BusinessPlan]    Script Date: 02/13/2013 12:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_BusinessPlan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_BusinessPlan](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_BankSituation]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_BankSituation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_BankSituation](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SetUp_ActivityState]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUp_ActivityState]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SetUp_ActivityState](
	[value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TraceUserLogs]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TraceUserLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TraceUserLogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_code] [nvarchar](10) NULL,
	[event_date] [datetime] NULL,
	[user_id] [int] NULL,
	[event_description] [nvarchar](max) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deleted] [bit] NOT NULL CONSTRAINT [DF_Users_delete]  DEFAULT (0),
	[user_name] [nvarchar](50) NOT NULL,
	[password_hash] [nvarchar](4000) NULL,
	[role_code] [nvarchar](256) NOT NULL,
	[first_name] [nvarchar](200) NULL,
	[last_name] [nvarchar](200) NULL,
	[mail] [nvarchar](100) NOT NULL CONSTRAINT [DF_Users_mail]  DEFAULT (N'Not Set'),
	[sex] [nchar](1) NOT NULL CONSTRAINT [DF_Users_sex]  DEFAULT ('M'),
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)END
GO
/****** Object:  Table [dbo].[TechnicalParameters]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TechnicalParameters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TechnicalParameters](
	[name] [nvarchar](100) NOT NULL,
	[value] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TechnicalParameters] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Statuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SavingProductsClientTypes]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingProductsClientTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SavingProductsClientTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[saving_product_id] [int] NOT NULL,
	[client_type_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Test]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Test](
	[char_type] [char](1) NULL,
	[varchar_type] [varchar](50) NULL,
	[nvarchar_type] [nvarchar](50) NULL,
	[integer_type] [int] NULL,
	[double_type] [float] NULL,
	[money_type] [money] NULL,
	[boolean_type] [bit] NULL,
	[datetime_type] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExchangeRates]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExchangeRates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExchangeRates](
	[exchange_date] [datetime] NOT NULL,
	[exchange_rate] [float] NOT NULL,
	[currency_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_type] [nvarchar](4) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[sort_order] [int] NULL,
	[accounting] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [PK_EventTypes_1] PRIMARY KEY CLUSTERED 
(
	[event_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Exotics]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exotics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Exotics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Exotics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Exotics_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GeneralParameters]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeneralParameters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GeneralParameters](
	[key] [varchar](50) NOT NULL,
	[value] [nvarchar](200) NULL,
 CONSTRAINT [PK_GeneralParameters] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cycles]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cycles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cycles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Cycles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CycleParameters]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CycleParameters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CycleParameters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loan_cycle] [int] NOT NULL,
	[min] [money] NOT NULL,
	[max] [money] NOT NULL,
	[cycle_object_id] [int] NOT NULL,
	[cycle_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CycleObjects]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CycleObjects]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CycleObjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Currencies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Currencies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[is_pivot] [bit] NOT NULL,
	[code] [nvarchar](20) NOT NULL,
	[is_swapped] [bit] NOT NULL DEFAULT ((0)),
	[use_cents] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CreditInsuranceEvents]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditInsuranceEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditInsuranceEvents](
	[id] [int] NOT NULL,
	[commission] [decimal](18, 2) NOT NULL,
	[principal] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EconomicActivityLoanHistory]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EconomicActivityLoanHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EconomicActivityLoanHistory](
	[contract_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[group_id] [int] NULL,
	[economic_activity_id] [int] NOT NULL,
	[deleted] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EconomicActivities]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EconomicActivities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EconomicActivities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[parent_id] [int] NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_DomainOfApplications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[InstallmentTypes]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InstallmentTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InstallmentTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[nb_of_days] [int] NOT NULL,
	[nb_of_months] [int] NOT NULL,
 CONSTRAINT [PK_InstallmentTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Info]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Info]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Info](
	[ceo] [nvarchar](50) NULL,
	[accountant] [nvarchar](50) NULL,
	[mfi] [nvarchar](50) NULL,
	[branch] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[cashier] [nvarchar](50) NULL,
	[branchmanager] [nvarchar](50) NULL,
	[branchadress] [nvarchar](50) NULL,
	[BIK] [nvarchar](50) NULL,
	[INN] [nvarchar](50) NULL,
	[AN] [nvarchar](50) NULL,
	[BranchLicense] [nvarchar](100) NULL,
	[LA] [nvarchar](50) NULL,
	[Superviser] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HousingSituation]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HousingSituation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HousingSituation](
	[name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoanShareAmounts]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanShareAmounts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoanShareAmounts](
	[person_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[contract_id] [int] NOT NULL,
	[amount] [money] NOT NULL,
	[event_id] [int] NULL,
	[payment_date] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoanScale]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanScale]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoanScale](
	[id] [int] NOT NULL,
	[ScaleMin] [int] NULL,
	[ScaleMax] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoanInterestAccruingEvents]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanInterestAccruingEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoanInterestAccruingEvents](
	[id] [int] NOT NULL,
	[interest_prepayment] [money] NOT NULL,
	[accrued_interest] [money] NOT NULL,
	[rescheduled] [bit] NOT NULL,
	[installment_number] [int] NOT NULL CONSTRAINT [DF_LoanInterestAccruingEvents_installment_number]  DEFAULT ((1)),
 CONSTRAINT [PK_LoanInterestAccruingEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoanEntryFeeEvents]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanEntryFeeEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoanEntryFeeEvents](
	[id] [int] NOT NULL,
	[fee] [money] NOT NULL,
	[disbursement_event_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProjectPurposes]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProjectPurposes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProjectPurposes](
	[name] [nvarchar](200) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PersonsPhotos]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonsPhotos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonsPhotos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[person_id] [int] NOT NULL,
	[picture_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Monitoring]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Monitoring]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Monitoring](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[object_id] [int] NOT NULL,
	[date] [datetime] NULL,
	[purpose] [nvarchar](255) NULL,
	[monitor] [nvarchar](255) NULL,
	[comment] [nvarchar](4000) NULL,
	[type] [bit] NOT NULL CONSTRAINT [DF_LoanMonitoring_type]  DEFAULT ((1))
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Monitoring', N'COLUMN',N'type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Client 1:Loan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Monitoring', @level2type=N'COLUMN',@level2name=N'type'
GO
/****** Object:  Table [dbo].[MFI]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MFI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MFI](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](55) NOT NULL,
	[login] [nvarchar](55) NULL,
	[password] [nvarchar](55) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MenuItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MenuItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[component_name] [nvarchar](100) NOT NULL,
	[type] [int] NOT NULL CONSTRAINT [DF_MenuItems_type]  DEFAULT ((0)),
UNIQUE NONCLUSTERED 
(
	[component_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MenuItems', N'COLUMN',N'type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Normal menu items loaded for main menu
1: Extension control menus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MenuItems', @level2type=N'COLUMN',@level2name=N'type'
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentMethods]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaymentMethods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](250) NULL,
	[pending] [bit] NULL DEFAULT ((0)),
    [accountNumber] varchar(32) NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PackagesClientTypes]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackagesClientTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PackagesClientTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_type_id] [int] NOT NULL,
	[package_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CorporateEventsType]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorporateEventsType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CorporateEventsType](
	[id] [int] NOT NULL,
	[code] [nvarchar](50) NULL,
 CONSTRAINT [PK_CorporateEventsType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ConsolidatedData]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConsolidatedData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConsolidatedData](
	[branch] [nvarchar](20) NOT NULL,
	[date] [datetime] NOT NULL,
	[olb] [money] NULL,
	[par] [money] NULL,
	[number_of_clients] [int] NULL,
	[number_of_contracts] [int] NULL,
	[disbursements_amount] [money] NULL,
	[disbursements_fees] [money] NULL,
	[repayments_principal] [money] NULL,
	[repayments_interest] [money] NULL,
	[repayments_commissions] [money] NULL,
	[repayments_penalties] [money] NULL,
 CONSTRAINT [IX_ConsolidatedData] UNIQUE NONCLUSTERED 
(
	[branch] ASC,
	[date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CollateralPropertyTypes]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralPropertyTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CollateralPropertyTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_CollateralPropertyTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ActionItems]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActionItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ActionItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](50) NOT NULL,
	[method_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ActionItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AdvancedFieldsTypes]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdvancedFieldsTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AdvancedFieldsTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AdvancedFieldsLinkEntities]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsLinkEntities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdvancedFieldsLinkEntities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link_type] [char](1) NOT NULL DEFAULT ('-'),
	[link_id] [int] NOT NULL,
 CONSTRAINT [PK_AdvancedFieldsLinkEntities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdvancedFieldsEntities]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsEntities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdvancedFieldsEntities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AdvancedFieldsEntities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Branches]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Branches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[deleted] [bit] NOT NULL DEFAULT ((0)),
	[code] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Banks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](200) NULL,
	[BIC] [nvarchar](50) NULL,
	[IBAN1] [nvarchar](100) NULL,
	[IBAN2] [nvarchar](100) NULL,
	[name] [nvarchar](50) NULL,
	[customIBAN1] [bit] NULL,
	[customIBAN2] [bit] NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CollateralProducts]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CollateralProducts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[desc] [nvarchar](1000) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CollateralProducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_CollateralProducts_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ClientTypes]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ClientTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AlertSettings]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlertSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AlertSettings](
	[parameter] [nvarchar](20) NOT NULL,
	[value] [nvarchar](5) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AdvancedFields]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFields]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdvancedFields](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[desc] [nvarchar](1000) NOT NULL,
	[is_mandatory] [bit] NOT NULL,
	[is_unique] [bit] NOT NULL,
 CONSTRAINT [PK_AdvancedFields] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AmountCycles]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AmountCycles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AmountCycles](
	[cycle_id] [int] NOT NULL,
	[number] [int] NOT NULL,
	[amount_min] [money] NOT NULL,
	[amount_max] [money] NOT NULL,
 CONSTRAINT [PK_AmountCycle] PRIMARY KEY CLUSTERED 
(
	[cycle_id] ASC,
	[number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AllowedRoleMenus]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AllowedRoleMenus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AllowedRoleMenus](
	[menu_item_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[allowed] [bit] NOT NULL,
 CONSTRAINT [PK_AllowedRoleMenus] PRIMARY KEY CLUSTERED 
(
	[menu_item_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AllowedRoleActions]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AllowedRoleActions](
	[action_item_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[allowed] [bit] NOT NULL,
 CONSTRAINT [PK_AllowedRoleActions] PRIMARY KEY CLUSTERED 
(
	[action_item_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Corporates]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Corporates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Corporates](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[deleted] [bit] NOT NULL,
	[sigle] [nvarchar](50) NULL,
	[small_name] [nvarchar](50) NULL,
	[volunteer_count] [int] NULL,
	[agrement_date] [datetime] NULL,
	[agrement_solidarity] [bit] NULL,
	[employee_count] [int] NULL,
	[siret] [nvarchar](50) NULL,
	[activity_id] [int] NULL,
	[date_create] [datetime] NULL,
	[fiscal_status] [nvarchar](50) NULL,
	[registre] [nvarchar](50) NULL,
	[legalForm] [nvarchar](50) NULL,
	[insertionType] [nvarchar](50) NULL,
	[loan_officer_id] [int] NULL,
 CONSTRAINT [PK_BODYCORPORATE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CollateralProperties]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralProperties]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CollateralProperties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[desc] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_CollateralProperties] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Packages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Packages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deleted] [bit] NOT NULL CONSTRAINT [DF__Tmp_Packa__delet__6F2063EF]  DEFAULT ((0)),
	[code] [nvarchar](50) NOT NULL CONSTRAINT [DF_Packages_code]  DEFAULT (N'NotSet'),
	[name] [nvarchar](100) NOT NULL,
	[client_type] [char](1) NULL CONSTRAINT [DF__Tmp_Packa__clien__70148828]  DEFAULT ('-'),
	[amount] [money] NULL,
	[amount_min] [money] NULL,
	[amount_max] [money] NULL,
	[interest_rate] [numeric](16, 12) NULL,
	[interest_rate_min] [numeric](16, 12) NULL,
	[interest_rate_max] [numeric](16, 12) NULL,
	[installment_type] [int] NOT NULL,
	[grace_period] [int] NULL,
	[grace_period_min] [int] NULL,
	[grace_period_max] [int] NULL,
	[number_of_installments] [int] NULL,
	[number_of_installments_min] [int] NULL,
	[number_of_installments_max] [int] NULL,
	[anticipated_total_repayment_penalties] [float] NULL,
	[anticipated_total_repayment_penalties_min] [float] NULL,
	[anticipated_total_repayment_penalties_max] [float] NULL,
	[exotic_id] [int] NULL,
	[loan_type] [smallint] NOT NULL,
	[keep_expected_installment] [bit] NOT NULL,
	[charge_interest_within_grace_period] [bit] NOT NULL,
	[cycle_id] [int] NULL,
	[non_repayment_penalties_based_on_overdue_interest] [float] NULL,
	[non_repayment_penalties_based_on_initial_amount] [float] NULL,
	[non_repayment_penalties_based_on_olb] [float] NULL,
	[non_repayment_penalties_based_on_overdue_principal] [float] NULL,
	[non_repayment_penalties_based_on_overdue_interest_min] [float] NULL,
	[non_repayment_penalties_based_on_initial_amount_min] [float] NULL,
	[non_repayment_penalties_based_on_olb_min] [float] NULL,
	[non_repayment_penalties_based_on_overdue_principal_min] [float] NULL,
	[non_repayment_penalties_based_on_overdue_interest_max] [float] NULL,
	[non_repayment_penalties_based_on_initial_amount_max] [float] NULL,
	[non_repayment_penalties_based_on_olb_max] [float] NULL,
	[non_repayment_penalties_based_on_overdue_principal_max] [float] NULL,
	[fundingLine_id] [int] NULL,
	[currency_id] [int] NOT NULL,
	[rounding_type] [smallint] NOT NULL DEFAULT ((1)),
	[grace_period_of_latefees] [int] NOT NULL DEFAULT ((0)),
	[anticipated_partial_repayment_penalties] [float] NULL,
	[anticipated_partial_repayment_penalties_min] [float] NULL,
	[anticipated_partial_repayment_penalties_max] [float] NULL,
	[anticipated_partial_repayment_base] [smallint] NOT NULL DEFAULT ((0)),
	[anticipated_total_repayment_base] [smallint] NOT NULL DEFAULT ((0)),
	[number_of_drawings_loc] [int] NULL,
	[amount_under_loc] [money] NULL,
	[amount_under_loc_min] [money] NULL,
	[amount_under_loc_max] [money] NULL,
	[maturity_loc] [int] NULL,
	[maturity_loc_min] [int] NULL,
	[maturity_loc_max] [int] NULL,
	[activated_loc] [bit] NOT NULL DEFAULT ((0)),
	[allow_flexible_schedule] [bit] NOT NULL DEFAULT ((0)),
	[use_guarantor_collateral] [bit] NOT NULL DEFAULT ((0)),
	[set_separate_guarantor_collateral] [bit] NOT NULL DEFAULT ((0)),
	[percentage_total_guarantor_collateral] [int] NOT NULL DEFAULT ((0)),
	[percentage_separate_guarantor] [int] NOT NULL DEFAULT ((0)),
	[percentage_separate_collateral] [int] NOT NULL DEFAULT ((0)),
	[use_compulsory_savings] [bit] NOT NULL DEFAULT ((0)),
	[compulsory_amount] [int] NULL,
	[compulsory_amount_min] [int] NULL,
	[compulsory_amount_max] [int] NULL,
	[insurance_min] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[insurance_max] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[use_entry_fees_cycles] [bit] NOT NULL DEFAULT ((0)),
	[interest_scheme] [int] NOT NULL DEFAULT ((0)),
	[script_name] [nvarchar](255) NULL,
	[principal_account] VARCHAR(32) NULL,
	[interest_accrued_but_not_due_account] VARCHAR(32) NULL,
	[interest_due_account] VARCHAR(32) NULL,
	[interest_due_but_not_received_account] VARCHAR(32) NULL,
	[interest_income_account] VARCHAR(32) NULL,
	[tax_on_interests_account] VARCHAR(32) NULL,
	[accrued_penalty_account] VARCHAR(32) NULL,
	[penalty_income_account] VARCHAR(32) NULL,
	[tax_on_penalty_account] VARCHAR(32) NULL,
	[tax_value] [float] NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Packages_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Districts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Districts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[province_id] [int] NOT NULL,
	[deleted] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FundingLines]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FundingLines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FundingLines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[begin_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[purpose] [nvarchar](50) NOT NULL,
	[deleted] [bit] NOT NULL,
	[currency_id] [int] NOT NULL,
 CONSTRAINT [PK_TEMP_FUNDINGLINES_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ExoticInstallments]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExoticInstallments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExoticInstallments](
	[number] [int] NOT NULL,
	[principal_coeff] [float] NOT NULL,
	[interest_coeff] [float] NULL,
	[exotic_id] [int] NOT NULL,
 CONSTRAINT [PK_ExoticInstallments] PRIMARY KEY CLUSTERED 
(
	[number] ASC,
	[exotic_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EventAttributes]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventAttributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventAttributes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_type] [nvarchar](4) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EventAttributes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Villages]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Villages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Villages](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[establishment_date] [datetime] NOT NULL,
	[loan_officer] [int] NOT NULL,
	[meeting_day] [int] NULL,
 CONSTRAINT [PK_Villages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UsersSubordinates]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersSubordinates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersSubordinates](
	[user_id] [int] NOT NULL,
	[subordinate_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UsersBranches]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersBranches]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersBranches](
	[user_id] [int] NOT NULL,
	[branch_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SavingProducts]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SavingProducts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deleted] [bit] NOT NULL DEFAULT ((0)),
	[name] [nvarchar](100) NOT NULL,
	[client_type] [char](1) NULL DEFAULT ('-'),
	[initial_amount_min] [money] NULL,
	[initial_amount_max] [money] NULL,
	[balance_min] [money] NULL,
	[balance_max] [money] NULL,
	[withdraw_min] [money] NULL,
	[withdraw_max] [money] NULL,
	[deposit_min] [money] NULL,
	[deposit_max] [money] NULL,
	[interest_rate] [float] NULL,
	[interest_rate_min] [float] NULL,
	[interest_rate_max] [float] NULL,
	[currency_id] [int] NOT NULL,
	[entry_fees_min] [money] NULL,
	[entry_fees_max] [money] NULL,
	[entry_fees] [money] NULL,
	[product_type] [char](1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[transfer_min] [money] NOT NULL,
	[transfer_max] [money] NOT NULL,
    [type] [int] NOT NULL DEFAULT ((3)),
    [renew_auto] [bit] NOT NULL DEFAULT ((0))
 CONSTRAINT [PK_SavingProduct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_SavingProduct_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRole](
	[role_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[date_role_set] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tiers]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tiers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tiers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_type_code] [char](1) NOT NULL,
	[scoring] [float] NULL,
	[loan_cycle] [int] NOT NULL CONSTRAINT [DF_Tiers_loan_cycle]  DEFAULT ((1)),
	[active] [bit] NOT NULL,
	[bad_client] [bit] NOT NULL,
	[district_id] [int] NOT NULL,
	[city] [nvarchar](50) NULL,
	[address] [nvarchar](500) NULL,
	[secondary_district_id] [int] NULL,
	[secondary_city] [nvarchar](50) NULL,
	[secondary_address] [nvarchar](500) NULL,
	[creation_date] [datetime] NULL,
	[home_phone] [varchar](50) NULL,
	[personal_phone] [varchar](50) NULL,
	[secondary_home_phone] [varchar](50) NULL,
	[secondary_personal_phone] [varchar](50) NULL,
	[e_mail] [nvarchar](50) NULL,
	[secondary_e_mail] [nvarchar](50) NULL,
	[status] [smallint] NOT NULL CONSTRAINT [DF_Tiers_status]  DEFAULT ((1)),
	[zipCode] [nvarchar](50) NULL,
	[secondary_zipCode] [nvarchar](50) NULL,
	[branch_id] [int] NOT NULL DEFAULT ((1)),
	[created_by] [int] NOT NULL  CONSTRAINT [FK_Tiers_created_by] foreign key  (created_by) references dbo.Users(id)  DEFAULT ((1)),
    [CurrentAccount] [nvarchar](50) NULL
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StandardBookings]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StandardBookings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StandardBookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NULL,
	[debit_account_id] [int] NOT NULL,
	[credit_account_id] [int] NOT NULL,
 CONSTRAINT [PK_StandardBookings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [inx_uniq_StandardBooking] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[debit_account_id] ASC,
	[credit_account_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SavingBookProducts]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingBookProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SavingBookProducts](
	[id] [int] NOT NULL,
	[interest_base] [smallint] NOT NULL,
	[interest_frequency] [smallint] NOT NULL,
	[calcul_amount_base] [smallint] NULL,
	[withdraw_fees_type] [smallint] NOT NULL,
	[flat_withdraw_fees_min] [money] NULL,
	[flat_withdraw_fees_max] [money] NULL,
	[flat_withdraw_fees] [money] NULL,
	[rate_withdraw_fees_min] [float] NULL,
	[rate_withdraw_fees_max] [float] NULL,
	[rate_withdraw_fees] [float] NULL,
	[transfer_fees_type] [smallint] NOT NULL,
	[flat_transfer_fees_min] [money] NULL,
	[flat_transfer_fees_max] [money] NULL,
	[flat_transfer_fees] [money] NULL,
	[rate_transfer_fees_min] [float] NULL,
	[rate_transfer_fees_max] [float] NULL,
	[rate_transfer_fees] [float] NULL,
	[deposit_fees] [money] NULL,
	[deposit_fees_max] [money] NULL,
	[deposit_fees_min] [money] NULL,
	[close_fees] [money] NULL,
	[close_fees_max] [money] NULL,
	[close_fees_min] [money] NULL,
	[management_fees] [money] NULL,
	[management_fees_max] [money] NULL,
	[management_fees_min] [money] NULL,
	[management_fees_freq] [int] NOT NULL DEFAULT ((1)),
	[overdraft_fees] [money] NULL,
	[overdraft_fees_max] [money] NULL,
	[overdraft_fees_min] [money] NULL,
	[agio_fees] [float] NULL,
	[agio_fees_max] [float] NULL,
	[agio_fees_min] [float] NULL,
	[agio_fees_freq] [int] NOT NULL DEFAULT ((1)),
	[cheque_deposit_min] [money] NULL,
	[cheque_deposit_max] [money] NULL,
	[cheque_deposit_fees] [money] NULL,
	[cheque_deposit_fees_min] [money] NULL,
	[cheque_deposit_fees_max] [money] NULL,
	[reopen_fees] [money] NULL,
	[reopen_fees_min] [money] NULL,
	[reopen_fees_max] [money] NULL,
	[is_ibt_fee_flat] [bit] NOT NULL DEFAULT ((0)),
	[ibt_fee_min] [money] NULL,
	[ibt_fee_max] [money] NULL,
	[ibt_fee] [money] NULL,
	[use_term_deposit] [bit] NOT NULL DEFAULT ((0)),
	[term_deposit_period_min] [int] NULL,
	[term_deposit_period_max] [int] NULL,
	[posting_frequency] [int] NULL,
 CONSTRAINT [PK_SavingBookProducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VillagesPersons]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VillagesPersons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VillagesPersons](
	[village_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[joined_date] [datetime] NOT NULL,
	[left_date] [datetime] NULL,
	[is_leader] [bit] NOT NULL DEFAULT ((0)),
	[currently_in] [bit] NOT NULL DEFAULT ((0)),
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VillagesPersons] PRIMARY KEY CLUSTERED 
(
	[village_id] ASC,
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VillagesAttendance]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VillagesAttendance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VillagesAttendance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[village_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[attended] [bit] NOT NULL DEFAULT ((0)),
	[comment] [nvarchar](1000) NULL,
	[loan_id] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_VillagesAttendance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TermDepositProducts]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TermDepositProducts](
	[id] [int] NOT NULL,
	[installment_types_id] [int] NOT NULL,
	[number_period] [int] NULL,
	[number_period_min] [int] NULL,
	[number_period_max] [int] NULL,
	[interest_frequency] [smallint] NOT NULL,
	[withdrawal_fees_type] [smallint] NOT NULL,
	[withdrawal_fees_min] [float] NULL,
	[withdrawal_fees_max] [float] NULL,
	[withdrawal_fees] [float] NULL,
 CONSTRAINT [PK_TermDepositProducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tellers]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tellers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tellers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[desc] [nvarchar](100) NULL,
	[account_id] [int] NOT NULL,
	[deleted] [bit] NOT NULL DEFAULT ((0)),
	[branch_id] [int] NOT NULL DEFAULT ((0)),
	[currency_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[amount_min] [money] NULL,
	[amount_max] [money] NULL,
	[deposit_amount_min] [money] NULL,
	[deposit_amount_max] [money] NULL,
	[withdrawal_amount_min] [money] NULL,
	[withdrawal_amount_max] [money] NULL,
 CONSTRAINT [PK_Tellers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EntryFees]    Script Date: 02/13/2013 12:43:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntryFees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EntryFees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_of_fee] [nvarchar](100) NOT NULL,
	[min] [decimal](18, 4) NULL,
	[max] [decimal](18, 4) NULL,
	[rate] [bit] NULL,
	[is_deleted] [bit] NOT NULL CONSTRAINT [DF_EntryFees_is_deleted]  DEFAULT ((0)),
	[max_sum] [decimal](18, 4) NULL,
	[account_number] [varchar](32) NULL,
 CONSTRAINT [PK_EntryFees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoanProductsEntryFees]    Script Date: 12/12/2016 15:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanProductsEntryFees]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[LoanProductsEntryFees](
			[id]           [int] IDENTITY(1,1) NOT NULL,
			[id_entry_fee] [int] NOT NULL,
			[id_product]   [int] NOT NULL,
			[cycle_id]     [int] NULL,
			[fee_index]    [int] NOT NULL)
	END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanProductsEntryFees_EntryFees]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanProductsEntryFees]'))
	ALTER TABLE [dbo].[LoanProductsEntryFees]  WITH CHECK ADD CONSTRAINT [FK_LoanProductsEntryFees_EntryFees] FOREIGN KEY([id_entry_fee])
	REFERENCES [dbo].[EntryFees] ([id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanProductsEntryFees_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanProductsEntryFees]'))
	ALTER TABLE [dbo].[LoanProductsEntryFees]  WITH CHECK ADD CONSTRAINT [FK_LoanProductsEntryFees_Packages] FOREIGN KEY([id_product])
	REFERENCES [dbo].[Packages] ([id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanProductsEntryFees_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanProductsEntryFees]'))
	ALTER TABLE [dbo].[LoanProductsEntryFees]  WITH CHECK ADD CONSTRAINT [FK_LoanProductsEntryFees_Cycles] FOREIGN KEY([cycle_id])
	REFERENCES [dbo].[Cycles] ([id])
GO
/****** Object:  Table [dbo].[FundingLineEvents]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FundingLineEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FundingLineEvents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](200) NOT NULL,
	[amount] [money] NOT NULL,
	[direction] [smallint] NOT NULL,
	[fundingline_id] [int] NOT NULL DEFAULT ((1)),
	[deleted] [bit] NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[type] [smallint] NOT NULL,
	[user_id] [int] NULL,
	[contract_event_id] [int] NULL,
 CONSTRAINT [PK_EVENTFUNDINGLINE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LinkBranchesPaymentMethods]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LinkBranchesPaymentMethods]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LinkBranchesPaymentMethods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[branch_id] [int] NOT NULL,
	[payment_method_id] [int] NOT NULL,
	[deleted] [bit] NOT NULL DEFAULT ((0)),
	[date] [datetime] NULL DEFAULT (getdate()),
	[account_id] [int] NOT NULL DEFAULT ((1))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[City]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[City](
	[name] [nvarchar](100) NOT NULL,
	[district_id] [int] NOT NULL,
	[deleted] [bit] NOT NULL DEFAULT ((0)),
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CollateralPropertyCollections]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralPropertyCollections]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CollateralPropertyCollections](
	[property_id] [int] NOT NULL,
	[value] [nvarchar](100) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AdvancedFieldsCollections]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsCollections]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdvancedFieldsCollections](
	[field_id] [int] NOT NULL,
	[value] [nvarchar](100) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AdvancedFieldsValues]    Script Date: 02/13/2013 12:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdvancedFieldsValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_field_id] [int] NOT NULL,
	[field_id] [int] NOT NULL,
	[value] [nvarchar](300) NULL,
 CONSTRAINT [PK_AdvancedFieldsValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ClientBranchHistory]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ClientBranchHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_changed] [datetime] NULL,
	[branch_from_id] [int] NOT NULL,
	[branch_to_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Groups](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[establishment_date] [datetime] NULL,
	[comments] [nvarchar](500) NULL,
	[meeting_day] [int] NULL,
	[loan_officer_id] [int] NULL,
 CONSTRAINT [PK_ClientGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Persons](
	[id] [int] NOT NULL,
	[first_name] [nvarchar](100) NOT NULL,
	[sex] [char](1) NOT NULL,
	[identification_data] [nvarchar](200) NULL,
	[last_name] [nvarchar](100) NOT NULL,
	[birth_date] [datetime] NULL,
	[activity_id] [int] NULL,
	[image_path] [nvarchar](500) NULL,
	[father_name] [nvarchar](200) NULL,
	[birth_place] [nvarchar](50) NULL,
	[nationality] [nvarchar](50) NULL,
	[loan_officer_id] [int] NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Persons_personal_address_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TellerEvents]    Script Date: 02/13/2013 12:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TellerEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TellerEvents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teller_id] [int] NOT NULL,
	[event_code] [nchar](4) NOT NULL,
	[amount] [money] NOT NULL,
	[date] [datetime] NOT NULL,
	[is_exported] [bit] NOT NULL DEFAULT ((0)),
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_TellerEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Projects]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tiers_id] [int] NOT NULL,
	[status] [smallint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[aim] [nvarchar](200) NOT NULL,
	[begin_date] [datetime] NOT NULL,
	[abilities] [nvarchar](50) NULL,
	[experience] [nvarchar](50) NULL,
	[market] [nvarchar](50) NULL,
	[concurrence] [nvarchar](50) NULL,
	[purpose] [nvarchar](50) NULL,
	[corporate_name] [nvarchar](50) NULL,
	[corporate_juridicStatus] [nvarchar](50) NULL,
	[corporate_FiscalStatus] [nvarchar](50) NULL,
	[corporate_siret] [nvarchar](50) NULL,
	[corporate_CA] [money] NULL,
	[corporate_nbOfJobs] [int] NULL,
	[corporate_financialPlanType] [nvarchar](50) NULL,
	[corporateFinancialPlanAmount] [money] NULL,
	[corporate_financialPlanTotalAmount] [money] NULL,
	[address] [nvarchar](20) NULL,
	[city] [nvarchar](50) NULL,
	[zipCode] [nvarchar](50) NULL,
	[district_id] [int] NULL,
	[home_phone] [nvarchar](50) NULL,
	[personalPhone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[hometype] [nvarchar](50) NULL,
	[corporate_registre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Projects2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SavingContracts]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingContracts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SavingContracts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[tiers_id] [int] NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[interest_rate] [float] NOT NULL,
	[status] [smallint] NOT NULL,
	[closed_date] [datetime] NULL,
	[savings_officer_id] [int] NOT NULL DEFAULT ((1)),
	[initial_amount] [money] NOT NULL DEFAULT ((0)),
	[entry_fees] [money] NOT NULL DEFAULT ((0)),
	[nsg_id] [int] NULL,
	[loan_id] [int] NULL,
	[start_date] [datetime] NULL,
 CONSTRAINT [PK_SavingContracts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SavingBookContracts]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingBookContracts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SavingBookContracts](
	[id] [int] NOT NULL,
	[flat_withdraw_fees] [money] NULL,
	[rate_withdraw_fees] [float] NULL,
	[flat_transfer_fees] [money] NULL,
	[rate_transfer_fees] [float] NULL,
	[flat_deposit_fees] [money] NULL,
	[flat_close_fees] [money] NULL,
	[flat_management_fees] [money] NULL,
	[flat_overdraft_fees] [money] NULL,
	[in_overdraft] [bit] NOT NULL DEFAULT ((0)),
	[rate_agio_fees] [float] NULL,
	[cheque_deposit_fees] [money] NULL,
	[flat_reopen_fees] [money] NULL,
	[flat_ibt_fee] [money] NULL,
	[rate_ibt_fee] [float] NULL,
	[use_term_deposit] [bit] NOT NULL DEFAULT ((0)),
	[term_deposit_period] [int] NOT NULL CONSTRAINT [period_default]  DEFAULT ((0)),
	[term_deposit_period_min] [int] NULL,
	[term_deposit_period_max] [int] NULL,
	[transfer_account] [nvarchar](50) NULL,
	[rollover] [int] NULL,
	[next_maturity] [datetime] NULL,
 CONSTRAINT [PK_SavingBookContracts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SavingEvents]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SavingEvents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[contract_id] [int] NOT NULL,
	[code] [char](4) NOT NULL,
	[amount] [money] NOT NULL,
	[description] [nvarchar](200) NULL,
	[deleted] [bit] NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[cancelable] [bit] NOT NULL,
	[is_fired] [bit] NOT NULL,
	[related_contract_code] [nvarchar](50) NULL,
	[fees] [money] NULL,
	[is_exported] [bit] NOT NULL DEFAULT ((0)),
	[savings_method] [smallint] NULL,
	[pending] [bit] NOT NULL DEFAULT ((0)),
	[pending_event_id] [int] NULL,
	[teller_id] [int] NULL,
	[loan_event_id] [int] NULL,
	[cancel_date] [datetime] NULL,
    [doc1] [varchar](max) NULL,
    [parent_event_id] [int] NULL,
 CONSTRAINT [PK_SavingEvents_Tmp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SavingDepositContracts]    Script Date: 02/13/2013 12:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SavingDepositContracts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SavingDepositContracts](
	[id] [int] NOT NULL,
	[number_periods] [int] NOT NULL,
	[rollover] [smallint] NOT NULL,
	[transfer_account] [nvarchar](50) NULL,
	[withdrawal_fees] [float] NOT NULL,
	[next_maturity] [datetime] NULL,
 CONSTRAINT [PK_SavingDepositContracts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FollowUp]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FollowUp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FollowUp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[year] [int] NOT NULL,
	[CA] [money] NOT NULL,
	[Jobs1] [int] NOT NULL,
	[Jobs2] [int] NOT NULL,
	[PersonalSituation] [nvarchar](50) NOT NULL,
	[activity] [nvarchar](50) NOT NULL,
	[comment] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_FollowUp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PersonGroupBelonging]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonGroupBelonging](
	[person_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[is_leader] [bit] NOT NULL,
	[currently_in] [bit] NOT NULL,
	[joined_date] [datetime] NOT NULL,
	[left_date] [datetime] NULL,
 CONSTRAINT [PK_PersonGroupBelonging] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CorporatePersonBelonging]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CorporatePersonBelonging](
	[corporate_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[position] [nvarchar](50) NULL,
 CONSTRAINT [PK_CorporatePersonBelonging] PRIMARY KEY CLUSTERED 
(
	[corporate_id] ASC,
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contracts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contracts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contract_code] [nvarchar](255) NOT NULL,
	[branch_code] [varchar](50) NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[close_date] [datetime] NOT NULL,
	[closed] [bit] NOT NULL,
	[project_id] [int] NOT NULL CONSTRAINT [DF_Contracts_project_id]  DEFAULT ((0)),
	[status] [smallint] NOT NULL CONSTRAINT [DF_Contracts_status]  DEFAULT ((1)),
	[credit_commitee_date] [datetime] NULL,
	[credit_commitee_comment] [nvarchar](4000) NULL,
	[credit_commitee_code] [nvarchar](100) NULL,
	[align_disbursed_date] [datetime] NULL,
	[loan_purpose] [nvarchar](4000) NULL,
	[comments] [nvarchar](4000) NULL,
	[nsg_id] [int] NULL,
	[activity_id] [int] NOT NULL,
	[preferred_first_installment_date] [datetime] NULL,
	[created_by] [int] NOT NULL CONSTRAINT [FK_Contracts_created_by] foreign key (created_by) references dbo.Users(id)  DEFAULT ((1)),
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContractEvents]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContractEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContractEvents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_type] [nvarchar](4) NOT NULL,
	[contract_id] [int] NOT NULL,
	[event_date] [datetime] NOT NULL,
	[user_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[entry_date] [datetime] NULL DEFAULT (getdate()),
	[is_exported] [bit] NOT NULL DEFAULT ((0)),
	[comment] [nvarchar](4000) NULL,
	[teller_id] [int] NULL,
	[parent_id] [int] NULL,
	[cancel_date] [datetime] NULL,
    [doc1] varchar(255) NULL,
    [doc2] varchar(255) NULL,
 CONSTRAINT [PK_ContractEvents_Tmp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

CREATE NONCLUSTERED INDEX [IX_ContractEvents_type_contract_id] ON [dbo].[ContractEvents] 
(
	[event_type] ASC,
	[contract_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ContractAssignHistory]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContractAssignHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateChanged] [datetime] NOT NULL CONSTRAINT [DF_ContractAssignHistory_DateChanged]  DEFAULT (getdate()),
	[loanofficerFrom_id] [int] NOT NULL,
	[loanofficerTo_id] [int] NOT NULL,
	[contract_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Credit]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Credit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Credit](
	[id] [int] NOT NULL,
	[package_id] [int] NOT NULL,
	[amount] [money] NOT NULL,
	[interest_rate] [numeric](16, 12) NOT NULL,
	[installment_type] [int] NOT NULL,
	[nb_of_installment] [int] NOT NULL,
	[anticipated_total_repayment_penalties] [float] NOT NULL,
	[disbursed] [bit] NOT NULL,
	[loanofficer_id] [int] NOT NULL,
	[grace_period] [int] NULL,
	[written_off] [bit] NOT NULL,
	[rescheduled] [bit] NOT NULL,
	[bad_loan] [bit] NOT NULL,
	[non_repayment_penalties_based_on_overdue_principal] [float] NOT NULL,
	[non_repayment_penalties_based_on_initial_amount] [float] NOT NULL,
	[non_repayment_penalties_based_on_olb] [float] NOT NULL,
	[non_repayment_penalties_based_on_overdue_interest] [float] NOT NULL,
	[fundingLine_id] [int] NOT NULL,
	[synchronize] [bit] NOT NULL CONSTRAINT [DF_Credit_synchronize]  DEFAULT ((0)),
	[interest] [money] NOT NULL DEFAULT ((0)),
	[grace_period_of_latefees] [int] NOT NULL DEFAULT ((0)),
	[anticipated_partial_repayment_penalties] [float] NULL DEFAULT ((0)),
	[number_of_drawings_loc] [int] NULL,
	[amount_under_loc] [money] NULL,
	[maturity_loc] [int] NULL,
	[anticipated_partial_repayment_base] [smallint] NOT NULL DEFAULT ((0)),
	[anticipated_total_repayment_base] [smallint] NOT NULL DEFAULT ((0)),
	[schedule_changed] [bit] NOT NULL DEFAULT ((0)),
	[amount_min] [money] NULL,
	[amount_max] [money] NULL,
	[ir_min] [numeric](16, 12) NULL,
	[ir_max] [numeric](16, 12) NULL,
	[nmb_of_inst_min] [int] NULL,
	[nmb_of_inst_max] [int] NULL,
	[loan_cycle] [int] NULL,
	[insurance] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[effective_interest_rate] [decimal](18, 4) NOT NULL,
	schedule_type int not null,
	script_name nvarchar(255) null,
    [initial_emi] decimal(18,2) null
 CONSTRAINT [PK_Credit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CollateralsLinkContracts]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralsLinkContracts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CollateralsLinkContracts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contract_id] [int] NOT NULL,
 CONSTRAINT [PK_CollateralsLinkContracts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LinkGuarantorCredit]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LinkGuarantorCredit](
	[tiers_id] [int] NOT NULL,
	[contract_id] [int] NOT NULL,
	[guarantee_amount] [money] NOT NULL,
	[guarantee_desc] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoansLinkSavingsBook]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoansLinkSavingsBook](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loan_id] [int] NULL,
	[savings_id] [int] NULL,
	[loan_percentage] [int] NULL,
 CONSTRAINT [PK_LoansLinkSavingsBook] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[WriteOffEvents]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteOffEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WriteOffEvents](
	[id] [int] NOT NULL,
	[olb] [money] NOT NULL CONSTRAINT [DF_WriteOffEvents_olb]  DEFAULT (0),
	[accrued_interests] [money] NOT NULL,
	[accrued_penalties] [money] NOT NULL,
	[past_due_days] [int] NOT NULL CONSTRAINT [DF_WriteOffEvents_past_due_days]  DEFAULT ((365)),
	[overdue_principal] [money] NOT NULL,
	[comment] [nvarchar](255) NULL,
	[write_off_method] [int] NULL CONSTRAINT [WriteOffMethodDF] DEFAULT ((0))
 CONSTRAINT [PK_WriteOffEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TrancheEvents]    Script Date: 02/13/2013 12:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrancheEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TrancheEvents](
	[id] [int] NOT NULL,
	[amount] [money] NOT NULL,
	[maturity] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[interest_rate] [money] NOT NULL DEFAULT ((0)),
	[started_from_installment] [int] NULL,
	[applied_new_interest] [bit] NOT NULL,
	[first_repayment_date] [date] NOT NULL DEFAULT(GETDATE()),
	[grace_period] [int] NOT NULL DEFAULT(0),
	[payment_method_id] [int] NULL,
 CONSTRAINT [PK_TrancheEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ReschedulingOfALoanEvents]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReschedulingOfALoanEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReschedulingOfALoanEvents](
	[id] [int] NOT NULL,
	[amount] [money] NOT NULL CONSTRAINT [DF_ReschedulingOfALoanEvents_amount]  DEFAULT (0),
	[interest] [money] NOT NULL DEFAULT ((0)),
	[nb_of_maturity] [int] NOT NULL DEFAULT ((0)),
	[grace_period] [int] NOT NULL DEFAULT ((0)),
	[charge_interest_during_grace_period] [bit] NOT NULL DEFAULT ((0)),
	[previous_interest_rate] [money] NOT NULL DEFAULT ((0)), 
	[preferred_first_installment_date] [datetime] NOT NULL DEFAULT ((getdate())),
 CONSTRAINT [PK_ReschedulingOfALoanEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RepaymentEvents]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RepaymentEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RepaymentEvents](
	[id] [int] NOT NULL,
	[past_due_days] [int] NOT NULL,
	[principal] [money] NOT NULL,
	[interests] [money] NOT NULL,
	[installment_number] [int] NOT NULL,
	[commissions] [money] NOT NULL DEFAULT ((0)),
	[penalties] [money] NOT NULL DEFAULT ((0)),
	[payment_method_id] [int] NULL DEFAULT ((1)),
	[calculated_penalties] [money] NOT NULL DEFAULT ((0)),
	[written_off_penalties] [money] NOT NULL DEFAULT ((0)),
	[unpaid_penalties] [money] NOT NULL DEFAULT ((0)),
	[bounce_fee] [money] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoanPenaltyAccrualEvents]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanPenaltyAccrualEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE LoanPenaltyAccrualEvents
(
	id INT NOT NULL,
	penalty MONEY NOT NULL,
	installment_number INT NOT NULL,
) ON [PRIMARY]
END
GO

if object_id('dbo.PenaltyWriteOffEvents') is null
begin
	create table dbo.PenaltyWriteOffEvents
	(
		id int not null,
		amount money not null,
		installment_number int not null
	)
	alter table dbo.PenaltyWriteOffEvents
	add constraint FK_PenaltyWriteOffEvents foreign key (id) references dbo.ContractEvents(id)
end
GO

if object_id('dbo.InterestWriteOffEvents') is null
begin
	create table dbo.InterestWriteOffEvents
	(
		id int not null,
		amount money not null
	)
	alter table dbo.InterestWriteOffEvents
	add constraint FK_InterestWriteOffEvents foreign key (id) references dbo.ContractEvents(id)
end
GO

/****** Object:  Table [dbo].[AccrualInterestLoanEvents]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccrualInterestLoanEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE AccrualInterestLoanEvents
(
	id INT NOT NULL,
	interest MONEY NOT NULL,
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanTransitionEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE LoanTransitionEvents
(
	id INT NOT NULL,
	amount MONEY NOT NULL,
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProvisionEvents]    Script Date: 02/13/2013 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProvisionEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProvisionEvents](
	[id] [int] NOT NULL,
	[amount] [money] NOT NULL CONSTRAINT [DF_ProvisionEvents_amount]  DEFAULT ((0)),
	[rate] [float] NOT NULL,
	[overdue_days] [int] NOT NULL,
 CONSTRAINT [PK_ProvisionEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OverdueEvents]    Script Date: 02/13/2013 12:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OverdueEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OverdueEvents](
	[id] [int] NOT NULL,
	[olb] [money] NOT NULL CONSTRAINT [DF_OverdueEvents_olb]  DEFAULT ((0)),
	[overdue_days] [int] NOT NULL CONSTRAINT [DF_OverdueEvents_overdue_days]  DEFAULT ((0)),
	[overdue_principal] [money] NULL,
 CONSTRAINT [PK_OverdueEvents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoanDisbursmentEvents]    Script Date: 02/13/2013 12:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoanDisbursmentEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoanDisbursmentEvents](
	[id] [int] NOT NULL,
	[amount] [money] NOT NULL CONSTRAINT [DF_LoanDisbursmentEvents_amount]  DEFAULT (0),
	[fees] [money] NOT NULL CONSTRAINT [DF_LoanDisbursmentEvents_fees]  DEFAULT (0),
	[interest] [money] NOT NULL DEFAULT ((0)),
	[payment_method_id] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Installments]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Installments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Installments](
	[expected_date] [datetime] NOT NULL,
	[interest_repayment] [money] NOT NULL,
	[capital_repayment] [money] NOT NULL,
	[contract_id] [int] NOT NULL,
	[number] [int] NOT NULL,
	[paid_interest] [money] NOT NULL,
	[paid_capital] [money] NOT NULL,
	[fees_unpaid] [money] NOT NULL CONSTRAINT [DF_Installments_fees_unpaid]  DEFAULT (0),
	[paid_date] [datetime] NULL,
	[paid_fees] [money] NOT NULL DEFAULT ((0)),
	[comment] [nvarchar](50) NULL,
	[pending] [bit] NOT NULL DEFAULT ((0)),
	[start_date] [datetime] NOT NULL DEFAULT (getdate()),
	[olb] [money] NOT NULL DEFAULT ((0)),
	[commission] money NOT NULL DEFAULT(0),
	[paid_commission] money NOT NULL DEFAULT(0),
    [extra_amount_1] MONEY NULL DEFAULT(0),
    [extra_amount_2] MONEY NULL DEFAULT(0),
    [last_interest_accrual_date] date not null,
 CONSTRAINT [PK_Installments] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC,
	[number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[InstallmentHistory]    Script Date: 02/13/2013 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InstallmentHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InstallmentHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contract_id] [int] NOT NULL,
	[event_id] [int] NOT NULL,
	[number] [int] NOT NULL,
	[expected_date] [datetime] NOT NULL,
	[capital_repayment] [money] NOT NULL,
	[interest_repayment] [money] NOT NULL,
	[paid_interest] [money] NOT NULL DEFAULT ((0)),
	[paid_capital] [money] NOT NULL DEFAULT ((0)),
	[paid_fees] [money] NOT NULL DEFAULT ((0)),
	[fees_unpaid] [money] NOT NULL DEFAULT ((0)),
	[paid_date] [datetime] NULL,
	[delete_date] [datetime] NULL,
	[comment] [nvarchar](50) NULL,
	[pending] [bit] NOT NULL DEFAULT ((0)),
	[start_date] [datetime] NOT NULL DEFAULT (getdate()),
	[olb] [money] NOT NULL DEFAULT ((0)),
	[commission] money NOT NULL DEFAULT(0),
	[paid_commission] money NOT NULL DEFAULT(0),
    [extra_amount_1] MONEY NULL DEFAULT(0),
    [extra_amount_2] MONEY NULL DEFAULT(0),
    [last_interest_accrual_date] date not null,
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CreditEntryFees]    Script Date: 02/13/2013 12:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditEntryFees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditEntryFees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[credit_id] [int] NOT NULL,
	[entry_fee_id] [int] NOT NULL,
	[fee_value] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_CreditEntryFees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CollateralPropertyValues]    Script Date: 02/13/2013 12:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CollateralPropertyValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contract_collateral_id] [int] NOT NULL,
	[property_id] [int] NOT NULL,
	[value] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CollateralPropertyValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Check [CK_Packages]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages]  WITH NOCHECK ADD  CONSTRAINT [CK_Packages] CHECK NOT FOR REPLICATION (([client_type]='I' OR [client_type]='G' OR [client_type]='-' OR [client_type]='C' OR [client_type]='V'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [CK_Packages]
GO
/****** Object:  Check [CK_Persons_Sex]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Persons_Sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons]  WITH NOCHECK ADD  CONSTRAINT [CK_Persons_Sex] CHECK  (([sex]='M' OR [sex]='F'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Persons_Sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [CK_Persons_Sex]
GO
/****** Object:  Check [CK_TiersTypeCode]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_TiersTypeCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers]  WITH NOCHECK ADD  CONSTRAINT [CK_TiersTypeCode] CHECK  (([client_type_code]='G' OR [client_type_code]='I' OR [client_type_code]='C' OR [client_type_code]='V'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_TiersTypeCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] CHECK CONSTRAINT [CK_TiersTypeCode]
GO
/****** Object:  ForeignKey [FK_AdvancedFields_AdvancedFieldsEntities]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFields_AdvancedFieldsEntities]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFields]'))
ALTER TABLE [dbo].[AdvancedFields]  WITH CHECK ADD  CONSTRAINT [FK_AdvancedFields_AdvancedFieldsEntities] FOREIGN KEY([entity_id])
REFERENCES [dbo].[AdvancedFieldsEntities] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFields_AdvancedFieldsEntities]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFields]'))
ALTER TABLE [dbo].[AdvancedFields] CHECK CONSTRAINT [FK_AdvancedFields_AdvancedFieldsEntities]
GO
/****** Object:  ForeignKey [FK_AdvancedFields_AdvancedFieldsTypes]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFields_AdvancedFieldsTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFields]'))
ALTER TABLE [dbo].[AdvancedFields]  WITH CHECK ADD  CONSTRAINT [FK_AdvancedFields_AdvancedFieldsTypes] FOREIGN KEY([type_id])
REFERENCES [dbo].[AdvancedFieldsTypes] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFields_AdvancedFieldsTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFields]'))
ALTER TABLE [dbo].[AdvancedFields] CHECK CONSTRAINT [FK_AdvancedFields_AdvancedFieldsTypes]
GO
/****** Object:  ForeignKey [FK_AdvancedFieldsCollections_AdvancedFields]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsCollections_AdvancedFields]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsCollections]'))
ALTER TABLE [dbo].[AdvancedFieldsCollections]  WITH CHECK ADD  CONSTRAINT [FK_AdvancedFieldsCollections_AdvancedFields] FOREIGN KEY([field_id])
REFERENCES [dbo].[AdvancedFields] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsCollections_AdvancedFields]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsCollections]'))
ALTER TABLE [dbo].[AdvancedFieldsCollections] CHECK CONSTRAINT [FK_AdvancedFieldsCollections_AdvancedFields]
GO
/****** Object:  ForeignKey [FK_AdvancedFieldsValues_AdvancedFields]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsValues_AdvancedFields]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]'))
ALTER TABLE [dbo].[AdvancedFieldsValues]  WITH CHECK ADD  CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFields] FOREIGN KEY([field_id])
REFERENCES [dbo].[AdvancedFields] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsValues_AdvancedFields]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]'))
ALTER TABLE [dbo].[AdvancedFieldsValues] CHECK CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFields]
GO
/****** Object:  ForeignKey [FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]'))
ALTER TABLE [dbo].[AdvancedFieldsValues]  WITH CHECK ADD  CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities] FOREIGN KEY([entity_field_id])
REFERENCES [dbo].[AdvancedFieldsLinkEntities] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdvancedFieldsValues]'))
ALTER TABLE [dbo].[AdvancedFieldsValues] CHECK CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]
GO
/****** Object:  ForeignKey [FK_AllowedRoleActions_ActionItems]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_ActionItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions]  WITH CHECK ADD  CONSTRAINT [FK_AllowedRoleActions_ActionItems] FOREIGN KEY([action_item_id])
REFERENCES [dbo].[ActionItems] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_ActionItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] CHECK CONSTRAINT [FK_AllowedRoleActions_ActionItems]
GO
/****** Object:  ForeignKey [FK_AllowedRoleActions_AllowedRoleActions]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_AllowedRoleActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions]  WITH CHECK ADD  CONSTRAINT [FK_AllowedRoleActions_AllowedRoleActions] FOREIGN KEY([action_item_id], [role_id])
REFERENCES [dbo].[AllowedRoleActions] ([action_item_id], [role_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_AllowedRoleActions]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] CHECK CONSTRAINT [FK_AllowedRoleActions_AllowedRoleActions]
GO
/****** Object:  ForeignKey [FK_AllowedRoleActions_Roles]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions]  WITH CHECK ADD  CONSTRAINT [FK_AllowedRoleActions_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleActions_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleActions]'))
ALTER TABLE [dbo].[AllowedRoleActions] CHECK CONSTRAINT [FK_AllowedRoleActions_Roles]
GO
/****** Object:  ForeignKey [FK_AllowedRoleMenus_Roles]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleMenus_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleMenus]'))
ALTER TABLE [dbo].[AllowedRoleMenus]  WITH CHECK ADD  CONSTRAINT [FK_AllowedRoleMenus_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AllowedRoleMenus_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AllowedRoleMenus]'))
ALTER TABLE [dbo].[AllowedRoleMenus] CHECK CONSTRAINT [FK_AllowedRoleMenus_Roles]
GO
/****** Object:  ForeignKey [FK_AmountCycles_Cycles]    Script Date: 02/13/2013 12:43:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AmountCycles_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AmountCycles]'))
ALTER TABLE [dbo].[AmountCycles]  WITH CHECK ADD  CONSTRAINT [FK_AmountCycles_Cycles] FOREIGN KEY([cycle_id])
REFERENCES [dbo].[Cycles] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AmountCycles_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[AmountCycles]'))
ALTER TABLE [dbo].[AmountCycles] CHECK CONSTRAINT [FK_AmountCycles_Cycles]
GO
/****** Object:  ForeignKey [FK_City_Districts]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Districts]') AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Districts] FOREIGN KEY([district_id])
REFERENCES [dbo].[Districts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Districts]') AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Districts]
GO
/****** Object:  ForeignKey [FK_ClientBranchHistory_Branches]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory]  WITH CHECK ADD  CONSTRAINT [FK_ClientBranchHistory_Branches] FOREIGN KEY([branch_from_id])
REFERENCES [dbo].[Branches] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] CHECK CONSTRAINT [FK_ClientBranchHistory_Branches]
GO
/****** Object:  ForeignKey [FK_ClientBranchHistory_Tiers]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory]  WITH CHECK ADD  CONSTRAINT [FK_ClientBranchHistory_Tiers] FOREIGN KEY([client_id])
REFERENCES [dbo].[Tiers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] CHECK CONSTRAINT [FK_ClientBranchHistory_Tiers]
GO
/****** Object:  ForeignKey [FK_ClientBranchHistory_Users]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory]  WITH CHECK ADD  CONSTRAINT [FK_ClientBranchHistory_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClientBranchHistory_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ClientBranchHistory]'))
ALTER TABLE [dbo].[ClientBranchHistory] CHECK CONSTRAINT [FK_ClientBranchHistory_Users]
GO
/****** Object:  ForeignKey [FK_CollateralProperties_CollateralProducts]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralProperties_CollateralProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralProperties]'))
ALTER TABLE [dbo].[CollateralProperties]  WITH CHECK ADD  CONSTRAINT [FK_CollateralProperties_CollateralProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[CollateralProducts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralProperties_CollateralProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralProperties]'))
ALTER TABLE [dbo].[CollateralProperties] CHECK CONSTRAINT [FK_CollateralProperties_CollateralProducts]
GO
/****** Object:  ForeignKey [FK_CollateralProperties_CollateralPropertyTypes]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralProperties_CollateralPropertyTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralProperties]'))
ALTER TABLE [dbo].[CollateralProperties]  WITH CHECK ADD  CONSTRAINT [FK_CollateralProperties_CollateralPropertyTypes] FOREIGN KEY([type_id])
REFERENCES [dbo].[CollateralPropertyTypes] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralProperties_CollateralPropertyTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralProperties]'))
ALTER TABLE [dbo].[CollateralProperties] CHECK CONSTRAINT [FK_CollateralProperties_CollateralPropertyTypes]
GO
/****** Object:  ForeignKey [FK_CollateralPropertyCollections_CollateralProperties]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyCollections_CollateralProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyCollections]'))
ALTER TABLE [dbo].[CollateralPropertyCollections]  WITH CHECK ADD  CONSTRAINT [FK_CollateralPropertyCollections_CollateralProperties] FOREIGN KEY([property_id])
REFERENCES [dbo].[CollateralProperties] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyCollections_CollateralProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyCollections]'))
ALTER TABLE [dbo].[CollateralPropertyCollections] CHECK CONSTRAINT [FK_CollateralPropertyCollections_CollateralProperties]
GO
/****** Object:  ForeignKey [FK_CollateralPropertyValues_CollateralProperties]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyValues_CollateralProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]'))
ALTER TABLE [dbo].[CollateralPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_CollateralPropertyValues_CollateralProperties] FOREIGN KEY([property_id])
REFERENCES [dbo].[CollateralProperties] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyValues_CollateralProperties]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]'))
ALTER TABLE [dbo].[CollateralPropertyValues] CHECK CONSTRAINT [FK_CollateralPropertyValues_CollateralProperties]
GO
/****** Object:  ForeignKey [FK_CollateralPropertyValues_CollateralsLinkContracts]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyValues_CollateralsLinkContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]'))
ALTER TABLE [dbo].[CollateralPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_CollateralPropertyValues_CollateralsLinkContracts] FOREIGN KEY([contract_collateral_id])
REFERENCES [dbo].[CollateralsLinkContracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralPropertyValues_CollateralsLinkContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralPropertyValues]'))
ALTER TABLE [dbo].[CollateralPropertyValues] CHECK CONSTRAINT [FK_CollateralPropertyValues_CollateralsLinkContracts]
GO
/****** Object:  ForeignKey [FK_CollateralsLinkContracts_Contracts]    Script Date: 02/13/2013 12:43:21 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralsLinkContracts_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralsLinkContracts]'))
ALTER TABLE [dbo].[CollateralsLinkContracts]  WITH CHECK ADD  CONSTRAINT [FK_CollateralsLinkContracts_Contracts] FOREIGN KEY([contract_id])
REFERENCES [dbo].[Contracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CollateralsLinkContracts_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[CollateralsLinkContracts]'))
ALTER TABLE [dbo].[CollateralsLinkContracts] CHECK CONSTRAINT [FK_CollateralsLinkContracts_Contracts]
GO
/****** Object:  ForeignKey [FK_ContractAssignHistory_Contracts]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory]  WITH CHECK ADD  CONSTRAINT [FK_ContractAssignHistory_Contracts] FOREIGN KEY([contract_id])
REFERENCES [dbo].[Contracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] CHECK CONSTRAINT [FK_ContractAssignHistory_Contracts]
GO
/****** Object:  ForeignKey [FK_ContractAssignHistory_Users]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory]  WITH CHECK ADD  CONSTRAINT [FK_ContractAssignHistory_Users] FOREIGN KEY([loanofficerFrom_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] CHECK CONSTRAINT [FK_ContractAssignHistory_Users]
GO
/****** Object:  ForeignKey [FK_ContractAssignHistory_Users1]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Users1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory]  WITH CHECK ADD  CONSTRAINT [FK_ContractAssignHistory_Users1] FOREIGN KEY([loanofficerTo_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractAssignHistory_Users1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractAssignHistory]'))
ALTER TABLE [dbo].[ContractAssignHistory] CHECK CONSTRAINT [FK_ContractAssignHistory_Users1]
GO
/****** Object:  ForeignKey [FK_ContractEvents_Contracts]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_ContractEvents_Contracts] FOREIGN KEY([contract_id])
REFERENCES [dbo].[Contracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] CHECK CONSTRAINT [FK_ContractEvents_Contracts]
GO
/****** Object:  ForeignKey [FK_ContractEvents_LoanInterestAccruingEvents]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_LoanInterestAccruingEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_ContractEvents_LoanInterestAccruingEvents] FOREIGN KEY([id])
REFERENCES [dbo].[LoanInterestAccruingEvents] ([id])
NOT FOR REPLICATION
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_LoanInterestAccruingEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] NOCHECK CONSTRAINT [FK_ContractEvents_LoanInterestAccruingEvents]
GO
/****** Object:  ForeignKey [FK_ContractEvents_Tellers]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_ContractEvents_Tellers] FOREIGN KEY([teller_id])
REFERENCES [dbo].[Tellers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] CHECK CONSTRAINT [FK_ContractEvents_Tellers]
GO
/****** Object:  ForeignKey [FK_ContractEvents_Users]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_ContractEvents_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContractEvents_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContractEvents]'))
ALTER TABLE [dbo].[ContractEvents] CHECK CONSTRAINT [FK_ContractEvents_Users]
GO

create table 
	LoanPurpose
	(
		id int identity(1,1) not null,
		name nvarchar(255) not null,
		parent_id int null,
		deleted bit not null,
		constraint PK_LoanPurpose primary key clustered
		(
			[id] asc
		) with (pad_index  = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [PRIMARY]
	) on [PRIMARY]
GO

/****** Object:  ForeignKey [FK_Contracts_EconomicActivities]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_LoanPurpose]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_LoanPurpose] FOREIGN KEY([activity_id])
REFERENCES [dbo].[LoanPurpose] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_LoanPurpose]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_LoanPurpose]
GO
/****** Object:  ForeignKey [FK_Contracts_Projects]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Projects] FOREIGN KEY([project_id])
REFERENCES [dbo].[Projects] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Projects]
GO
/****** Object:  ForeignKey [FK_Contracts_Villages]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Villages] FOREIGN KEY([nsg_id])
REFERENCES [dbo].[Villages] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contracts_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contracts]'))
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Villages]
GO
/****** Object:  ForeignKey [FK_CorporatePersonBelonging_Corporates]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorporatePersonBelonging_Corporates]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]'))
ALTER TABLE [dbo].[CorporatePersonBelonging]  WITH CHECK ADD  CONSTRAINT [FK_CorporatePersonBelonging_Corporates] FOREIGN KEY([corporate_id])
REFERENCES [dbo].[Corporates] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorporatePersonBelonging_Corporates]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]'))
ALTER TABLE [dbo].[CorporatePersonBelonging] CHECK CONSTRAINT [FK_CorporatePersonBelonging_Corporates]
GO
/****** Object:  ForeignKey [FK_CorporatePersonBelonging_Persons]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorporatePersonBelonging_Persons]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]'))
ALTER TABLE [dbo].[CorporatePersonBelonging]  WITH CHECK ADD  CONSTRAINT [FK_CorporatePersonBelonging_Persons] FOREIGN KEY([person_id])
REFERENCES [dbo].[Persons] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorporatePersonBelonging_Persons]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorporatePersonBelonging]'))
ALTER TABLE [dbo].[CorporatePersonBelonging] CHECK CONSTRAINT [FK_CorporatePersonBelonging_Persons]
GO
/****** Object:  ForeignKey [FK_Corporates_DomainOfApplications]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Corporates_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[Corporates]'))
ALTER TABLE [dbo].[Corporates]  WITH CHECK ADD  CONSTRAINT [FK_Corporates_DomainOfApplications] FOREIGN KEY([activity_id])
REFERENCES [dbo].[EconomicActivities] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Corporates_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[Corporates]'))
ALTER TABLE [dbo].[Corporates] CHECK CONSTRAINT [FK_Corporates_DomainOfApplications]
GO
/****** Object:  ForeignKey [FK_Credit_Contracts]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit]  WITH NOCHECK ADD  CONSTRAINT [FK_Credit_Contracts] FOREIGN KEY([id])
REFERENCES [dbo].[Contracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] CHECK CONSTRAINT [FK_Credit_Contracts]
GO
/****** Object:  ForeignKey [FK_Credit_InstallmentTypes]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit]  WITH NOCHECK ADD  CONSTRAINT [FK_Credit_InstallmentTypes] FOREIGN KEY([installment_type])
REFERENCES [dbo].[InstallmentTypes] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] CHECK CONSTRAINT [FK_Credit_InstallmentTypes]
GO
/****** Object:  ForeignKey [FK_Credit_Packages]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit]  WITH NOCHECK ADD  CONSTRAINT [FK_Credit_Packages] FOREIGN KEY([package_id])
REFERENCES [dbo].[Packages] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] CHECK CONSTRAINT [FK_Credit_Packages]
GO
/****** Object:  ForeignKey [FK_Credit_Temp_FundingLines]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Temp_FundingLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit]  WITH NOCHECK ADD  CONSTRAINT [FK_Credit_Temp_FundingLines] FOREIGN KEY([fundingLine_id])
REFERENCES [dbo].[FundingLines] ([id])
NOT FOR REPLICATION
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Temp_FundingLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] CHECK CONSTRAINT [FK_Credit_Temp_FundingLines]
GO
/****** Object:  ForeignKey [FK_Credit_Users]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit]  WITH NOCHECK ADD  CONSTRAINT [FK_Credit_Users] FOREIGN KEY([loanofficer_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Credit_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Credit]'))
ALTER TABLE [dbo].[Credit] NOCHECK CONSTRAINT [FK_Credit_Users]
GO
/****** Object:  ForeignKey [FK_CreditEntryFees_Credit]    Script Date: 02/13/2013 12:43:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditEntryFees_Credit]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditEntryFees]'))
ALTER TABLE [dbo].[CreditEntryFees]  WITH CHECK ADD  CONSTRAINT [FK_CreditEntryFees_Credit] FOREIGN KEY([credit_id])
REFERENCES [dbo].[Credit] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditEntryFees_Credit]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditEntryFees]'))
ALTER TABLE [dbo].[CreditEntryFees] CHECK CONSTRAINT [FK_CreditEntryFees_Credit]
GO
/****** Object:  ForeignKey [FK_Districts_Provinces]    Script Date: 02/13/2013 12:43:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Districts_Provinces]') AND parent_object_id = OBJECT_ID(N'[dbo].[Districts]'))
ALTER TABLE [dbo].[Districts]  WITH NOCHECK ADD  CONSTRAINT [FK_Districts_Provinces] FOREIGN KEY([province_id])
REFERENCES [dbo].[Provinces] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Districts_Provinces]') AND parent_object_id = OBJECT_ID(N'[dbo].[Districts]'))
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Provinces]
GO
/****** Object:  ForeignKey [FK_DomainOfApplications_DomainOfApplications]    Script Date: 02/13/2013 12:43:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DomainOfApplications_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[EconomicActivities]'))
ALTER TABLE [dbo].[EconomicActivities]  WITH NOCHECK ADD  CONSTRAINT [FK_DomainOfApplications_DomainOfApplications] FOREIGN KEY([parent_id])
REFERENCES [dbo].[EconomicActivities] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DomainOfApplications_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[EconomicActivities]'))
ALTER TABLE [dbo].[EconomicActivities] CHECK CONSTRAINT [FK_DomainOfApplications_DomainOfApplications]
GO
/****** Object:  ForeignKey [FK_EventAttributes_EventTypes]    Script Date: 02/13/2013 12:43:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventAttributes_EventTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventAttributes]'))
ALTER TABLE [dbo].[EventAttributes]  WITH NOCHECK ADD  CONSTRAINT [FK_EventAttributes_EventTypes] FOREIGN KEY([event_type])
REFERENCES [dbo].[EventTypes] ([event_type])
NOT FOR REPLICATION
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventAttributes_EventTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventAttributes]'))
ALTER TABLE [dbo].[EventAttributes] CHECK CONSTRAINT [FK_EventAttributes_EventTypes]
GO
/****** Object:  ForeignKey [FK_ExoticInstallments_Exotics]    Script Date: 02/13/2013 12:43:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExoticInstallments_Exotics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExoticInstallments]'))
ALTER TABLE [dbo].[ExoticInstallments]  WITH NOCHECK ADD  CONSTRAINT [FK_ExoticInstallments_Exotics] FOREIGN KEY([exotic_id])
REFERENCES [dbo].[Exotics] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExoticInstallments_Exotics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExoticInstallments]'))
ALTER TABLE [dbo].[ExoticInstallments] CHECK CONSTRAINT [FK_ExoticInstallments_Exotics]
GO
/****** Object:  ForeignKey [FK_FollowUp_Projects]    Script Date: 02/13/2013 12:43:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FollowUp_Projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[FollowUp]'))
ALTER TABLE [dbo].[FollowUp]  WITH CHECK ADD  CONSTRAINT [FK_FollowUp_Projects] FOREIGN KEY([project_id])
REFERENCES [dbo].[Projects] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FollowUp_Projects]') AND parent_object_id = OBJECT_ID(N'[dbo].[FollowUp]'))
ALTER TABLE [dbo].[FollowUp] CHECK CONSTRAINT [FK_FollowUp_Projects]
GO
/****** Object:  ForeignKey [FK_FundingLineEvents_FundingLines]    Script Date: 02/13/2013 12:43:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FundingLineEvents_FundingLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[FundingLineEvents]'))
ALTER TABLE [dbo].[FundingLineEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_FundingLineEvents_FundingLines] FOREIGN KEY([fundingline_id])
REFERENCES [dbo].[FundingLines] ([id])
NOT FOR REPLICATION
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FundingLineEvents_FundingLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[FundingLineEvents]'))
ALTER TABLE [dbo].[FundingLineEvents] CHECK CONSTRAINT [FK_FundingLineEvents_FundingLines]
GO
/****** Object:  ForeignKey [FK_FundingLines_Currencies]    Script Date: 02/13/2013 12:43:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FundingLines_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[FundingLines]'))
ALTER TABLE [dbo].[FundingLines]  WITH NOCHECK ADD  CONSTRAINT [FK_FundingLines_Currencies] FOREIGN KEY([currency_id])
REFERENCES [dbo].[Currencies] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FundingLines_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[FundingLines]'))
ALTER TABLE [dbo].[FundingLines] CHECK CONSTRAINT [FK_FundingLines_Currencies]
GO
/****** Object:  ForeignKey [FK_Groups_Tiers]    Script Date: 02/13/2013 12:43:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Groups_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Groups]'))
ALTER TABLE [dbo].[Groups]  WITH NOCHECK ADD  CONSTRAINT [FK_Groups_Tiers] FOREIGN KEY([id])
REFERENCES [dbo].[Tiers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Groups_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Groups]'))
ALTER TABLE [dbo].[Groups] NOCHECK CONSTRAINT [FK_Groups_Tiers]
GO
/****** Object:  ForeignKey [FK_InstallmentHistory_ContractEvents]    Script Date: 02/13/2013 12:43:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstallmentHistory_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstallmentHistory]'))
ALTER TABLE [dbo].[InstallmentHistory]  WITH CHECK ADD  CONSTRAINT [FK_InstallmentHistory_ContractEvents] FOREIGN KEY([event_id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InstallmentHistory_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[InstallmentHistory]'))
ALTER TABLE [dbo].[InstallmentHistory] CHECK CONSTRAINT [FK_InstallmentHistory_ContractEvents]
GO
/****** Object:  ForeignKey [FK_Installments_Credit]    Script Date: 02/13/2013 12:43:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Installments_Credit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Installments]'))
ALTER TABLE [dbo].[Installments]  WITH NOCHECK ADD  CONSTRAINT [FK_Installments_Credit] FOREIGN KEY([contract_id])
REFERENCES [dbo].[Credit] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Installments_Credit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Installments]'))
ALTER TABLE [dbo].[Installments] NOCHECK CONSTRAINT [FK_Installments_Credit]
GO
/****** Object:  ForeignKey [FK_LinkBranchesPaymentMethods_PaymentMethods]    Script Date: 02/13/2013 12:43:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkBranchesPaymentMethods_PaymentMethods]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkBranchesPaymentMethods]'))
ALTER TABLE [dbo].[LinkBranchesPaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_LinkBranchesPaymentMethods_PaymentMethods] FOREIGN KEY([payment_method_id])
REFERENCES [dbo].[PaymentMethods] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkBranchesPaymentMethods_PaymentMethods]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkBranchesPaymentMethods]'))
ALTER TABLE [dbo].[LinkBranchesPaymentMethods] CHECK CONSTRAINT [FK_LinkBranchesPaymentMethods_PaymentMethods]
GO
/****** Object:  ForeignKey [FK_LinkGuarantorCredit_Contracts]    Script Date: 02/13/2013 12:43:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkGuarantorCredit_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]'))
ALTER TABLE [dbo].[LinkGuarantorCredit]  WITH NOCHECK ADD  CONSTRAINT [FK_LinkGuarantorCredit_Contracts] FOREIGN KEY([contract_id])
REFERENCES [dbo].[Contracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkGuarantorCredit_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]'))
ALTER TABLE [dbo].[LinkGuarantorCredit] CHECK CONSTRAINT [FK_LinkGuarantorCredit_Contracts]
GO
/****** Object:  ForeignKey [FK_LinkGuarantorCredit_Tiers]    Script Date: 02/13/2013 12:43:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkGuarantorCredit_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]'))
ALTER TABLE [dbo].[LinkGuarantorCredit]  WITH NOCHECK ADD  CONSTRAINT [FK_LinkGuarantorCredit_Tiers] FOREIGN KEY([tiers_id])
REFERENCES [dbo].[Tiers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LinkGuarantorCredit_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LinkGuarantorCredit]'))
ALTER TABLE [dbo].[LinkGuarantorCredit] CHECK CONSTRAINT [FK_LinkGuarantorCredit_Tiers]
GO
/****** Object:  ForeignKey [FK_LoanDisbursmentEvents_ContractEvents]    Script Date: 02/13/2013 12:43:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanDisbursmentEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanDisbursmentEvents]'))
ALTER TABLE [dbo].[LoanDisbursmentEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDisbursmentEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanDisbursmentEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanDisbursmentEvents]'))
ALTER TABLE [dbo].[LoanDisbursmentEvents] CHECK CONSTRAINT [FK_LoanDisbursmentEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_LoansLinkSavingsBook_Contracts]    Script Date: 02/13/2013 12:43:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoansLinkSavingsBook_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]'))
ALTER TABLE [dbo].[LoansLinkSavingsBook]  WITH CHECK ADD  CONSTRAINT [FK_LoansLinkSavingsBook_Contracts] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Contracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoansLinkSavingsBook_Contracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]'))
ALTER TABLE [dbo].[LoansLinkSavingsBook] CHECK CONSTRAINT [FK_LoansLinkSavingsBook_Contracts]
GO
/****** Object:  ForeignKey [FK_LoansLinkSavingsBook_SavingContracts]    Script Date: 02/13/2013 12:43:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoansLinkSavingsBook_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]'))
ALTER TABLE [dbo].[LoansLinkSavingsBook]  WITH CHECK ADD  CONSTRAINT [FK_LoansLinkSavingsBook_SavingContracts] FOREIGN KEY([savings_id])
REFERENCES [dbo].[SavingContracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoansLinkSavingsBook_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoansLinkSavingsBook]'))
ALTER TABLE [dbo].[LoansLinkSavingsBook] CHECK CONSTRAINT [FK_LoansLinkSavingsBook_SavingContracts]
GO
/****** Object:  ForeignKey [FK_OverdueEvents_ContractEvents]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OverdueEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[OverdueEvents]'))
ALTER TABLE [dbo].[OverdueEvents]  WITH CHECK ADD  CONSTRAINT [FK_OverdueEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OverdueEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[OverdueEvents]'))
ALTER TABLE [dbo].[OverdueEvents] CHECK CONSTRAINT [FK_OverdueEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_Packages_Currencies]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages]  WITH NOCHECK ADD  CONSTRAINT [FK_Packages_Currencies] FOREIGN KEY([currency_id])
REFERENCES [dbo].[Currencies] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_Currencies]
GO
/****** Object:  ForeignKey [FK_Packages_Cycles]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages]  WITH NOCHECK ADD  CONSTRAINT [FK_Packages_Cycles] FOREIGN KEY([cycle_id])
REFERENCES [dbo].[Cycles] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Cycles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] NOCHECK CONSTRAINT [FK_Packages_Cycles]
GO
/****** Object:  ForeignKey [FK_Packages_Exotics]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Exotics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages]  WITH NOCHECK ADD  CONSTRAINT [FK_Packages_Exotics] FOREIGN KEY([exotic_id])
REFERENCES [dbo].[Exotics] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_Exotics]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] NOCHECK CONSTRAINT [FK_Packages_Exotics]
GO
/****** Object:  ForeignKey [FK_Packages_InstallmentTypes]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages]  WITH NOCHECK ADD  CONSTRAINT [FK_Packages_InstallmentTypes] FOREIGN KEY([installment_type])
REFERENCES [dbo].[InstallmentTypes] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages] NOCHECK CONSTRAINT [FK_Packages_InstallmentTypes]
GO
/****** Object:  ForeignKey [FK_PersonGroupBelonging_Persons1]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonGroupBelonging_Persons1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]'))
ALTER TABLE [dbo].[PersonGroupBelonging]  WITH NOCHECK ADD  CONSTRAINT [FK_PersonGroupBelonging_Persons1] FOREIGN KEY([person_id])
REFERENCES [dbo].[Persons] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonGroupBelonging_Persons1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]'))
ALTER TABLE [dbo].[PersonGroupBelonging] CHECK CONSTRAINT [FK_PersonGroupBelonging_Persons1]
GO
/****** Object:  ForeignKey [FK_PersonGroupCorrespondance_Groups]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonGroupCorrespondance_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]'))
ALTER TABLE [dbo].[PersonGroupBelonging]  WITH NOCHECK ADD  CONSTRAINT [FK_PersonGroupCorrespondance_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonGroupCorrespondance_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonGroupBelonging]'))
ALTER TABLE [dbo].[PersonGroupBelonging] CHECK CONSTRAINT [FK_PersonGroupCorrespondance_Groups]
GO
/****** Object:  ForeignKey [FK_Persons_DomainOfApplications]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Persons_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons]  WITH NOCHECK ADD  CONSTRAINT [FK_Persons_DomainOfApplications] FOREIGN KEY([activity_id])
REFERENCES [dbo].[EconomicActivities] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Persons_DomainOfApplications]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_DomainOfApplications]
GO
/****** Object:  ForeignKey [FK_Persons_Tiers]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Persons_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons]  WITH NOCHECK ADD  CONSTRAINT [FK_Persons_Tiers] FOREIGN KEY([id])
REFERENCES [dbo].[Tiers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Persons_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Persons]'))
ALTER TABLE [dbo].[Persons] NOCHECK CONSTRAINT [FK_Persons_Tiers]
GO
/****** Object:  ForeignKey [FK_Projects_Tiers]    Script Date: 02/13/2013 12:43:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Projects_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Projects]'))
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Tiers] FOREIGN KEY([tiers_id])
REFERENCES [dbo].[Tiers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Projects_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Projects]'))
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Tiers]
GO
/****** Object:  ForeignKey [FK_ProvisionEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProvisionEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProvisionEvents]'))
ALTER TABLE [dbo].[ProvisionEvents]  WITH CHECK ADD  CONSTRAINT [FK_ProvisionEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProvisionEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProvisionEvents]'))
ALTER TABLE [dbo].[ProvisionEvents] CHECK CONSTRAINT [FK_ProvisionEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_RepaymentEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RepaymentEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[RepaymentEvents]'))
ALTER TABLE [dbo].[RepaymentEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_RepaymentEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RepaymentEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[RepaymentEvents]'))
ALTER TABLE [dbo].[RepaymentEvents] NOCHECK CONSTRAINT [FK_RepaymentEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_LoanPenaltyAccrualEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanPenaltyAccrualEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanPenaltyAccrualEvents]'))
ALTER TABLE [dbo].[LoanPenaltyAccrualEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanPenaltyAccrualEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LoanPenaltyAccrualEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[LoanPenaltyAccrualEvents]'))
ALTER TABLE [dbo].[LoanPenaltyAccrualEvents] NOCHECK CONSTRAINT [FK_LoanPenaltyAccrualEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_AccrualInterestLoanEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccrualInterestLoanEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccrualInterestLoanEvents]'))
ALTER TABLE [dbo].[AccrualInterestLoanEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_AccrualInterestLoanEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccrualInterestLoanEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccrualInterestLoanEvents]'))
ALTER TABLE [dbo].[AccrualInterestLoanEvents] NOCHECK CONSTRAINT [FK_AccrualInterestLoanEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_ReschedulingOfALoanEvents_ContractEvents]    Script Date: 02/13/2013 12:43:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReschedulingOfALoanEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReschedulingOfALoanEvents]'))
ALTER TABLE [dbo].[ReschedulingOfALoanEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_ReschedulingOfALoanEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReschedulingOfALoanEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReschedulingOfALoanEvents]'))
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] NOCHECK CONSTRAINT [FK_ReschedulingOfALoanEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_SavingBookContract_SavingContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingBookContract_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingBookContracts]'))
ALTER TABLE [dbo].[SavingBookContracts]  WITH CHECK ADD  CONSTRAINT [FK_SavingBookContract_SavingContracts] FOREIGN KEY([id])
REFERENCES [dbo].[SavingContracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingBookContract_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingBookContracts]'))
ALTER TABLE [dbo].[SavingBookContracts] CHECK CONSTRAINT [FK_SavingBookContract_SavingContracts]
GO
/****** Object:  ForeignKey [FK_SavingBookProducts_SavingProducts]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingBookProducts_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingBookProducts]'))
ALTER TABLE [dbo].[SavingBookProducts]  WITH CHECK ADD  CONSTRAINT [FK_SavingBookProducts_SavingProducts] FOREIGN KEY([id])
REFERENCES [dbo].[SavingProducts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingBookProducts_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingBookProducts]'))
ALTER TABLE [dbo].[SavingBookProducts] CHECK CONSTRAINT [FK_SavingBookProducts_SavingProducts]
GO
/****** Object:  ForeignKey [FK_SavingContracts_Tiers]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingContracts_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts]  WITH CHECK ADD  CONSTRAINT [FK_SavingContracts_Tiers] FOREIGN KEY([tiers_id])
REFERENCES [dbo].[Tiers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingContracts_Tiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] CHECK CONSTRAINT [FK_SavingContracts_Tiers]
GO
/****** Object:  ForeignKey [FK_SavingContracts_Users]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingContracts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts]  WITH CHECK ADD  CONSTRAINT [FK_SavingContracts_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingContracts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] CHECK CONSTRAINT [FK_SavingContracts_Users]
GO
/****** Object:  ForeignKey [FK_Savings_SavingProducts]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Savings_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts]  WITH CHECK ADD  CONSTRAINT [FK_Savings_SavingProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[SavingProducts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Savings_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingContracts]'))
ALTER TABLE [dbo].[SavingContracts] CHECK CONSTRAINT [FK_Savings_SavingProducts]
GO
/****** Object:  ForeignKey [FK_SavingDepositContract_SavingContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingDepositContract_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingDepositContracts]'))
ALTER TABLE [dbo].[SavingDepositContracts]  WITH CHECK ADD  CONSTRAINT [FK_SavingDepositContract_SavingContracts] FOREIGN KEY([id])
REFERENCES [dbo].[SavingContracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingDepositContract_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingDepositContracts]'))
ALTER TABLE [dbo].[SavingDepositContracts] CHECK CONSTRAINT [FK_SavingDepositContract_SavingContracts]
GO
/****** Object:  ForeignKey [FK_SavingEvents_SavingContracts]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents]  WITH CHECK ADD  CONSTRAINT [FK_SavingEvents_SavingContracts] FOREIGN KEY([contract_id])
REFERENCES [dbo].[SavingContracts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_SavingContracts]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] CHECK CONSTRAINT [FK_SavingEvents_SavingContracts]
GO
/****** Object:  ForeignKey [FK_SavingEvents_Tellers]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents]  WITH CHECK ADD  CONSTRAINT [FK_SavingEvents_Tellers] FOREIGN KEY([teller_id])
REFERENCES [dbo].[Tellers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] CHECK CONSTRAINT [FK_SavingEvents_Tellers]
GO
/****** Object:  ForeignKey [FK_SavingEvents_Users]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents]  WITH CHECK ADD  CONSTRAINT [FK_SavingEvents_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingEvents_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingEvents]'))
ALTER TABLE [dbo].[SavingEvents] CHECK CONSTRAINT [FK_SavingEvents_Users]
GO
/****** Object:  ForeignKey [FK_SavingProducts_Currencies]    Script Date: 02/13/2013 12:43:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingProducts_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingProducts]'))
ALTER TABLE [dbo].[SavingProducts]  WITH NOCHECK ADD  CONSTRAINT [FK_SavingProducts_Currencies] FOREIGN KEY([currency_id])
REFERENCES [dbo].[Currencies] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SavingProducts_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[SavingProducts]'))
ALTER TABLE [dbo].[SavingProducts] CHECK CONSTRAINT [FK_SavingProducts_Currencies]
GO
/****** Object:  ForeignKey [FK_TellerEvents_Tellers]    Script Date: 02/13/2013 12:43:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TellerEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TellerEvents]'))
ALTER TABLE [dbo].[TellerEvents]  WITH CHECK ADD  CONSTRAINT [FK_TellerEvents_Tellers] FOREIGN KEY([teller_id])
REFERENCES [dbo].[Tellers] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TellerEvents_Tellers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TellerEvents]'))
ALTER TABLE [dbo].[TellerEvents] CHECK CONSTRAINT [FK_TellerEvents_Tellers]
GO
/****** Object:  ForeignKey [FK_Tellers_Branches]    Script Date: 02/13/2013 12:43:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tellers_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tellers]'))
ALTER TABLE [dbo].[Tellers]  WITH CHECK ADD  CONSTRAINT [FK_Tellers_Branches] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branches] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tellers_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tellers]'))
ALTER TABLE [dbo].[Tellers] CHECK CONSTRAINT [FK_Tellers_Branches]
GO
/****** Object:  ForeignKey [FK_Tellers_Currencies]    Script Date: 02/13/2013 12:43:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tellers_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tellers]'))
ALTER TABLE [dbo].[Tellers]  WITH CHECK ADD  CONSTRAINT [FK_Tellers_Currencies] FOREIGN KEY([currency_id])
REFERENCES [dbo].[Currencies] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tellers_Currencies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tellers]'))
ALTER TABLE [dbo].[Tellers] CHECK CONSTRAINT [FK_Tellers_Currencies]
GO
/****** Object:  ForeignKey [FK_TermDepositProducts_InstallmentTypes]    Script Date: 02/13/2013 12:43:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TermDepositProducts_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]'))
ALTER TABLE [dbo].[TermDepositProducts]  WITH CHECK ADD  CONSTRAINT [FK_TermDepositProducts_InstallmentTypes] FOREIGN KEY([installment_types_id])
REFERENCES [dbo].[InstallmentTypes] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TermDepositProducts_InstallmentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]'))
ALTER TABLE [dbo].[TermDepositProducts] CHECK CONSTRAINT [FK_TermDepositProducts_InstallmentTypes]
GO
/****** Object:  ForeignKey [FK_TermDepositProducts_SavingProducts]    Script Date: 02/13/2013 12:43:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TermDepositProducts_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]'))
ALTER TABLE [dbo].[TermDepositProducts]  WITH CHECK ADD  CONSTRAINT [FK_TermDepositProducts_SavingProducts] FOREIGN KEY([id])
REFERENCES [dbo].[SavingProducts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TermDepositProducts_SavingProducts]') AND parent_object_id = OBJECT_ID(N'[dbo].[TermDepositProducts]'))
ALTER TABLE [dbo].[TermDepositProducts] CHECK CONSTRAINT [FK_TermDepositProducts_SavingProducts]
GO
/****** Object:  ForeignKey [FK_Tiers_Branches]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers]  WITH CHECK ADD  CONSTRAINT [FK_Tiers_Branches] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branches] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Branches]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] CHECK CONSTRAINT [FK_Tiers_Branches]
GO
/****** Object:  ForeignKey [FK_Tiers_Corporates]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Corporates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers]  WITH NOCHECK ADD  CONSTRAINT [FK_Tiers_Corporates] FOREIGN KEY([id])
REFERENCES [dbo].[Corporates] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Corporates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] NOCHECK CONSTRAINT [FK_Tiers_Corporates]
GO
/****** Object:  ForeignKey [FK_Tiers_Districts]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Districts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers]  WITH NOCHECK ADD  CONSTRAINT [FK_Tiers_Districts] FOREIGN KEY([district_id])
REFERENCES [dbo].[Districts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Districts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] CHECK CONSTRAINT [FK_Tiers_Districts]
GO
/****** Object:  ForeignKey [FK_Tiers_Districts1]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Districts1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers]  WITH NOCHECK ADD  CONSTRAINT [FK_Tiers_Districts1] FOREIGN KEY([secondary_district_id])
REFERENCES [dbo].[Districts] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tiers_Districts1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tiers]'))
ALTER TABLE [dbo].[Tiers] CHECK CONSTRAINT [FK_Tiers_Districts1]
GO
/****** Object:  ForeignKey [FK_TrancheEvents_ContractEvents]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrancheEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[TrancheEvents]'))
ALTER TABLE [dbo].[TrancheEvents]  WITH CHECK ADD  CONSTRAINT [FK_TrancheEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TrancheEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[TrancheEvents]'))
ALTER TABLE [dbo].[TrancheEvents] CHECK CONSTRAINT [FK_TrancheEvents_ContractEvents]
GO
/****** Object:  ForeignKey [FK_UserRole_Roles]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Roles]
GO
/****** Object:  ForeignKey [FK_UserRole_Users]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRole_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRole]'))
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Users]
GO
/****** Object:  ForeignKey [FK_UsersBranches_Users]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersBranches_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersBranches]'))
ALTER TABLE [dbo].[UsersBranches]  WITH CHECK ADD  CONSTRAINT [FK_UsersBranches_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersBranches_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersBranches]'))
ALTER TABLE [dbo].[UsersBranches] CHECK CONSTRAINT [FK_UsersBranches_Users]
GO
/****** Object:  ForeignKey [FK_UsersSubordinates_Users]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersSubordinates_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersSubordinates]'))
ALTER TABLE [dbo].[UsersSubordinates]  WITH CHECK ADD  CONSTRAINT [FK_UsersSubordinates_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersSubordinates_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersSubordinates]'))
ALTER TABLE [dbo].[UsersSubordinates] CHECK CONSTRAINT [FK_UsersSubordinates_Users]
GO
/****** Object:  ForeignKey [FK_Villages_Users]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Villages_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Villages]'))
ALTER TABLE [dbo].[Villages]  WITH CHECK ADD  CONSTRAINT [FK_Villages_Users] FOREIGN KEY([loan_officer])
REFERENCES [dbo].[Users] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Villages_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Villages]'))
ALTER TABLE [dbo].[Villages] CHECK CONSTRAINT [FK_Villages_Users]
GO
/****** Object:  ForeignKey [FK_VillagesAttendance_Villages]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VillagesAttendance_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[VillagesAttendance]'))
ALTER TABLE [dbo].[VillagesAttendance]  WITH CHECK ADD  CONSTRAINT [FK_VillagesAttendance_Villages] FOREIGN KEY([village_id])
REFERENCES [dbo].[Villages] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VillagesAttendance_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[VillagesAttendance]'))
ALTER TABLE [dbo].[VillagesAttendance] CHECK CONSTRAINT [FK_VillagesAttendance_Villages]
GO
/****** Object:  ForeignKey [FK_VillagesPersons_Villages]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VillagesPersons_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[VillagesPersons]'))
ALTER TABLE [dbo].[VillagesPersons]  WITH CHECK ADD  CONSTRAINT [FK_VillagesPersons_Villages] FOREIGN KEY([village_id])
REFERENCES [dbo].[Villages] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VillagesPersons_Villages]') AND parent_object_id = OBJECT_ID(N'[dbo].[VillagesPersons]'))
ALTER TABLE [dbo].[VillagesPersons] CHECK CONSTRAINT [FK_VillagesPersons_Villages]
GO
/****** Object:  ForeignKey [FK_WriteOffEvents_ContractEvents]    Script Date: 02/13/2013 12:43:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WriteOffEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[WriteOffEvents]'))
ALTER TABLE [dbo].[WriteOffEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_WriteOffEvents_ContractEvents] FOREIGN KEY([id])
REFERENCES [dbo].[ContractEvents] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WriteOffEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[WriteOffEvents]'))
ALTER TABLE [dbo].[WriteOffEvents] NOCHECK CONSTRAINT [FK_WriteOffEvents_ContractEvents]
GO

 IF (not exists(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME = 'LateDaysRange'))
		BEGIN 
			CREATE TABLE LateDaysRange
			(
			 [Min] INT not  null, [Max] INT not  null, [Label] NVARCHAR(15) null, [Color] NVARCHAR(30) null
			)
		END
GO

IF  NOT EXISTS(SELECT *  FROM  INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'WriteOffOptions') 
BEGIN
CREATE TABLE WriteOffOptions
(
Id INT IDENTITY(1,1),
Name NVARCHAR(255)
)
END
GO

DECLARE @db_from NVARCHAR(MAX)
DECLARE @db_to NVARCHAR(MAX)

SELECT @db_from = DB_NAME()

SET @db_to = @db_from + '_attachments'

DECLARE @sql NVARCHAR(MAX)
SET @sql = 'CREATE DATABASE ' + @db_to
Print @sql
EXEC sp_executesql @sql

SET @sql = 'CREATE TABLE ' + @db_to + '..Pictures' +
'(
	[group] [nvarchar](50) NOT NULL,
	[id] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[picture] [image] NOT NULL,
	[thumbnail] [image] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[picture_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]'

EXEC sp_executesql @sql

SET @sql = 'ALTER TABLE ' + @db_to + '..Pictures ADD  CONSTRAINT [DF_Pictures_subid]  DEFAULT ((0)) FOR [subid]'
EXEC sp_executesql @sql
GO

CREATE FUNCTION [dbo].[GetSubordinates](@id_user INT)
RETURNS TABLE
AS RETURN
(
 SELECT  *, 
    (SELECT COUNT(*)
	FROM dbo.Credit 
	WHERE loanofficer_id = u.id) AS num_contracts
 FROM  dbo.users u LEFT JOIN dbo.UsersSubordinates us  ON u.id = us.subordinate_id
 WHERE us.user_id  = @id_user AND u.deleted =0 
)
GO

CREATE TABLE Categories
(
Id int identity(1,1) primary key,
ParentId int,
Name nvarchar(128),
lft int ,
rgt int
)
GO

CREATE TABLE Accounts
(
 account_number varchar(32) primary key,
 label nvarchar(256) not null,
 is_debit bit,
 is_balance_account bit default(0),
 can_be_negative bit default(0),
 id_category int foreign key references Categories(Id),
 parent varchar(32) foreign key references Accounts(account_number),
 [start_date] datetime NULL,
 close_date datetime NULL,
 [type] tinyint NULL,
 is_direct bit NULL,
 lft int default(0),
 rgt int default(0)
) 
GO

CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DebitAccount] varchar(32) foreign key references Accounts(account_number),
	[CreditAccount] varchar(32) foreign key references Accounts(account_number),
	[Amount] [decimal](25, 15) NULL,
	[Date] [datetime] NULL,
	[LoanEventId] [int] NOT NULL DEFAULT(0),
	[SavingEventId] [int] NOT NULL DEFAULT(0),
	[LoanId] [int] NULL,
	[ClientId] [int] NULL,
	[UserId] [int] NULL,
	[BranchId] [int] NULL,
    [AdvanceId] [int] NULL,
    [StaffId] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[IsExported] [bit] NOT NULL DEFAULT(0),
	[IsDeleted] [bit] NOT NULL DEFAULT(0),
    [IsManualEditable] [bit] NULL,
    [doc1] [varchar](255) NULL,
	[doc2] [varchar](255) NULL,
	[CancelDate] DATE NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE
    dbo.BounceFeeAccrualEvents
(   
    id int not null,
    bounce_fee money not null,
    installment_number int not null
)

ALTER TABLE
    dbo.BounceFeeAccrualEvents
ADD CONSTRAINT
    PK_BounceFeeAccrualEvents_id primary key (id)
 
ALTER TABLE
    dbo.BounceFeeAccrualEvents
ADD CONSTRAINT
    FK_BounceFeeAccrualEvents_id foreign key (id) references dbo.ContractEvents(id)
GO

CREATE TABLE
    dbo.BounceWriteOffEvents
(   
    id int not null,
    amount money not null,
    installment_number int not null
)

ALTER TABLE
    dbo.BounceWriteOffEvents
ADD CONSTRAINT
    PK_BounceWriteOffEvents_id primary key (id)
 
ALTER TABLE
    dbo.BounceWriteOffEvents
ADD CONSTRAINT
    FK_BounceWriteOffEvents_id foreign key (id) references dbo.ContractEvents(id)
GO

CREATE TABLE dbo.FuseboxLogs
(
    fuse_name nvarchar(50) not null
    , started_at datetime not null
    , ended_at datetime not null
    , error_message nvarchar(max) null
    , stack_trace nvarchar(max) null
)
GO

IF (NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NonAccrualInterestEvents]')))
    BEGIN
        CREATE TABLE dbo.NonAccrualInterestEvents
        (
            id int null
            , interest money null
        )
    END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualInterestEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualInterestEvents]'))
    ALTER TABLE [dbo].[NonAccrualInterestEvents] DROP CONSTRAINT [FK_NonAccrualInterestEvents_ContractEvents]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualInterestEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualInterestEvents]'))
    ALTER TABLE [dbo].[NonAccrualInterestEvents] WITH NOCHECK ADD CONSTRAINT [FK_NonAccrualInterestEvents_ContractEvents] FOREIGN KEY([id])
    REFERENCES [dbo].[ContractEvents] ([id])
GO

IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualInterestEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualInterestEvents]'))
    ALTER TABLE [dbo].[NonAccrualInterestEvents] NOCHECK CONSTRAINT [FK_NonAccrualInterestEvents_ContractEvents]
GO

IF (NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]')))
    BEGIN
        CREATE TABLE dbo.NonAccrualPenaltyEvents
        (
            id int not null
            , penalty money not null
        ) ON [PRIMARY]
    END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualPenaltyEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_NonAccrualPenaltyEvents_ContractEvents]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualPenaltyEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] WITH NOCHECK ADD CONSTRAINT [FK_NonAccrualPenaltyEvents_ContractEvents] FOREIGN KEY([id])
    REFERENCES [dbo].[ContractEvents] ([id])
GO

IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualPenaltyEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] NOCHECK CONSTRAINT [FK_NonAccrualPenaltyEvents_ContractEvents]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NonAccrualPenaltyEvents_ContractEvents]') AND parent_object_id = OBJECT_ID(N'[dbo].[NonAccrualPenaltyEvents]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_NonAccrualPenaltyEvents_ContractEvents]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Principal_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Packages_Principal_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Principal_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Packages_Principal_Account] FOREIGN KEY([principal_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Interest_Accrued_But_Due_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Packages_Interest_Accrued_But_Due_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Interest_Accrued_But_Due_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Packages_Interest_Accrued_But_Due_Account] FOREIGN KEY([interest_accrued_but_not_due_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Interest_Due_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Packages_Interest_Due_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Interest_Due_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Packages_Interest_Due_Account] FOREIGN KEY([interest_due_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Interest_Due_But_Not_Received_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Packages_Interest_Due_But_Not_Received_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Interest_Due_But_Not_Received_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Packages_Interest_Due_But_Not_Received_Account] FOREIGN KEY([interest_due_but_not_received_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Interest_Income_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Packages_Interest_Income_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Interest_Income_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Packages_Interest_Income_Account] FOREIGN KEY([interest_income_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Tax_On_Interests_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Packages_Tax_On_Interests_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Tax_On_Interests_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Packages_Tax_On_Interests_Account] FOREIGN KEY([tax_on_interests_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Accrued_Penalty_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Packages_Accrued_Penalty_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Accrued_Penalty_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Packages_Accrued_Penalty_Account] FOREIGN KEY([accrued_penalty_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Penalty_Income_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Packages_Penalty_Income_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Packages_Penalty_Income_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Packages_Penalty_Income_Account] FOREIGN KEY([penalty_income_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Tax_On_Penalty_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[NonAccrualPenaltyEvents] DROP CONSTRAINT [FK_Accounts_Tax_On_Penalty_Account]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Tax_On_Penalty_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
    ALTER TABLE [dbo].[Packages] WITH NOCHECK ADD CONSTRAINT [FK_Accounts_Tax_On_Penalty_Account] FOREIGN KEY([tax_on_penalty_account])
    REFERENCES [dbo].[Accounts] ([account_number])
GO