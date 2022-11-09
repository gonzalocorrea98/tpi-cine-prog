using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Reportes
{
    public partial class frmReporte : Form
    {
        public frmReporte()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'cINE_CORDOBA_PROGDataSet.ENTRADAS' Puede moverla o quitarla según sea necesario.
            this.eNTRADASTableAdapter.Fillby(this.cINE_CORDOBA_PROGDataSet.ENTRADAS,dtp1.Value,dtp2.Value);


            this.rptEntradas.RefreshReport();
        }

        private void btnFiltro_Click(object sender, EventArgs e)
        {

        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            rptEntradas.Show();
        }
    }
}
