using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class Fare
{
    public int IdFare { get; set; }

    public string Title { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual ICollection<Car> Cars { get; } = new List<Car>();

    public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
