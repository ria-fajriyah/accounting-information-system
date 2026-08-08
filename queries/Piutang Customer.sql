SELECT
    c.NamaCustomer,
    Sum(si.TotalTagihan) AS TotalInvoice,
    Nz (Sum(cr.Jumlah), 0) AS TotalDibayar,
    Sum(si.TotalTagihan) - Nz (Sum(cr.Jumlah), 0) AS SaldoPiutang
FROM
    (
        (
            (
                Customer AS c
                INNER JOIN SalesOrder AS so ON c.CustomerID = so.CustomerID
            )
            INNER JOIN Delivery AS d ON so.SalesOrderID = d.SalesOrderID
        )
        INNER JOIN SalesInvoice AS si ON d.DeliveryID = si.DeliveryID
    )
    LEFT JOIN CashReceipt AS cr ON si.InvoiceID = cr.InvoiceID
GROUP BY
    c.NamaCustomer
HAVING
    Sum(si.TotalTagihan) - Nz (Sum(cr.Jumlah), 0) > 0;