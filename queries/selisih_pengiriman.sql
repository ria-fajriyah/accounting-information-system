SELECT
    so.SalesOrderID,
    p.Merk,
    p.Varian,
    sod.QtyOrder,
    dd.QtyKirim,
    sod.QtyOrder - dd.QtyKirim AS Selisih
FROM
    (
        (
            (
                SalesOrder AS so
                INNER JOIN SalesOrderDetail AS sod ON so.SalesOrderID = sod.SalesOrderID
            )
            INNER JOIN Delivery AS d ON so.SalesOrderID = d.SalesOrderID
        )
        INNER JOIN DeliveryDetail AS dd ON d.DeliveryID = dd.DeliveryID
    )
    INNER JOIN Product AS p ON sod.ProductID = p.ProductID
WHERE
    sod.ProductID = dd.ProductID
    AND sod.QtyOrder <> dd.QtyKirim;
