namespace Terminal_GST._050.G7
{
    partial class Form1
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.label1 = new System.Windows.Forms.Label();
            this.txtListCom = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtListBaurate = new System.Windows.Forms.ComboBox();
            this.txtlinkpath = new System.Windows.Forms.TextBox();
            this.txtDisplay = new System.Windows.Forms.TextBox();
            this.Btn_Connect = new System.Windows.Forms.Button();
            this.Btn_Exit = new System.Windows.Forms.Button();
            this.txtStatus = new System.Windows.Forms.Label();
            this.Btn_Load = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.Btn_Browser = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btn_closed = new System.Windows.Forms.Button();
            this.btn_about = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(0, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 23);
            this.label1.TabIndex = 15;
            // 
            // txtListCom
            // 
            this.txtListCom.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtListCom.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.txtListCom.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.txtListCom.ForeColor = System.Drawing.SystemColors.WindowText;
            this.txtListCom.FormattingEnabled = true;
            this.txtListCom.Location = new System.Drawing.Point(13, 38);
            this.txtListCom.Name = "txtListCom";
            this.txtListCom.Size = new System.Drawing.Size(79, 21);
            this.txtListCom.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 62);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Baurate";
            // 
            // txtListBaurate
            // 
            this.txtListBaurate.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtListBaurate.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.txtListBaurate.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.txtListBaurate.FormattingEnabled = true;
            this.txtListBaurate.Items.AddRange(new object[] {
            "9600",
            "115200"});
            this.txtListBaurate.Location = new System.Drawing.Point(13, 78);
            this.txtListBaurate.Name = "txtListBaurate";
            this.txtListBaurate.Size = new System.Drawing.Size(79, 21);
            this.txtListBaurate.TabIndex = 3;
            // 
            // txtlinkpath
            // 
            this.txtlinkpath.BackColor = System.Drawing.Color.LightGoldenrodYellow;
            this.txtlinkpath.Location = new System.Drawing.Point(9, 18);
            this.txtlinkpath.Name = "txtlinkpath";
            this.txtlinkpath.Size = new System.Drawing.Size(309, 20);
            this.txtlinkpath.TabIndex = 5;
            // 
            // txtDisplay
            // 
            this.txtDisplay.BackColor = System.Drawing.Color.SeaShell;
            this.txtDisplay.Location = new System.Drawing.Point(6, 19);
            this.txtDisplay.Multiline = true;
            this.txtDisplay.Name = "txtDisplay";
            this.txtDisplay.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtDisplay.Size = new System.Drawing.Size(403, 192);
            this.txtDisplay.TabIndex = 7;
            // 
            // Btn_Connect
            // 
            this.Btn_Connect.Location = new System.Drawing.Point(13, 105);
            this.Btn_Connect.Name = "Btn_Connect";
            this.Btn_Connect.Size = new System.Drawing.Size(79, 31);
            this.Btn_Connect.TabIndex = 8;
            this.Btn_Connect.Text = "Connect";
            this.Btn_Connect.UseVisualStyleBackColor = true;
            this.Btn_Connect.Click += new System.EventHandler(this.Btn_Connect_Click);
            // 
            // Btn_Exit
            // 
            this.Btn_Exit.BackColor = System.Drawing.SystemColors.ControlLight;
            this.Btn_Exit.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.Btn_Exit.Location = new System.Drawing.Point(13, 216);
            this.Btn_Exit.Name = "Btn_Exit";
            this.Btn_Exit.Size = new System.Drawing.Size(79, 31);
            this.Btn_Exit.TabIndex = 10;
            this.Btn_Exit.Text = "Quit";
            this.Btn_Exit.UseVisualStyleBackColor = false;
            this.Btn_Exit.Click += new System.EventHandler(this.Btn_Exit_Click);
            // 
            // txtStatus
            // 
            this.txtStatus.AutoSize = true;
            this.txtStatus.ForeColor = System.Drawing.Color.Lime;
            this.txtStatus.Location = new System.Drawing.Point(9, 63);
            this.txtStatus.Name = "txtStatus";
            this.txtStatus.Size = new System.Drawing.Size(37, 13);
            this.txtStatus.TabIndex = 11;
            this.txtStatus.Text = "Status";
            // 
            // Btn_Load
            // 
            this.Btn_Load.ForeColor = System.Drawing.SystemColors.ControlText;
            this.Btn_Load.Location = new System.Drawing.Point(324, 45);
            this.Btn_Load.Name = "Btn_Load";
            this.Btn_Load.Size = new System.Drawing.Size(79, 31);
            this.Btn_Load.TabIndex = 12;
            this.Btn_Load.Text = "Send";
            this.Btn_Load.UseVisualStyleBackColor = true;
            this.Btn_Load.Click += new System.EventHandler(this.Btn_Load_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(10, 22);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(31, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "COM";
            // 
            // Btn_Browser
            // 
            this.Btn_Browser.ForeColor = System.Drawing.SystemColors.ControlText;
            this.Btn_Browser.Location = new System.Drawing.Point(324, 19);
            this.Btn_Browser.Name = "Btn_Browser";
            this.Btn_Browser.Size = new System.Drawing.Size(79, 20);
            this.Btn_Browser.TabIndex = 16;
            this.Btn_Browser.Text = "Browser";
            this.Btn_Browser.UseVisualStyleBackColor = true;
            this.Btn_Browser.Click += new System.EventHandler(this.Btn_Browser_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.txtDisplay);
            this.groupBox1.Location = new System.Drawing.Point(3, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(415, 217);
            this.groupBox1.TabIndex = 17;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Sent/Received Data";
            // 
            // groupBox2
            // 
            this.groupBox2.BackColor = System.Drawing.Color.Transparent;
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.btn_closed);
            this.groupBox2.Controls.Add(this.btn_about);
            this.groupBox2.Controls.Add(this.Btn_Connect);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.Btn_Exit);
            this.groupBox2.Controls.Add(this.txtListCom);
            this.groupBox2.Controls.Add(this.txtListBaurate);
            this.groupBox2.Location = new System.Drawing.Point(424, 0);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(106, 311);
            this.groupBox2.TabIndex = 18;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Setting";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.ForeColor = System.Drawing.Color.Maroon;
            this.label5.Location = new System.Drawing.Point(3, 287);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(101, 13);
            this.label5.TabIndex = 17;
            this.label5.Text = "GST050.UIT.KTMT";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label3.Cursor = System.Windows.Forms.Cursors.Hand;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.OrangeRed;
            this.label3.Location = new System.Drawing.Point(7, 256);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(87, 26);
            this.label3.TabIndex = 21;
            this.label3.Text = "Group 7";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // btn_closed
            // 
            this.btn_closed.Location = new System.Drawing.Point(13, 142);
            this.btn_closed.Name = "btn_closed";
            this.btn_closed.Size = new System.Drawing.Size(79, 31);
            this.btn_closed.TabIndex = 15;
            this.btn_closed.Text = "Close";
            this.btn_closed.UseVisualStyleBackColor = true;
            this.btn_closed.Click += new System.EventHandler(this.btn_closed_Click);
            // 
            // btn_about
            // 
            this.btn_about.Location = new System.Drawing.Point(13, 179);
            this.btn_about.Name = "btn_about";
            this.btn_about.Size = new System.Drawing.Size(79, 31);
            this.btn_about.TabIndex = 13;
            this.btn_about.Text = "About";
            this.btn_about.UseVisualStyleBackColor = true;
            this.btn_about.Click += new System.EventHandler(this.btn_about_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.BackColor = System.Drawing.Color.Transparent;
            this.groupBox4.Controls.Add(this.txtlinkpath);
            this.groupBox4.Controls.Add(this.Btn_Browser);
            this.groupBox4.Controls.Add(this.Btn_Load);
            this.groupBox4.Controls.Add(this.txtStatus);
            this.groupBox4.ForeColor = System.Drawing.SystemColors.Window;
            this.groupBox4.Location = new System.Drawing.Point(3, 229);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(409, 82);
            this.groupBox4.TabIndex = 20;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Sent File (size< 24KB)";
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Goldenrod;
            this.BackgroundImage = global::Terminal.G7.Properties.Resources.background;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ClientSize = new System.Drawing.Size(536, 315);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.Text = "Terminal Bootloader KL46Z";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox txtListCom;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox txtListBaurate;
        private System.Windows.Forms.TextBox txtlinkpath;
        private System.Windows.Forms.TextBox txtDisplay;
        private System.Windows.Forms.Button Btn_Connect;
        private System.Windows.Forms.Button Btn_Exit;
        private System.Windows.Forms.Label txtStatus;
        private System.Windows.Forms.Button Btn_Load;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button Btn_Browser;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btn_about;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Button btn_closed;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
    }
}

