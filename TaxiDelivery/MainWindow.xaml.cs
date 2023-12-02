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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace taxi
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void AdminButton_Click(object sender, RoutedEventArgs e)
        {
            Admin adminWindow = new Admin();
            adminWindow.Show();
            this.Close();
        }

        private void DriverButton_Click(object sender, RoutedEventArgs e)
        {
            LoginOrSignUp loginOrSignUp = new LoginOrSignUp('d');
            loginOrSignUp.Show();
            this.Close();
        }
        private void ClientButton_Click(object sender, RoutedEventArgs e)
        {
            LoginOrSignUp loginOrSignUp = new LoginOrSignUp('c');
            loginOrSignUp.Show();
            this.Close();
        }
    }
}
