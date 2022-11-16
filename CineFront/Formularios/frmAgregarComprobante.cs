﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CineFront
{
    public partial class frmAgregarComprobante : Form
    {
        public frmAgregarComprobante()
        {
            InitializeComponent();
        }

        private void frmAgregarEntrada_Load(object sender, EventArgs e)
        {
            txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtPrecio.Text = 200.ToString();
        }

        //************************************* METODOS *************************************

        //POST

        //PUT

        //************************************* BOTONES *************************************

        //AGREGAR

        //EDITAR

        //CANCELAR
        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
            frmEntradas formularioEntradas = new frmEntradas();
            formularioEntradas.Show();
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

        private void frmAgregarEntrada_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
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

        private void txtPrecio_KeyPress(object sender, KeyPressEventArgs e)
        {
            if((e.KeyChar >= 32 && e.KeyChar <= 47) || (e.KeyChar >=58 && e.KeyChar <= 255))
            {
                MessageBox.Show("Sólo Números.", "ALERTA", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                e.Handled = true;
                return; 
            }
        }
    }
}