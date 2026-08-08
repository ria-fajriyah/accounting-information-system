SELECT
    s.NamaSupplier,
    Sum(pod.QtyOrder * pod.HargaBeliSepakat) AS TotalPembelian
FROM
    (
        Supplier AS s
        INNER JOIN PurchaseOrder AS po ON s.SupplierID = po.SupplierID
    )
    INNER JOIN PurchaseOrderDetail AS pod ON po.POId = pod.POId
GROUP BY
    s.NamaSupplier
ORDER BY
    Sum(pod.QtyOrder * pod.HargaBeliSepakat) DESC;