using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class ViewOrdersDetailsClient
{
    public int IdOrderDetail { get; set; }

    public DateTime DateOrder { get; set; }

    public string PaymentType { get; set; } = null!;

    public decimal Cost { get; set; }

    public string Status { get; set; } = null!;

    public int IdClient { get; set; }

    public string NameFirst { get; set; } = null!;

    public string NameSecond { get; set; } = null!;
}
