using CineBack.dominio;
using CineBack.soporte;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CineFront
{
    public partial class frmEntradas : Form
    {
        public frmEntradas()
        {
            InitializeComponent();
        }

        private async void frmEntradas_Load(object sender, EventArgs e)
        {
            string respuesta = await GetHttp();
            List<Entrada> lst = JsonConvert.DeserializeObject<List<Entrada>>(respuesta);
            dgvEntradas.DataSource = lst;
        }

        //************************************* METODOS *************************************

        //GET
        public async Task<string> GetHttp()
        {
            string url = "https://localhost:44301/entradas";

            WebRequest oRequest = WebRequest.Create(url);
            WebResponse oResponse = oRequest.GetResponse();
            StreamReader sr = new StreamReader(oResponse.GetResponseStream());
            return await sr.ReadToEndAsync();
        }

        //DELETE

        //************************************* BOTONES *************************************

        //AGREGAR
        private void btnAgregar_Click_1(object sender, EventArgs e)
        {
            frmAgregarEntrada agregarEntrada = new frmAgregarEntrada();
            agregarEntrada.Show();
            this.Close();
        }

        //EDITAR
        private void btnEditar_Click(object sender, EventArgs e)
        {

        }

        //ELIMINAR
        private void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        //VOLVER
        private void btnVolver_Click(object sender, EventArgs e)
        {
            this.Close();
            frmHome frmHome = new frmHome();
            frmHome.Show();
        }

        //SALIR
        private void label6_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Está por cerrar la aplicación.", "SALIR", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button2) == DialogResult.OK)
                Application.Exit();
        }


        [DllImport("user32.Dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.Dll", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hwnd, int wmsg, int wparam, int lparam);

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void frmTransaccion_MouseDown(object sender, MouseEventArgs e)
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

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
    }
}
