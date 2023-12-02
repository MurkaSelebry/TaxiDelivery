using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class ViewDriversCar
{
    public int IdDriver { get; set; }

    public string NameFirst { get; set; } = null!;

    public string NameSecond { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string NumberLicense { get; set; } = null!;

    public int IdCar { get; set; }

    public string Brand { get; set; } = null!;

    public string Model { get; set; } = null!;

    public short YearRelease { get; set; }

    public string Color { get; set; } = null!;
}
