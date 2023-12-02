using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TaxiDelivery.DataLayer;
using TaxiDelivery.DataLayer.Functions;

namespace taxi
{
    /// <summary>
    /// Логика взаимодействия для Client.xaml
    /// </summary>
    public partial class Client : Window
    {
        public Client(string email, string phone)
        {
            InitializeComponent();
        }

        private void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            TaxiDelivery.Models.Order newOrder = new TaxiDelivery.Models.Order()
            {
                IdClient = 1,
                IdDriver = 1,
                AddressSource = txtFrom.Text,
                AddressTarget = txtTo.Text,
                IdFare = 1
            };
            DL.ctx.Orders.Add(newOrder);
            txtTripCost.Text = Func.CalculateOrderCost().ToString();
            DL.ctx.SaveChanges();

        }

        private void RateButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void UpdateTripCost()
        {
            //обновление стоимости поездки
            //if (double.TryParse(txtDistance.Text, out double distance))
            //{
            //    double pricePerKm = GetPricePerKmByTariff(cmbTariff.Text);
            //    double tripCost = distance * pricePerKm;
            //    txtTripCost.Text = tripCost.ToString;
            //}

        }
        private double GetPricePerKmByTariff(string tariff)
        {
            //тип так

            //switch (tariff)
            //{
            //    case "Эконом":
            //        return 5.0; 
                    return 0.0;
        }
    }
}
