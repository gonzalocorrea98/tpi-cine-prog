namespace CineFront
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
            this.btnAgregar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
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
            this.SuspendLayout();
            // 
            // btnAgregar
            // 
            this.btnAgregar.Location = new System.Drawing.Point(51, 363);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(120, 36);
            this.btnAgregar.TabIndex = 0;
            this.btnAgregar.Text = "button1";
            this.btnAgregar.UseVisualStyleBackColor = true;
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(221, 363);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(120, 36);
            this.btnCancelar.TabIndex = 1;
            this.btnCancelar.Text = "button2";
            this.btnCancelar.UseVisualStyleBackColor = true;
            // 
            // btnSalir
            // 
            this.btnSalir.Location = new System.Drawing.Point(383, 363);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(120, 36);
            this.btnSalir.TabIndex = 2;
            this.btnSalir.Text = "button3";
            this.btnSalir.UseVisualStyleBackColor = true;
            // 
            // cboDirector
            // 
            this.cboDirector.FormattingEnabled = true;
            this.cboDirector.Location = new System.Drawing.Point(140, 110);
            this.cboDirector.Name = "cboDirector";
            this.cboDirector.Size = new System.Drawing.Size(232, 23);
            this.cboDirector.TabIndex = 3;
            // 
            // cboClasificacion
            // 
            this.cboClasificacion.FormattingEnabled = true;
            this.cboClasificacion.Location = new System.Drawing.Point(140, 191);
            this.cboClasificacion.Name = "cboClasificacion";
            this.cboClasificacion.Size = new System.Drawing.Size(188, 23);
            this.cboClasificacion.TabIndex = 4;
            // 
            // cboidioma
            // 
            this.cboidioma.FormattingEnabled = true;
            this.cboidioma.Location = new System.Drawing.Point(140, 151);
            this.cboidioma.Name = "cboidioma";
            this.cboidioma.Size = new System.Drawing.Size(188, 23);
            this.cboidioma.TabIndex = 5;
            // 
            // txNombre
            // 
            this.txNombre.Location = new System.Drawing.Point(140, 70);
            this.txNombre.Name = "txNombre";
            this.txNombre.Size = new System.Drawing.Size(232, 23);
            this.txNombre.TabIndex = 6;
            // 
            // labelNombre
            // 
            this.labelNombre.AutoSize = true;
            this.labelNombre.Location = new System.Drawing.Point(39, 73);
            this.labelNombre.Name = "labelNombre";
            this.labelNombre.Size = new System.Drawing.Size(95, 15);
            this.labelNombre.TabIndex = 7;
            this.labelNombre.Text = "Nombre Pelicula";
            this.labelNombre.Click += new System.EventHandler(this.labelNombre_Click);
            // 
            // labelDirector
            // 
            this.labelDirector.AutoSize = true;
            this.labelDirector.Location = new System.Drawing.Point(39, 113);
            this.labelDirector.Name = "labelDirector";
            this.labelDirector.Size = new System.Drawing.Size(49, 15);
            this.labelDirector.TabIndex = 8;
            this.labelDirector.Text = "Director";
            // 
            // labelIdioma
            // 
            this.labelIdioma.AutoSize = true;
            this.labelIdioma.Location = new System.Drawing.Point(39, 154);
            this.labelIdioma.Name = "labelIdioma";
            this.labelIdioma.Size = new System.Drawing.Size(44, 15);
            this.labelIdioma.TabIndex = 9;
            this.labelIdioma.Text = "Idioma";
            // 
            // labelClasificacion
            // 
            this.labelClasificacion.AutoSize = true;
            this.labelClasificacion.Location = new System.Drawing.Point(39, 194);
            this.labelClasificacion.Name = "labelClasificacion";
            this.labelClasificacion.Size = new System.Drawing.Size(74, 15);
            this.labelClasificacion.TabIndex = 10;
            this.labelClasificacion.Text = "Clasificacion";
            // 
            // dtpFechaestreno
            // 
            this.dtpFechaestreno.Location = new System.Drawing.Point(140, 238);
            this.dtpFechaestreno.Name = "dtpFechaestreno";
            this.dtpFechaestreno.Size = new System.Drawing.Size(232, 23);
            this.dtpFechaestreno.TabIndex = 11;
            // 
            // labelFechaEstreno
            // 
            this.labelFechaEstreno.AutoSize = true;
            this.labelFechaEstreno.Location = new System.Drawing.Point(39, 244);
            this.labelFechaEstreno.Name = "labelFechaEstreno";
            this.labelFechaEstreno.Size = new System.Drawing.Size(96, 15);
            this.labelFechaEstreno.TabIndex = 12;
            this.labelFechaEstreno.Text = "Fecha de Estreno";
            // 
            // frmAgregarPelicula
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(554, 450);
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
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnAgregar);
            this.Name = "frmAgregarPelicula";
            this.Text = "frmAgregarPelicula";
            this.Load += new System.EventHandler(this.frmAgregarPelicula_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnSalir;
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
    }
}