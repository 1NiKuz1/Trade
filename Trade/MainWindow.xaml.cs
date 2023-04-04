using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace Trade
{
  /// <summary>
  /// Логика взаимодействия для MainWindow.xaml
  /// </summary>
  public partial class MainWindow : Window
  {
    public static Base.User user = null;
    private string[] manufacturers = { "Все производители", "Davinci", "Attribute", "Doria", "Alaska", "Apollo", "Smart Home", "Mayer & Boch" };
    private ObservableCollection<Base.Product> products = new ObservableCollection<Base.Product>(SourceBase.tradeBase.Product);
    public MainWindow()
    {
      InitializeComponent();
      manufacturerFilter.SelectedItem = manufacturers[0];
      manufacturerFilter.ItemsSource = manufacturers;
      ProductList.ItemsSource = products;
      countProductsText.Text = products.Count + "/" + products.Count;
      SetControllWindow();
    }
    private void SetControllWindow()
    {
      productAddButton.Visibility = Visibility.Collapsed;
      if (user == null)
      {
        loginButton.Visibility = Visibility.Visible;
        logoutButton.Visibility = Visibility.Collapsed;
        fioUser.Text = "Guest";
      }
      else
      {
        loginButton.Visibility = Visibility.Collapsed;
        logoutButton.Visibility = Visibility.Visible;
        fioUser.Text = $"{user.UserName} {user.UserSurname} {user.UserPatronymic}";
        if (user.UserRole == 1)
          productAddButton.Visibility = Visibility.Visible;
      }
    }

    private void LoginButton_Click(object sender, RoutedEventArgs e)
    {
      AuthorizationWindow window = new AuthorizationWindow();
      Hide();
      window.Show();
      Close();
    }

    private void LogoutButton_Click(object sender, RoutedEventArgs e)
    {
      user = null;
      SetControllWindow();
    }

    private void ProductList_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
      if (user == null || user.UserRole != 1) return;
      ProductWindow window = new ProductWindow(ProductList.SelectedItem as Base.Product);
      Hide();
      window.Show();
      Close();
    }

    private void FilterProducts()
    {
      if (manufacturerFilter.SelectedItem.ToString() == manufacturers[0])
      {
        ProductList.ItemsSource = products.Where(el => el.ProductName.Contains(searchText.Text) ||
        el.ProductName.Contains(searchText.Text) ||
        el.ProductCost.ToString().Contains(searchText.Text) ||
        el.ProductManufacturer.Contains(searchText.Text) ||
        el.ProductQuantityInStock.ToString().Contains(searchText.Text));
      }
      else
      {
        ProductList.ItemsSource = products.Where(el => (el.ProductName.Contains(searchText.Text) ||
        el.ProductName.Contains(searchText.Text) ||
        el.ProductCost.ToString().Contains(searchText.Text) ||
        el.ProductQuantityInStock.ToString().Contains(searchText.Text)) &&
        el.ProductManufacturer.Contains(manufacturerFilter.SelectedItem.ToString()));
      }
      countProductsText.Text = ProductList.Items.Count + "/" + products.Count;
    }

    private void searchText_TextChanged(object sender, TextChangedEventArgs e)
    {
      FilterProducts();
    }

    private void ManufacturerFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
      FilterProducts();
    }

    private void productAddButton_Click(object sender, RoutedEventArgs e)
    {
      ProductWindow window = new ProductWindow();
      Hide();
      window.Show();
      Close();
    }
  }
}
