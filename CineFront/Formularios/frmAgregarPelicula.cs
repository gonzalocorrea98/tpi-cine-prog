using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CineBack.acceso_a_datos;
using CineBack.fachada;
using CineBack.soporte;
using Clases.ApiRest;
using Newtonsoft.Json;
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

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            Pelicula pelicula = new Pelicula();

            pelicula.NombrePelicula = txNombre.Text;
            pelicula.IdDirector = cboDirector.SelectedIndex;
            pelicula.IdClasificacion = cboClasificacion.SelectedIndex;
            pelicula.IdIdioma = cboidioma.SelectedIndex;
            pelicula.FechaEstreno = dtpFechaestreno.Value;

            string json = JsonConvert.SerializeObject(pelicula);

            dynamic respuesta = dataApi.Post("https://localhost:44301/registrarPelicula",json);

            MessageBox.Show(respuesta.ToString());
        }
    }
}
