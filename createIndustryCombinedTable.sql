--BEGIN TRANSACTION;


USE [eve.SDEmount.full.Current]
CREATE TABLE [dbo].[industryCombined] (
    typeID INT,
    activityID INT,
    typeName NVARCHAR(255),
    groupName NVARCHAR(255),
    materialTypeID INT,
	materialQuantity INT
	
); 

-- Step 2: Populate the new table with data from the joined tables
INSERT INTO [dbo].[industryCombined] 
(
    typeID, 
    activityID, 
    typeName, 
    groupName, 
    materialTypeID,
	materialQuantity
)

sELECT 
    itm.typeID,
	iam.activityID AS activityID,
    it.TYPENAME AS typeName,
    ig.groupName AS groupName,
    itm.materialTypeID,
	itm.quantity AS materialQuantity
FROM 
    [dbo].[invTypeMaterials] itm
left JOIN 
    [dbo].[invTypes] it ON itm.typeID = it.typeID
left JOIN 
	[dbo].[industryActivityMaterials] iam on itm.typeID = iam.materialTypeID
left JOIN 
    [dbo].[invGroups] ig ON it.groupID = ig.groupID;

--IF @@ERROR = 0
--    COMMIT TRANSACTION;  
--ELSE
--    ROLLBACK TRANSACTION; 


--ALTER TABLE industrycombined ADD materialName NVARCHAR(255);
/*
UPDATE industryCombined
SET materialName = it.typeName
FROM industryCombined yt
LEFT JOIN invTypes it
ON yt.materialTypeID = it.typeID;
*/
