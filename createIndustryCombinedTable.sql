
select 
	iap.activityID,
	iap.productTypeID,
	iap.quantity,
	iap.typeID AS iapBlueprintID,
	iam.quantity AS materialQty,
	iam.materialTypeID,
	pt.typeName AS productName,
	mt.typeName AS materialName,
	igp.groupName AS productGroupName
from 
	[dbo].[industryActivityProducts] iap
left join 
	[dbo].[industryActivityMaterials] iam 
	on iam.typeID = iap.typeID
LEFT JOIN 
    [dbo].[invTypes] pt 
    ON pt.typeID = iap.productTypeID
LEFT JOIN 
    [dbo].[invTypes] mt 
    ON mt.typeID = iam.materialTypeID
LEFT JOIn 
	invGroups igp 
	ON igp.groupID = pt.groupID

where iap.typeID = 17844
