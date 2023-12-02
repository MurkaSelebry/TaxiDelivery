using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class ViewRatesDetailsClient
{
    public int IdRate { get; set; }

    public int IdOrder { get; set; }

    public int RateClient { get; set; }

    public int RateDriver { get; set; }

    public int IdOrderDetail { get; set; }

    public DateTime DateOrder { get; set; }

    public string PaymentType { get; set; } = null!;

    public decimal Cost { get; set; }

    public string Status { get; set; } = null!;

    public int IdClient { get; set; }

    public string NameFirst { get; set; } = null!;

    public string NameSecond { get; set; } = null!;
}
