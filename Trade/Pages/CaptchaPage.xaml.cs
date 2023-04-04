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
using System.Windows.Threading;

namespace Trade.Pages
{
  /// <summary>
  /// Логика взаимодействия для CaptchaPage.xaml
  /// </summary>
  public partial class CaptchaPage : Page
  {
    public CaptchaPage()
    {
      InitializeComponent();
      FillCaptcha();
    }

    public delegate void CaptchaEventHandler(object sendor, EventArgs e);
    public event CaptchaEventHandler CaptchaEvent;

    private void FillCaptcha()
    {
      captchaText.Text = "";
      const string chars = "abcdefghijklmnopqrstuvwxyABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
      Random random = new Random();
      string randomString = new string(Enumerable.Repeat(chars, 6).Select(s => s[random.Next(s.Length)]).ToArray());
      captchaText.Text = randomString;
    }

    private void SubmitButton_Click(object sender, RoutedEventArgs e)
    {
      if (captchaText.Text == inputCaptchaText.Text)
      {
        CaptchaEvent?.Invoke(sender, EventArgs.Empty);
      }
      else
      {
        FillCaptcha();
        DispatcherTimer timer = new DispatcherTimer();
        timer.Interval = TimeSpan.FromSeconds(5);
        timer.Tick += Timer_Tick;
        timer.Start();
        submitButton.IsEnabled = false;
        MessageBox.Show("Неверно введена капча", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
      }
    }

    private void Timer_Tick(object sender, EventArgs e)
    {
      DispatcherTimer timer = sender as DispatcherTimer;
      timer.Stop();
      submitButton.IsEnabled = true;
    }

  }
}
