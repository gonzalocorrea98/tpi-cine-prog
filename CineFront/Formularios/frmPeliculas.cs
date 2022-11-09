using CineBack.soporte;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CineFront
{
    public partial class frmPeliculas : Form
    {
        string url = "https://localhost:44301/peliculas";

        public frmPeliculas()
        {
            InitializeComponent();

        }

        private async void frmPeliculas_Load(object sender, EventArgs e)
        {
            string respuesta = await GetHttp();
            List<Pelicula> lst = JsonConvert.DeserializeObject<List<Pelicula>>(respuesta);
            dgvPeliculas.DataSource = lst;
        }

        public async Task<string> GetHttp()
        {
            WebRequest oRequest = WebRequest.Create(url);
            WebResponse oResponse = oRequest.GetResponse();
            StreamReader sr = new StreamReader(oResponse.GetResponseStream());
            return await sr.ReadToEndAsync();
        }


        private void label6_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
            frmHome frmHome = new frmHome();
            frmHome.Show();
        }

        [DllImport("user32.Dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.Dll", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);

        private void frmPeliculas_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel3_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void label1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        

        private void button3_Click(object sender, EventArgs e)
        {
            frmAgregarPelicula agregarPelicula = new frmAgregarPelicula();
            agregarPelicula.ShowDialog();
        }

        
    }
}
