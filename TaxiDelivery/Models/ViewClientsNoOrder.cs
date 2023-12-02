using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class ViewClientsNoOrder
{
    public int IdClient { get; set; }

    public string NameFirst { get; set; } = null!;

    public string NameSecond { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Email { get; set; } = null!;
}
