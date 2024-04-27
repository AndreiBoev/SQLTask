USE MindboxBase
SELECT p.Name, c.Name
FROM Product p
LEFT JOIN ProductOfCategory pc ON p.ProductId = pc.ProductId
LEFT JOIN Category c ON pc.CategoryId = c.CategoryId