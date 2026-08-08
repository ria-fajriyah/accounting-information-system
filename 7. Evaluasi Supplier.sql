SELECT
    S.SupplierID,
    S.NamaSupplier,
    Count(PO.POID) AS FrekuensiTransaksi,
    Sum(PD.QtyOrder * PD.HargaBeliSepakat) AS TotalNilaiPembelian
FROM
    (
        Supplier AS S
        INNER JOIN PurchaseOrder AS PO ON S.SupplierID = PO.SupplierID
    )
    INNER JOIN PurchaseOrderDetail AS PD ON PO.POID = PD.POID
GROUP BY
    S.SupplierID,
    S.NamaSupplier
ORDER BY
    Count(PO.POID) DESC;