SELECT
    c.CustomerID,
    c.NamaCustomer,
    Sum(sod.QtyOrder * sod.HargaSatuan) AS TotalPenjualan
FROM
    (
        Customer AS c
        INNER JOIN SalesOrder AS so ON c.CustomerID = so.CustomerID
    )
    INNER JOIN SalesOrderDetail AS sod ON so.SalesOrderID = sod.SalesOrderID
GROUP BY
    c.CustomerID,
    c.NamaCustomer
ORDER BY
    Sum(sod.QtyOrder * sod.HargaSatuan) DESC;
