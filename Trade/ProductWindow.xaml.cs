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

namespace Trade
{
  /// <summary>
  /// Логика взаимодействия для ProductWindow.xaml
  /// </summary>
  public partial class ProductWindow : Window
  {
    private Base.Product product;
    private string[] manufacturers = { "Davinci", "Attribute", "Doria", "Alaska", "Apollo", "Smart Home", "Mayer & Boch" };
    private string[] categories = { "Ложки", "Наборы", "Ножи" };
    public ProductWindow(Base.Product selectedProduct = null)
    {
      InitializeComponent();
      categoryComboBox.SelectedItem = categories[0];
      categoryComboBox.ItemsSource = categories;
      manufacturerComboBox.SelectedItem = manufacturers[0];
      manufacturerComboBox.ItemsSource= manufacturers;
      product = selectedProduct;
      SetControllWindow();
    }

    private void SetControllWindow()
    {
      if (product == null)
      {
        titleText.Text = "Добавление продукта";
        addButton.Visibility = Visibility.Visible;
        editButton.Visibility = Visibility.Collapsed;
        delButton.Visibility = Visibility.Collapsed;
      }
      else
      {
        titleText.Text = "Изменение продукта";
        addButton.Visibility = Visibility.Collapsed;
        editButton.Visibility = Visibility.Visible;
        delButton.Visibility = Visibility.Visible;
        articulText.Visibility = Visibility.Collapsed;
        articulTextBlock.Visibility = Visibility.Collapsed;
        nameText.Text = product.ProductName;
        categoryComboBox.SelectedItem = product.ProductCategory;
        descriptionText.Text = product.ProductDescription;
        manufacturerComboBox.SelectedItem = product.ProductManufacturer;
        costText.Text = product.ProductCost.ToString();
        quantityText.Text = product.ProductQuantityInStock.ToString();
      }
    }

    private void changeMainWindow()
    {
      MainWindow window = new MainWindow();
      Hide();
      window.Show();
      Close();
    }

    private void changeProducts(bool isAdd)
    {
      string error = "";
      if (articulText.Text == "" && product == null) error += "Не введен Артикул\n";
      if (nameText.Text == "") error += "Не введено Название\n";
      if (descriptionText.Text == "") error += "Не введено Описание\n";
      if (costText.Text == "") error += "Не введена Цена\n";
      if (quantityText.Text == "") error += "Не введено Количество на складе\n";
      try
      {
        if (costText.Text != "" && decimal.Parse(costText.Text) < 0) error += "Цена должна быть больше ноля\n";
        if (quantityText.Text != "" && int.Parse(quantityText.Text) < 0) error += "Количество на складе должно быть больше ноля\n";
      }
      catch
      {
        MessageBox.Show("Неверный формат данных", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
        return;
      }
      if (error != "")
      {
        MessageBox.Show(error, "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
        return;
      }

      Base.Product newProduct = new Base.Product();
      if (isAdd)
      {
        newProduct.ProductName = nameText.Text.Trim();
        newProduct.ProductArticleNumber = articulText.Text.Trim();
        newProduct.ProductDescription = descriptionText.Text.Trim();
        newProduct.ProductCategory = categoryComboBox.SelectedItem.ToString().Trim();
        newProduct.ProductManufacturer = manufacturerComboBox.SelectedItem.ToString().Trim();
        newProduct.ProductCost = decimal.Parse(costText.Text);
        newProduct.ProductQuantityInStock = int.Parse(quantityText.Text);
        SourceBase.tradeBase.Product.Add(newProduct);
      }
      else
      {
        newProduct = SourceBase.tradeBase.Product.First(el => el.ProductArticleNumber == product.ProductArticleNumber);
        newProduct.ProductName = nameText.Text.Trim();
        newProduct.ProductDescription = descriptionText.Text.Trim();
        newProduct.ProductCategory = categoryComboBox.SelectedItem.ToString().Trim();
        newProduct.ProductManufacturer = manufacturerComboBox.SelectedItem.ToString().Trim();
        newProduct.ProductCost = decimal.Parse(costText.Text);
        newProduct.ProductQuantityInStock = int.Parse(quantityText.Text);
      }

      try
      {
        SourceBase.tradeBase.SaveChanges();
        changeMainWindow();
      }
      catch (Exception ex)
      {
        MessageBox.Show(ex.Message.ToString());
      }
    }

    private void AddButton_Click(object sender, RoutedEventArgs e)
    {
      changeProducts(true);
    }

    private void CanselButton_Click(object sender, RoutedEventArgs e)
    {
      changeMainWindow();
    }

    private void EditButton_Click(object sender, RoutedEventArgs e)
    {
      changeProducts(false);
    }

    private void DelButton_Click(object sender, RoutedEventArgs e)
    {
      if (MessageBox.Show("Удалить запись?", "Внимание", MessageBoxButton.OKCancel, MessageBoxImage.Warning) == MessageBoxResult.OK)
      {

        try
        {
          Base.Product newProduct = new Base.Product();
          newProduct = SourceBase.tradeBase.Product.First(el => el.ProductArticleNumber == product.ProductArticleNumber);
          SourceBase.tradeBase.Product.Remove(newProduct);
          SourceBase.tradeBase.SaveChanges();
          changeMainWindow();
        }
        catch
        {
          MessageBox.Show("Невозможно удалить запись, так как она используется в других справочниках базы данных.",
          "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning, MessageBoxResult.None);
        }
      }
      
    }
  }
}
