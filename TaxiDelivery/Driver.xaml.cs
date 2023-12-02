using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TaxiDelivery.DataLayer;

namespace taxi
{
    public partial class Driver : Window
    {
        private ObservableCollection<TaxiDelivery.Models.OrderDetail> trips;
        private ObservableCollection<Order> orders;
        private ObservableCollection<Order> availableOrders;
        private TaxiDelivery.Models.Driver dd;
        public Driver(string email, string phone)
        {
            InitializeComponent();        
            lstTrips.ItemsSource = trips;
            dd = DL.FindDriverByEmailAndPhone(email, phone);
            rbEconomy.Content=DL.GetFareForDriver(dd.IdCar).Title;
            trips = LoadTripsFromDatabase(); // Загрузка истории поездок
            lstTrips.ItemsSource = trips;
            orders = LoadOrdersFromDatabase();
            availableOrders = new ObservableCollection<Order>();
            cmbAvailableOrders.ItemsSource = availableOrders;
        }

        private ObservableCollection<TaxiDelivery.Models.OrderDetail> LoadTripsFromDatabase()
        {
            // Заглушка
            return new ObservableCollection<TaxiDelivery.Models.OrderDetail>(DL.GetOrdersAndDetailsForDriver(dd.IdDriver));
        }
        private void TariffRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            
            RadioButton radioButton = (RadioButton)sender;
            string selectedTariff = radioButton.Content.ToString();
            
            UpdateAvailableOrders(selectedTariff);
        }
        
        private ObservableCollection<Order> LoadOrdersFromDatabase()
        {
            // Заглушка
            return new ObservableCollection<Order>
            {
                new Order { From = "Откуда", To = "Куда",  Distance = 12.5, Tariff = "Эконом" },
                new Order { From = "Откуда", To = "Куда",  Distance = 17.8, Tariff = "Комфорт" },
                // Добавьте остальные данные из базы данных
            };
        }
        private void SelectOrder_Click(object sender, RoutedEventArgs e)
        {
            if (cmbAvailableOrders.SelectedItem != null)
            {
                Order selectedOrder = (Order)cmbAvailableOrders.SelectedItem;
                MessageBox.Show($"Выбран заказ: {selectedOrder.FromTo}, {selectedOrder.Distance}");
            }
        }

        private void UpdateAvailableOrders(string selectedTariff)
        {
            availableOrders.Clear();

            foreach (Order order in orders.Where(o => o.Tariff == selectedTariff))
            {
                availableOrders.Add(order);
            }
        }
        private void rbEconomy_Checked(object sender, RoutedEventArgs e)
        {
            UpdateAvailableOrders("Эконом");
        }

        private void rbComfort_Checked(object sender, RoutedEventArgs e)
        {
            UpdateAvailableOrders("Комфорт");
        }

        private void rbBusiness_Checked(object sender, RoutedEventArgs e)
        {
            UpdateAvailableOrders("Бизнес");
        }
        private void CalculateAverageRating()
        {
            

        }
        public class Trip
        {
            public DateTime Date { get; set; }
            public string From { get; set; }
            public string To { get; set; }
            public int DistancePrice { get; set; }
            public string Tariff { get; set; }
            public int Rating { get; set; }
        }
        public class Order
        {
            public string From { get; set; }
            public string To { get; set; }
            public double Distance { get; set; }
            public string Tariff { get; set; }

            public string FromTo => $"{From} - {To}";

            public override string ToString()
            {
                return $"{From} - {To} ({Distance} км) - {Tariff}";
            }
        }
    }
}
