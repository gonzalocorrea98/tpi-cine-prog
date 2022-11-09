namespace Reportes
{
    partial class frmReporte
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.directoryEntry1 = new System.DirectoryServices.DirectoryEntry();
            this.panel1 = new System.Windows.Forms.Panel();
            this.cINE_CORDOBA_PROGDataSet = new Reportes.CINE_CORDOBA_PROGDataSet();
            this.eNTRADASBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.eNTRADASTableAdapter = new Reportes.CINE_CORDOBA_PROGDataSetTableAdapters.ENTRADASTableAdapter();
            this.rptEntradas = new Microsoft.Reporting.WinForms.ReportViewer();
            this.eNTRADASBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.dtp1 = new System.Windows.Forms.DateTimePicker();
            this.dtp2 = new System.Windows.Forms.DateTimePicker();
            this.btnFiltrar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.cINE_CORDOBA_PROGDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.eNTRADASBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.eNTRADASBindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(163)))), ((int)(((byte)(27)))), ((int)(((byte)(39)))));
            this.panel1.Location = new System.Drawing.Point(-3, -1);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(178, 450);
            this.panel1.TabIndex = 1;
            // 
            // cINE_CORDOBA_PROGDataSet
            // 
            this.cINE_CORDOBA_PROGDataSet.DataSetName = "CINE_CORDOBA_PROGDataSet";
            this.cINE_CORDOBA_PROGDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // eNTRADASBindingSource
            // 
            this.eNTRADASBindingSource.DataMember = "ENTRADAS";
            this.eNTRADASBindingSource.DataSource = this.cINE_CORDOBA_PROGDataSet;
            // 
            // eNTRADASTableAdapter
            // 
            this.eNTRADASTableAdapter.ClearBeforeFill = true;
            // 
            // rptEntradas
            // 
            this.rptEntradas.DocumentMapWidth = 26;
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.eNTRADASBindingSource1;
            this.rptEntradas.LocalReport.DataSources.Add(reportDataSource1);
            this.rptEntradas.LocalReport.ReportEmbeddedResource = "Reportes.rptEntradas.rdlc";
            this.rptEntradas.Location = new System.Drawing.Point(220, 66);
            this.rptEntradas.Name = "rptEntradas";
            this.rptEntradas.ServerReport.BearerToken = null;
            this.rptEntradas.Size = new System.Drawing.Size(515, 372);
            this.rptEntradas.TabIndex = 4;
            this.rptEntradas.Visible = false;
            // 
            // eNTRADASBindingSource1
            // 
            this.eNTRADASBindingSource1.DataMember = "ENTRADAS";
            this.eNTRADASBindingSource1.DataSource = this.cINE_CORDOBA_PROGDataSet;
            // 
            // dtp1
            // 
            this.dtp1.Location = new System.Drawing.Point(220, 22);
            this.dtp1.Name = "dtp1";
            this.dtp1.Size = new System.Drawing.Size(200, 20);
            this.dtp1.TabIndex = 5;
            // 
            // dtp2
            // 
            this.dtp2.Location = new System.Drawing.Point(467, 22);
            this.dtp2.Name = "dtp2";
            this.dtp2.Size = new System.Drawing.Size(200, 20);
            this.dtp2.TabIndex = 6;
            // 
            // btnFiltrar
            // 
            this.btnFiltrar.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.btnFiltrar.Location = new System.Drawing.Point(689, 22);
            this.btnFiltrar.Name = "btnFiltrar";
            this.btnFiltrar.Size = new System.Drawing.Size(75, 23);
            this.btnFiltrar.TabIndex = 7;
            this.btnFiltrar.Text = "Filtrar";
            this.btnFiltrar.UseVisualStyleBackColor = true;
            this.btnFiltrar.Click += new System.EventHandler(this.btnFiltrar_Click);
            // 
            // frmReporte
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(15)))), ((int)(((byte)(15)))), ((int)(((byte)(15)))));
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnFiltrar);
            this.Controls.Add(this.dtp2);
            this.Controls.Add(this.dtp1);
            this.Controls.Add(this.rptEntradas);
            this.Controls.Add(this.panel1);
            this.ForeColor = System.Drawing.SystemColors.ControlLight;
            this.Name = "frmReporte";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.cINE_CORDOBA_PROGDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.eNTRADASBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.eNTRADASBindingSource1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.DirectoryServices.DirectoryEntry directoryEntry1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.BindingSource eNTRADASBindingSource;
        private CINE_CORDOBA_PROGDataSet cINE_CORDOBA_PROGDataSet;
        private CINE_CORDOBA_PROGDataSetTableAdapters.ENTRADASTableAdapter eNTRADASTableAdapter;
        private Microsoft.Reporting.WinForms.ReportViewer rptEntradas;
        private System.Windows.Forms.BindingSource eNTRADASBindingSource1;
        private System.Windows.Forms.DateTimePicker dtp1;
        private System.Windows.Forms.DateTimePicker dtp2;
        private System.Windows.Forms.Button btnFiltrar;
    }
}

