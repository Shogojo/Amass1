namespace USB_Generic_HID_reference_application
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
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.usbToolStripStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.debugCollectionTimer = new System.Windows.Forms.Timer(this.components);
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.button8 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox5 = new System.Windows.Forms.PictureBox();
            this.pictureBox4 = new System.Windows.Forms.PictureBox();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.deviceStatusPollTimer = new System.Windows.Forms.Timer(this.components);
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.lbEa2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lbEa1 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.analogMeter2 = new Instruments.AnalogMeter();
            this.analogMeter1 = new Instruments.AnalogMeter();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.txRc0 = new System.Windows.Forms.TextBox();
            this.txRa4 = new System.Windows.Forms.TextBox();
            this.btResetRc0 = new System.Windows.Forms.Button();
            this.btStopRc0 = new System.Windows.Forms.Button();
            this.btStartRc0 = new System.Windows.Forms.Button();
            this.btResetRa4 = new System.Windows.Forms.Button();
            this.btStopRa4 = new System.Windows.Forms.Button();
            this.btStartRa4 = new System.Windows.Forms.Button();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.label11 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.txS1 = new System.Windows.Forms.TextBox();
            this.HsS1 = new System.Windows.Forms.HScrollBar();
            this.txS2 = new System.Windows.Forms.TextBox();
            this.HsS2 = new System.Windows.Forms.HScrollBar();
            this.statusStrip1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox5)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // statusStrip1
            // 
            this.statusStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.usbToolStripStatusLabel});
            this.statusStrip1.Location = new System.Drawing.Point(0, 923);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Padding = new System.Windows.Forms.Padding(2, 0, 21, 0);
            this.statusStrip1.Size = new System.Drawing.Size(1105, 32);
            this.statusStrip1.SizingGrip = false;
            this.statusStrip1.TabIndex = 12;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // usbToolStripStatusLabel
            // 
            this.usbToolStripStatusLabel.Name = "usbToolStripStatusLabel";
            this.usbToolStripStatusLabel.Size = new System.Drawing.Size(234, 25);
            this.usbToolStripStatusLabel.Text = "USB Device Status Unknown";
            // 
            // debugCollectionTimer
            // 
            this.debugCollectionTimer.Enabled = true;
            this.debugCollectionTimer.Interval = 50;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(862, 332);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(195, 26);
            this.textBox1.TabIndex = 16;
            this.textBox1.Text = "0";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.button8);
            this.groupBox1.Controls.Add(this.button7);
            this.groupBox1.Controls.Add(this.button6);
            this.groupBox1.Controls.Add(this.button5);
            this.groupBox1.Controls.Add(this.button4);
            this.groupBox1.Controls.Add(this.button3);
            this.groupBox1.Controls.Add(this.button2);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Location = new System.Drawing.Point(621, 16);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(459, 75);
            this.groupBox1.TabIndex = 18;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "8 sorties TOR Port B";
            // 
            // button8
            // 
            this.button8.Location = new System.Drawing.Point(403, 34);
            this.button8.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(46, 35);
            this.button8.TabIndex = 38;
            this.button8.Tag = "8";
            this.button8.Text = "8";
            this.button8.UseVisualStyleBackColor = true;
            // 
            // button7
            // 
            this.button7.Location = new System.Drawing.Point(349, 34);
            this.button7.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(46, 35);
            this.button7.TabIndex = 37;
            this.button7.Tag = "7";
            this.button7.Text = "7";
            this.button7.UseVisualStyleBackColor = true;
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(295, 34);
            this.button6.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(46, 35);
            this.button6.TabIndex = 36;
            this.button6.Tag = "6";
            this.button6.Text = "6";
            this.button6.UseVisualStyleBackColor = true;
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(241, 34);
            this.button5.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(46, 35);
            this.button5.TabIndex = 35;
            this.button5.Tag = "5";
            this.button5.Text = "5";
            this.button5.UseVisualStyleBackColor = true;
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(187, 35);
            this.button4.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(46, 35);
            this.button4.TabIndex = 34;
            this.button4.Tag = "4";
            this.button4.Text = "4";
            this.button4.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(133, 34);
            this.button3.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(46, 35);
            this.button3.TabIndex = 33;
            this.button3.Tag = "3";
            this.button3.Text = "3";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(79, 34);
            this.button2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(46, 35);
            this.button2.TabIndex = 32;
            this.button2.Tag = "2";
            this.button2.Text = "2";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(25, 34);
            this.button1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(44, 35);
            this.button1.TabIndex = 31;
            this.button1.Tag = "1";
            this.button1.Text = "1";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.pictureBox5);
            this.groupBox2.Controls.Add(this.pictureBox4);
            this.groupBox2.Controls.Add(this.pictureBox3);
            this.groupBox2.Controls.Add(this.pictureBox2);
            this.groupBox2.Controls.Add(this.pictureBox1);
            this.groupBox2.Location = new System.Drawing.Point(12, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(286, 146);
            this.groupBox2.TabIndex = 19;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "5 entrées TOR";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(255, 16);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(18, 20);
            this.label3.TabIndex = 7;
            this.label3.Text = "5";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(23, 16);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(18, 20);
            this.label2.TabIndex = 6;
            this.label2.Text = "1";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(11, 78);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(269, 20);
            this.label1.TabIndex = 5;
            this.label1.Text = "RA4        RA5      RC0      RC6     RC7";
            // 
            // pictureBox5
            // 
            this.pictureBox5.Location = new System.Drawing.Point(244, 39);
            this.pictureBox5.Name = "pictureBox5";
            this.pictureBox5.Size = new System.Drawing.Size(39, 32);
            this.pictureBox5.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox5.TabIndex = 4;
            this.pictureBox5.TabStop = false;
            this.pictureBox5.Tag = "5";
            // 
            // pictureBox4
            // 
            this.pictureBox4.Location = new System.Drawing.Point(189, 39);
            this.pictureBox4.Name = "pictureBox4";
            this.pictureBox4.Size = new System.Drawing.Size(39, 32);
            this.pictureBox4.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox4.TabIndex = 3;
            this.pictureBox4.TabStop = false;
            this.pictureBox4.Tag = "4";
            // 
            // pictureBox3
            // 
            this.pictureBox3.Location = new System.Drawing.Point(130, 39);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(39, 32);
            this.pictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox3.TabIndex = 2;
            this.pictureBox3.TabStop = false;
            this.pictureBox3.Tag = "3";
            // 
            // pictureBox2
            // 
            this.pictureBox2.Location = new System.Drawing.Point(75, 39);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(39, 32);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 1;
            this.pictureBox2.TabStop = false;
            this.pictureBox2.Tag = "2";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Location = new System.Drawing.Point(10, 39);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(44, 32);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Tag = "1";
            // 
            // deviceStatusPollTimer
            // 
            this.deviceStatusPollTimer.Tick += new System.EventHandler(this.deviceStatusPollTimer_Tick);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.lbEa2);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.lbEa1);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.analogMeter2);
            this.groupBox3.Controls.Add(this.analogMeter1);
            this.groupBox3.Location = new System.Drawing.Point(12, 164);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(801, 289);
            this.groupBox3.TabIndex = 26;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Entrées Analogiques";
            // 
            // lbEa2
            // 
            this.lbEa2.AutoSize = true;
            this.lbEa2.Location = new System.Drawing.Point(543, 31);
            this.lbEa2.Name = "lbEa2";
            this.lbEa2.Size = new System.Drawing.Size(18, 20);
            this.lbEa2.TabIndex = 26;
            this.lbEa2.Text = "0";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(407, 31);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(126, 20);
            this.label5.TabIndex = 25;
            this.label5.Text = "Potentiomètre 2:";
            // 
            // lbEa1
            // 
            this.lbEa1.AutoSize = true;
            this.lbEa1.Location = new System.Drawing.Point(142, 31);
            this.lbEa1.Name = "lbEa1";
            this.lbEa1.Size = new System.Drawing.Size(18, 20);
            this.lbEa1.TabIndex = 24;
            this.lbEa1.Text = "0";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 31);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(130, 20);
            this.label4.TabIndex = 23;
            this.label4.Text = "Potentiomètre 1 :";
            // 
            // analogMeter2
            // 
            this.analogMeter2.FrameColor = System.Drawing.Color.Black;
            this.analogMeter2.FramePadding = new System.Windows.Forms.Padding(5);
            this.analogMeter2.InternalPadding = new System.Windows.Forms.Padding(5);
            this.analogMeter2.Location = new System.Drawing.Point(411, 64);
            this.analogMeter2.MaxValue = 1024F;
            this.analogMeter2.MinValue = 0F;
            this.analogMeter2.Name = "analogMeter2";
            this.analogMeter2.Size = new System.Drawing.Size(366, 219);
            this.analogMeter2.TabIndex = 22;
            this.analogMeter2.Text = "RA1";
            this.analogMeter2.TickLargeFrequency = 100F;
            this.analogMeter2.TickSmallFrequency = 20F;
            this.analogMeter2.TickStartAngle = 20F;
            this.analogMeter2.Value = 0F;
            // 
            // analogMeter1
            // 
            this.analogMeter1.FrameColor = System.Drawing.Color.Black;
            this.analogMeter1.FramePadding = new System.Windows.Forms.Padding(5);
            this.analogMeter1.InternalPadding = new System.Windows.Forms.Padding(5);
            this.analogMeter1.Location = new System.Drawing.Point(0, 64);
            this.analogMeter1.MaxValue = 1024F;
            this.analogMeter1.MinValue = 0F;
            this.analogMeter1.Name = "analogMeter1";
            this.analogMeter1.Size = new System.Drawing.Size(366, 219);
            this.analogMeter1.TabIndex = 21;
            this.analogMeter1.Text = "RA0";
            this.analogMeter1.TickLargeFrequency = 100F;
            this.analogMeter1.TickSmallFrequency = 20F;
            this.analogMeter1.TickStartAngle = 20F;
            this.analogMeter1.Value = 0F;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.label7);
            this.groupBox4.Controls.Add(this.label6);
            this.groupBox4.Controls.Add(this.txRc0);
            this.groupBox4.Controls.Add(this.txRa4);
            this.groupBox4.Controls.Add(this.btResetRc0);
            this.groupBox4.Controls.Add(this.btStopRc0);
            this.groupBox4.Controls.Add(this.btStartRc0);
            this.groupBox4.Controls.Add(this.btResetRa4);
            this.groupBox4.Controls.Add(this.btStopRa4);
            this.groupBox4.Controls.Add(this.btStartRa4);
            this.groupBox4.Location = new System.Drawing.Point(302, 16);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(313, 152);
            this.groupBox4.TabIndex = 27;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Comptage rapide";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(188, 88);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(115, 20);
            this.label7.TabIndex = 9;
            this.label7.Text = "Compteur RC0";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(190, 22);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(115, 20);
            this.label6.TabIndex = 8;
            this.label6.Text = "Compteur RA4";
            // 
            // txRc0
            // 
            this.txRc0.Location = new System.Drawing.Point(189, 110);
            this.txRc0.Name = "txRc0";
            this.txRc0.Size = new System.Drawing.Size(120, 26);
            this.txRc0.TabIndex = 7;
            // 
            // txRa4
            // 
            this.txRa4.Location = new System.Drawing.Point(192, 44);
            this.txRa4.Name = "txRa4";
            this.txRa4.Size = new System.Drawing.Size(120, 26);
            this.txRa4.TabIndex = 6;
            // 
            // btResetRc0
            // 
            this.btResetRc0.Location = new System.Drawing.Point(118, 105);
            this.btResetRc0.Name = "btResetRc0";
            this.btResetRc0.Size = new System.Drawing.Size(68, 37);
            this.btResetRc0.TabIndex = 5;
            this.btResetRc0.Text = "Reset";
            this.btResetRc0.UseVisualStyleBackColor = true;
            this.btResetRc0.Click += new System.EventHandler(this.btResetRc0_Click);
            // 
            // btStopRc0
            // 
            this.btStopRc0.Location = new System.Drawing.Point(59, 105);
            this.btStopRc0.Name = "btStopRc0";
            this.btStopRc0.Size = new System.Drawing.Size(60, 37);
            this.btStopRc0.TabIndex = 4;
            this.btStopRc0.Text = "Stop";
            this.btStopRc0.UseVisualStyleBackColor = true;
            this.btStopRc0.Click += new System.EventHandler(this.btStopRc0_Click);
            // 
            // btStartRc0
            // 
            this.btStartRc0.Location = new System.Drawing.Point(4, 105);
            this.btStartRc0.Name = "btStartRc0";
            this.btStartRc0.Size = new System.Drawing.Size(58, 37);
            this.btStartRc0.TabIndex = 3;
            this.btStartRc0.Text = "Start";
            this.btStartRc0.UseVisualStyleBackColor = true;
            this.btStartRc0.Click += new System.EventHandler(this.btStartRc0_Click);
            // 
            // btResetRa4
            // 
            this.btResetRa4.Location = new System.Drawing.Point(119, 38);
            this.btResetRa4.Name = "btResetRa4";
            this.btResetRa4.Size = new System.Drawing.Size(70, 37);
            this.btResetRa4.TabIndex = 2;
            this.btResetRa4.Text = "Reset";
            this.btResetRa4.UseVisualStyleBackColor = true;
            this.btResetRa4.Click += new System.EventHandler(this.btResetRa4_Click);
            // 
            // btStopRa4
            // 
            this.btStopRa4.Location = new System.Drawing.Point(60, 38);
            this.btStopRa4.Name = "btStopRa4";
            this.btStopRa4.Size = new System.Drawing.Size(62, 37);
            this.btStopRa4.TabIndex = 1;
            this.btStopRa4.Text = "Stop";
            this.btStopRa4.UseVisualStyleBackColor = true;
            this.btStopRa4.Click += new System.EventHandler(this.btStopRa4_Click);
            // 
            // btStartRa4
            // 
            this.btStartRa4.Location = new System.Drawing.Point(2, 38);
            this.btStartRa4.Name = "btStartRa4";
            this.btStartRa4.Size = new System.Drawing.Size(60, 37);
            this.btStartRa4.TabIndex = 0;
            this.btStartRa4.Text = "Start";
            this.btStartRa4.UseVisualStyleBackColor = true;
            this.btStartRa4.Click += new System.EventHandler(this.btStartRa4_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.label11);
            this.groupBox5.Controls.Add(this.label10);
            this.groupBox5.Controls.Add(this.label9);
            this.groupBox5.Controls.Add(this.label8);
            this.groupBox5.Controls.Add(this.txS1);
            this.groupBox5.Controls.Add(this.HsS1);
            this.groupBox5.Controls.Add(this.txS2);
            this.groupBox5.Controls.Add(this.HsS2);
            this.groupBox5.Location = new System.Drawing.Point(625, 94);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(455, 73);
            this.groupBox5.TabIndex = 28;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Soties analogiques 0-100%";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(233, 49);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(29, 20);
            this.label11.TabIndex = 7;
            this.label11.Text = "S1";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(6, 51);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(29, 20);
            this.label10.TabIndex = 6;
            this.label10.Text = "S2";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(225, 20);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(41, 20);
            this.label9.TabIndex = 5;
            this.label9.Text = "RC2";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(-4, 24);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(41, 20);
            this.label8.TabIndex = 4;
            this.label8.Text = "RC1";
            // 
            // txS1
            // 
            this.txS1.Location = new System.Drawing.Point(272, 16);
            this.txS1.Name = "txS1";
            this.txS1.Size = new System.Drawing.Size(173, 26);
            this.txS1.TabIndex = 3;
            this.txS1.Text = "0";
            // 
            // HsS1
            // 
            this.HsS1.Location = new System.Drawing.Point(263, 46);
            this.HsS1.Maximum = 109;
            this.HsS1.Name = "HsS1";
            this.HsS1.Size = new System.Drawing.Size(182, 20);
            this.HsS1.TabIndex = 2;
            this.HsS1.Scroll += new System.Windows.Forms.ScrollEventHandler(this.HsS1_Scroll);
            // 
            // txS2
            // 
            this.txS2.Location = new System.Drawing.Point(43, 22);
            this.txS2.Name = "txS2";
            this.txS2.Size = new System.Drawing.Size(173, 26);
            this.txS2.TabIndex = 1;
            this.txS2.Text = "0";
            // 
            // HsS2
            // 
            this.HsS2.Location = new System.Drawing.Point(43, 47);
            this.HsS2.Maximum = 109;
            this.HsS2.Name = "HsS2";
            this.HsS2.Size = new System.Drawing.Size(186, 20);
            this.HsS2.TabIndex = 0;
            this.HsS2.Scroll += new System.Windows.Forms.ScrollEventHandler(this.HsS2_Scroll);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1105, 955);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.statusStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "USB Generic HID reference application";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox5)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

            }

        #endregion
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel usbToolStripStatusLabel;
        private System.Windows.Forms.Timer debugCollectionTimer;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button button8;
        private System.Windows.Forms.Button button7;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox5;
        private System.Windows.Forms.PictureBox pictureBox4;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.Timer deviceStatusPollTimer;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label lbEa2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label lbEa1;
        private System.Windows.Forms.Label label4;
        private Instruments.AnalogMeter analogMeter2;
        private Instruments.AnalogMeter analogMeter1;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txRc0;
        private System.Windows.Forms.TextBox txRa4;
        private System.Windows.Forms.Button btResetRc0;
        private System.Windows.Forms.Button btStopRc0;
        private System.Windows.Forms.Button btStartRc0;
        private System.Windows.Forms.Button btResetRa4;
        private System.Windows.Forms.Button btStopRa4;
        private System.Windows.Forms.Button btStartRa4;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txS1;
        private System.Windows.Forms.HScrollBar HsS1;
        private System.Windows.Forms.TextBox txS2;
        private System.Windows.Forms.HScrollBar HsS2;
    }
    }

