using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Windows.Forms;
using CineBack.acceso_a_datos;
using CineBack.fachada;
using CineBack.soporte;
using Clases.ApiRest;
using RestSharp;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace CineFront
{
    public partial class frmAgregarPelicula : Form
    {
        DBApi dataApi;

        public frmAgregarPelicula()
        {
            InitializeComponent();
            dataApi = new DBApi();
        }

        private void frmAgregarPelicula_Load(object sender, EventArgs e)
        {
            DataTable tabla1 = HelperDao.ObtenerInstancia().ConsultaSQL("SP_CONSULTAR_DIRECTORES", null);
            cboDirector.DataSource = tabla1;
            cboDirector.ValueMember = "id_director";
            cboDirector.DisplayMember = "nombre";

            DataTable tabla2 = HelperDao.ObtenerInstancia().ConsultaSQL("SP_CONSULTAR_IDIOMAS", null);
            cboidioma.DataSource = tabla2;
            cboidioma.ValueMember = "id_idioma";
            cboidioma.DisplayMember = "idioma";

            DataTable tabla3 = HelperDao.ObtenerInstancia().ConsultaSQL("SP_CONSULTAR_CLASIFICACIONES", null);
            cboClasificacion.DataSource = tabla3;
            cboClasificacion.ValueMember = "id_clasificacion";
            cboClasificacion.DisplayMember = "clasificacion";
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
            frmHome frmHome = new frmHome();
            frmHome.Show();
        }

        private async void btnAceptar_Click(object sender, EventArgs e)
        {
            Pelicula pelicula = new Pelicula();

            pelicula.IdPelicula = 0;
            pelicula.NombrePelicula = txNombre.Text;
            pelicula.IdDirector = cboDirector.SelectedIndex;
            pelicula.IdClasificacion = cboClasificacion.SelectedIndex;
            pelicula.IdIdioma = cboidioma.SelectedIndex;
            pelicula.FechaEstreno = dtpFechaestreno.Value;

            await PostPelicula(pelicula);
        }

        public async Task<string> PostPelicula(Pelicula pelicula)
        {
            string url = "https://localhost:44301/registrarPelicula";
            var client = new HttpClient();

            var data = JsonSerializer.Serialize<Pelicula>(pelicula);
            HttpContent content = new StringContent(data, System.Text.Encoding.UTF8, "application/json");
            var HttpResponse = await client.PostAsync(url, content);

            if (HttpResponse.IsSuccessStatusCode)
            {
                MessageBox.Show("Se cargo con exito la pelicula");
                return "OK";
            }
            MessageBox.Show("Hubo un error al cargar la pelicula");
            return "false";
        }


        [DllImport("user32.Dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.Dll", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);


        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void frmAgregarPelicula_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);

        }

        private void label6_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Está por cerrar la aplicación.", "SALIR", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button2) == DialogResult.OK)
                Application.Exit();
        }
    }
}
