using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.ConstrainedExecution;
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

namespace taxi
{
    public partial class Admin : Window
    {
        public ObservableCollection<Car> Cars { get; set; }
        public ObservableCollection<Price> Prices { get; set; }

        public Admin()
        {
            InitializeComponent();

            // Инициализация списка машин (загрузка из базы данных)
            //Cars = LoadCarsFromDatabase();
            //carDataGrid.ItemsSource = Cars;

            // Инициализация списка цен (загрузка из базы данных)
        //    Prices = LoadPricesFromDatabase();
        //    priceDataGrid.ItemsSource = Prices;
        }

        public class Car
        {
            public string Brand { get; set; }
            public string Model { get; set; }
            public int Year { get; set; }
            public string Color { get; set; }
            public string RegistrationNumber { get; set; }
        }

        public class Price
        {
            public string Tariff { get; set; }
            public double PricePerKm { get; set; }
        }

        private void AddCar_Click(object sender, RoutedEventArgs e)
        {

        }

        private void EditCar_Click(object sender, RoutedEventArgs e)
        {

        }

        private void DeleteCar_Click(object sender, RoutedEventArgs e)
        {

        }

        private void SaveChanges_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
