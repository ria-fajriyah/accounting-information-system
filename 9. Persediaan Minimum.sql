SELECT
    r.NamaProvinsi,
    p.Merk,
    p.Varian,
    i.QtyOnHand,
    i.MinimumStock
FROM
    (
        Inventory AS i
        INNER JOIN Product AS p ON i.ProductID = p.ProductID
    )
    INNER JOIN Regional AS r ON i.RegionalID = r.RegionalID
WHERE
    i.QtyOnHand <= i.MinimumStock;