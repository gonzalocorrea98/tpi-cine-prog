﻿namespace CineFront
{
    partial class frmAgregarPelicula
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cboDirector = new System.Windows.Forms.ComboBox();
            this.cboClasificacion = new System.Windows.Forms.ComboBox();
            this.cboidioma = new System.Windows.Forms.ComboBox();
            this.txNombre = new System.Windows.Forms.TextBox();
            this.labelNombre = new System.Windows.Forms.Label();
            this.labelDirector = new System.Windows.Forms.Label();
            this.labelIdioma = new System.Windows.Forms.Label();
            this.labelClasificacion = new System.Windows.Forms.Label();
            this.dtpFechaestreno = new System.Windows.Forms.DateTimePicker();
            this.labelFechaEstreno = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.btnAceptar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cboDirector
            // 
            this.cboDirector.BackColor = System.Drawing.Color.LightGray;
            this.cboDirector.FormattingEnabled = true;
            this.cboDirector.Location = new System.Drawing.Point(310, 133);
            this.cboDirector.Name = "cboDirector";
            this.cboDirector.Size = new System.Drawing.Size(232, 23);
            this.cboDirector.TabIndex = 3;
            // 
            // cboClasificacion
            // 
            this.cboClasificacion.BackColor = System.Drawing.Color.LightGray;
            this.cboClasificacion.FormattingEnabled = true;
            this.cboClasificacion.Location = new System.Drawing.Point(310, 214);
            this.cboClasificacion.Name = "cboClasificacion";
            this.cboClasificacion.Size = new System.Drawing.Size(188, 23);
            this.cboClasificacion.TabIndex = 4;
            // 
            // cboidioma
            // 
            this.cboidioma.BackColor = System.Drawing.Color.LightGray;
            this.cboidioma.FormattingEnabled = true;
            this.cboidioma.Location = new System.Drawing.Point(310, 174);
            this.cboidioma.Name = "cboidioma";
            this.cboidioma.Size = new System.Drawing.Size(188, 23);
            this.cboidioma.TabIndex = 5;
            // 
            // txNombre
            // 
            this.txNombre.BackColor = System.Drawing.Color.LightGray;
            this.txNombre.Location = new System.Drawing.Point(310, 93);
            this.txNombre.Name = "txNombre";
            this.txNombre.Size = new System.Drawing.Size(232, 23);
            this.txNombre.TabIndex = 6;
            // 
            // labelNombre
            // 
            this.labelNombre.AutoSize = true;
            this.labelNombre.ForeColor = System.Drawing.Color.LightGray;
            this.labelNombre.Location = new System.Drawing.Point(209, 96);
            this.labelNombre.Name = "labelNombre";
            this.labelNombre.Size = new System.Drawing.Size(95, 15);
            this.labelNombre.TabIndex = 7;
            this.labelNombre.Text = "Nombre Pelicula";
            // 
            // labelDirector
            // 
            this.labelDirector.AutoSize = true;
            this.labelDirector.ForeColor = System.Drawing.Color.LightGray;
            this.labelDirector.Location = new System.Drawing.Point(209, 136);
            this.labelDirector.Name = "labelDirector";
            this.labelDirector.Size = new System.Drawing.Size(49, 15);
            this.labelDirector.TabIndex = 8;
            this.labelDirector.Text = "Director";
            // 
            // labelIdioma
            // 
            this.labelIdioma.AutoSize = true;
            this.labelIdioma.ForeColor = System.Drawing.Color.LightGray;
            this.labelIdioma.Location = new System.Drawing.Point(209, 177);
            this.labelIdioma.Name = "labelIdioma";
            this.labelIdioma.Size = new System.Drawing.Size(44, 15);
            this.labelIdioma.TabIndex = 9;
            this.labelIdioma.Text = "Idioma";
            // 
            // labelClasificacion
            // 
            this.labelClasificacion.AutoSize = true;
            this.labelClasificacion.ForeColor = System.Drawing.Color.LightGray;
            this.labelClasificacion.Location = new System.Drawing.Point(209, 217);
            this.labelClasificacion.Name = "labelClasificacion";
            this.labelClasificacion.Size = new System.Drawing.Size(74, 15);
            this.labelClasificacion.TabIndex = 10;
            this.labelClasificacion.Text = "Clasificacion";
            // 
            // dtpFechaestreno
            // 
            this.dtpFechaestreno.Location = new System.Drawing.Point(310, 261);
            this.dtpFechaestreno.Name = "dtpFechaestreno";
            this.dtpFechaestreno.Size = new System.Drawing.Size(232, 23);
            this.dtpFechaestreno.TabIndex = 11;
            // 
            // labelFechaEstreno
            // 
            this.labelFechaEstreno.AutoSize = true;
            this.labelFechaEstreno.ForeColor = System.Drawing.Color.LightGray;
            this.labelFechaEstreno.Location = new System.Drawing.Point(209, 267);
            this.labelFechaEstreno.Name = "labelFechaEstreno";
            this.labelFechaEstreno.Size = new System.Drawing.Size(96, 15);
            this.labelFechaEstreno.TabIndex = 12;
            this.labelFechaEstreno.Text = "Fecha de Estreno";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(163)))), ((int)(((byte)(27)))), ((int)(((byte)(39)))));
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(208, 450);
            this.panel1.TabIndex = 13;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Showcard Gothic", 27.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(191)))), ((int)(((byte)(55)))));
            this.label1.Location = new System.Drawing.Point(24, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(160, 46);
            this.label1.TabIndex = 0;
            this.label1.Text = "CINEMA";
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(15)))), ((int)(((byte)(15)))), ((int)(((byte)(15)))));
            this.panel3.Location = new System.Drawing.Point(8, 17);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(193, 77);
            this.panel3.TabIndex = 7;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label2.ForeColor = System.Drawing.Color.DarkGray;
            this.label2.Location = new System.Drawing.Point(13, 397);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(174, 15);
            this.label2.TabIndex = 5;
            this.label2.Text = "MessirveReport Alpha Version ";
            // 
            // btnAceptar
            // 
            this.btnAceptar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(163)))), ((int)(((byte)(27)))), ((int)(((byte)(39)))));
            this.btnAceptar.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(191)))), ((int)(((byte)(55)))));
            this.btnAceptar.FlatAppearance.BorderSize = 2;
            this.btnAceptar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Maroon;
            this.btnAceptar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Brown;
            this.btnAceptar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAceptar.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnAceptar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(191)))), ((int)(((byte)(55)))));
            this.btnAceptar.Location = new System.Drawing.Point(288, 325);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(75, 30);
            this.btnAceptar.TabIndex = 14;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = false;
            // 
            // btnCancelar
            // 
            this.btnCancelar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(163)))), ((int)(((byte)(27)))), ((int)(((byte)(39)))));
            this.btnCancelar.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(191)))), ((int)(((byte)(55)))));
            this.btnCancelar.FlatAppearance.BorderSize = 2;
            this.btnCancelar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Maroon;
            this.btnCancelar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Brown;
            this.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCancelar.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnCancelar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(191)))), ((int)(((byte)(55)))));
            this.btnCancelar.Location = new System.Drawing.Point(403, 325);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(75, 30);
            this.btnCancelar.TabIndex = 15;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = false;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // frmAgregarPelicula
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(15)))), ((int)(((byte)(15)))), ((int)(((byte)(15)))));
            this.ClientSize = new System.Drawing.Size(554, 450);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.labelFechaEstreno);
            this.Controls.Add(this.dtpFechaestreno);
            this.Controls.Add(this.labelClasificacion);
            this.Controls.Add(this.labelIdioma);
            this.Controls.Add(this.labelDirector);
            this.Controls.Add(this.labelNombre);
            this.Controls.Add(this.txNombre);
            this.Controls.Add(this.cboidioma);
            this.Controls.Add(this.cboClasificacion);
            this.Controls.Add(this.cboDirector);
            this.Name = "frmAgregarPelicula";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmAgregarPelicula";
            this.Load += new System.EventHandler(this.frmAgregarPelicula_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.ComboBox cboDirector;
        private System.Windows.Forms.ComboBox cboClasificacion;
        private System.Windows.Forms.ComboBox cboidioma;
        private System.Windows.Forms.TextBox txNombre;
        private System.Windows.Forms.Label labelNombre;
        private System.Windows.Forms.Label labelDirector;
        private System.Windows.Forms.Label labelIdioma;
        private System.Windows.Forms.Label labelClasificacion;
        private System.Windows.Forms.DateTimePicker dtpFechaestreno;
        private System.Windows.Forms.Label labelFechaEstreno;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnAceptar;
        private System.Windows.Forms.Button btnCancelar;
    }
}