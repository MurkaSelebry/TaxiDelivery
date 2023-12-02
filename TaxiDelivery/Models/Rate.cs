using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class Rate
{
    public int IdRate { get; set; }

    public int IdOrder { get; set; }

    public int RateClient { get; set; }

    public int RateDriver { get; set; }

    public virtual Order IdOrderNavigation { get; set; } = null!;
}
