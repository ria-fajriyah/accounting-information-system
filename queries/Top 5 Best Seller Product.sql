SELECT
    TOP 5 p.ProductID,
    p.Merk,
    p.Varian,
    Sum(sod.QtyOrder) AS TotalQtyTerjual,
    Sum(sod.QtyOrder * sod.HargaSatuan) AS TotalPenjualan
FROM
    Product AS p
    INNER JOIN SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
GROUP BY
    p.ProductID,
    p.Merk,
    p.Varian
ORDER BY
    Sum(sod.QtyOrder) DESC;