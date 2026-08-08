SELECT
    c.NamaCustomer,
    si.InvoiceID,
    si.TglJatuhTempo,
    si.TotalTagihan,
    Date() - si.TglJatuhTempo AS UmurPiutang
FROM
    (
        (
            Customer AS c
            INNER JOIN SalesOrder AS so ON c.CustomerID = so.CustomerID
        )
        INNER JOIN Delivery AS d ON so.SalesOrderID = d.SalesOrderID
    )
    INNER JOIN SalesInvoice AS si ON d.DeliveryID = si.DeliveryID
WHERE
    si.InvoiceID NOT IN (
        SELECT
            InvoiceID
        FROM
            CashReceipt
    );