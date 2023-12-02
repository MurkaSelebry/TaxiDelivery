using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class Order
{
    public int IdOrder { get; set; }

    public int IdClient { get; set; }

    public int IdDriver { get; set; }

    public string AddressSource { get; set; } = null!;

    public string AddressTarget { get; set; } = null!;

    public int IdFare { get; set; }

    public virtual Client IdClientNavigation { get; set; } = null!;

    public virtual Driver IdDriverNavigation { get; set; } = null!;

    public virtual Fare IdFareNavigation { get; set; } = null!;

    public virtual OrderDetail? OrderDetail { get; set; }

    public virtual ICollection<Rate> Rates { get; } = new List<Rate>();
}
