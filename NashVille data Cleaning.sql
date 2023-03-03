
---- Formatting the Date
--select * 
--from Portfolioproject..NashvilleA;

--select format(SaleDate,'dd/MM/yyyy')
--from Portfolioproject..NashvilleA;


--select SaleDate, convert(date,SaleDate)
--from Portfolioproject..NashvilleA;

--Update Portfolioproject..NashvilleA
--SET SaleDateConverted= CONVERT(Date,SaleDate);

--Alter table Portfolioproject..NashvilleA
--Add SaleDateConverted date;


-- Formatting the address


--select ParcelID,PropertyAddress
--from Portfolioproject..NashvilleA
--where PropertyAddress is null
--order by ParcelID;

--select * 
--from Portfolioproject..NashvilleA
--where ParcelID='025 07 0 031.00';



--select a.ParcelID,b.ParcelID,a.PropertyAddress, b.propertyAddress, ISNULL(a.PropertyAddress,b.propertyAddress)
--from Portfolioproject..NashvilleA as a
--join Portfolioproject..NashvilleA as B
--on a.ParcelID= b.ParcelID
--AND a.UniqueID<>b.UniqueID
--where a.propertyAddress is null

--Update a
--set a.propertyAddress=ISNULL(a.PropertyAddress,b.propertyAddress)
--from Portfolioproject..NashvilleA as a
--join Portfolioproject..NashvilleA as B
--on a.ParcelID= b.ParcelID
--AND a.UniqueID<>b.UniqueID
--where a.propertyAddress is null


--Formatting Address 

--select PropertyAddress
--from Portfolioproject..NashvilleA;

--Select 
--SUBSTRING(PropertyAddress,1, CharIndex(',',propertyAddress)-1)as Address, 
--SUBSTRING(PropertyAddress,charindex(',',Propertyaddress)+1,len(PropertyAddress)) as City
--from Portfolioproject..NashvilleA;



--UPDATE Portfolioproject..NashvilleA
--sET PropertysplitAddress VARCHAR(60)=SUBSTRING(PropertyAddress,1, CharIndex(',',propertyAddress)-1),
--SET PropertysplitCity VARCHAR(60)=SUBSTRING(PropertyAddress,charindex(',',Propertyaddress)+1,len(PropertyAddress))

--Alter table Portfolioproject..NashvilleA
--Add PropertysplitAddress VARCHAR(60)

--UPDATE Portfolioproject..NashvilleA
--sET PropertysplitAddress=SUBSTRING(PropertyAddress,1, CharIndex(',',propertyAddress)-1)

--Alter table Portfolioproject..NashvilleA
--Add PropertysplitCity VARCHAR(60)

--UPDATE Portfolioproject..NashvilleA
--SET PropertysplitCity=SUBSTRING(PropertyAddress,charindex(',',Propertyaddress)+1,len(PropertyAddress))

--select OwnerAddress,
-- parsename(replace(OwnerAddress,',','.'),3)
-- from Portfolioproject..NashvilleA;


-- Alter table Portfolioproject..NashvilleA
--Add OwnersplitAddress VARCHAR(60)
--UPDATE Portfolioproject..NashvilleA
--set OwnersplitAddress =parsename(replace(OwnerAddress,',','.'),3)


-- Alter table Portfolioproject..NashvilleA
--Add OwnersplitCity VARCHAR(60)
--UPDATE Portfolioproject..NashvilleA
--set OwnersplitCity =parsename(replace(OwnerAddress,',','.'),2)


-- Alter table Portfolioproject..NashvilleA
--Add OwnersplitState VARCHAR(60)
--UPDATE Portfolioproject..NashvilleA
--set OwnersplitState =parsename(replace(OwnerAddress,',','.'),1)


-- Change Y and N to Yes and No in "Sold as Vacant" field

--select 

--Case 
--when SoldAsVacant ='N' then 'No'
--when SoldAsVacant ='Y' then 'Yes'
--else SoldAsVacant
--end

--from Portfolioproject..NashvilleA;

--select distinct(SoldAsVacant)
--from Portfolioproject..NashvilleA;

--Update Portfolioproject..NashvilleA
--set SoldAsVacant=Case 
--when SoldAsVacant ='N' then 'No'
--when SoldAsVacant ='Y' then 'Yes'
--else SoldAsVacant
--end

-- Remove Duplicates

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From PortfolioProject.dbo.NashvilleHousing
--order by ParcelID
)
Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress



Select *
From PortfolioProject.dbo.NashvilleHousing




---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns



Select *
From PortfolioProject.dbo.NashvilleHousing


ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

