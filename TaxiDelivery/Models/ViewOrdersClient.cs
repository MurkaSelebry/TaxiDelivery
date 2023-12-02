using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class ViewOrdersClient
{
    public int IdOrder { get; set; }

    public string NameFirst { get; set; } = null!;

    public string NameSecond { get; set; } = null!;
}
