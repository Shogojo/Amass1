//-----------------------------------------------------------------------------
//
//  Form1.cs
//
//  USB Generic HID Communications 3_0_0_0
//
//  A reference test application for the usbGenericHidCommunications library
//  Copyright (C) 2011 Simon Inns
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//  Web:    http://www.waitingforfriday.com
//  Email:  simon.inns@gmail.com
//
//-----------------------------------------------------------------------------

//
//  Current reference class library version:
//  usbGenericHidCommunications class library version 2.0.0.0
//

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace USB_Generic_HID_reference_application
    {
    public partial class Form1 : Form
        {
        /// <summary>
        /// This is a reference application for testing the functionality of the 
        /// usbGenericHidCommunications class library.  It runs a series of 
        /// communication tests against a known USB reference device to determine
        /// if the class library is functioning correctly.
        /// 
        /// You can also use this application as a guide to integrating the 
        /// usbGenericHidCommunications class library into your projects.
        /// 
        /// See http://www,waitingforfriday.com for more detailed documentation.
        /// </summary>
        private static bool usbOpen=false;
        public Form1()
            {
            InitializeComponent();

            // Create the USB reference device object (passing VID and PID)
            theReferenceUsbDevice = new usbReferenceDevice(0x2DBC, 0x0001);

            // Add a listener for usb events
            theReferenceUsbDevice.usbEvent += new usbReferenceDevice.usbEventsHandler(usbEvent_receiver);
          //  textBox1.Text = theReferenceUsbDevice.ProductVersion;
            // Perform an initial search for the target device
           // theReferenceUsbDevice.
            theReferenceUsbDevice.findTargetDevice();
            }

        // Create an instance of the USB reference device
        private usbReferenceDevice theReferenceUsbDevice;

        // Listener for USB events
        private void usbEvent_receiver(object o, EventArgs e)
        {
            // Check the status of the USB device and update the form accordingly
            if (textBox1.Text == "") textBox1.Text = "0";
            textBox1.Text = Convert.ToString(int.Parse(textBox1.Text) + 1);
            if (theReferenceUsbDevice.isDeviceAttached)
            {
                deviceStatusPollTimer.Enabled = true;
            }
            else
            {
                // Device is currently unattached
                deviceStatusPollTimer.Enabled = false;
                // Update the status label
                this.usbToolStripStatusLabel.Text = "USB Device is detached";


                foreach (Control bt in this.groupBox1.Controls)
                {
                    bt.Enabled = false;
                }
            }
  

        }
        

       
        

       

     

        private void Form1_Load(object sender, EventArgs e)
        {
            foreach( Control c in this.groupBox1.Controls)
            {
                c.Click += new EventHandler(Shiva);
            }
        }
        private void Shiva(object sender, EventArgs e)
        {
            Control c = (Control)sender;
            textBox1.Text = c.Text;
            int etat;
            if (c.BackColor == Color.Red)
            {
                etat = 0;
                c.BackColor = Color.Silver;
            }
            else
            {
                etat = 1;
                c.BackColor = Color.Red;
            }
            theReferenceUsbDevice.Test1(etat, (byte)int.Parse(c.Text));

        }

        private void deviceStatusPollTimer_Tick(object sender, EventArgs e)
        {
            foreach (Control bt in this.groupBox1.Controls)// mise à jour sorties
            {
                bt.Enabled = true;
            }
            // Device is currently attached

            // Update the status label
            this.usbToolStripStatusLabel.Text = "USB Device is attached";
            byte[] Inputs = theReferenceUsbDevice.Reading();
            // Update buttons
            byte port = Inputs[2];
            foreach (Control bt in this.groupBox1.Controls)
            {
                if ((port & (1 << (int.Parse(bt.Text) - 1))) > 0)
                {
                    bt.BackColor = Color.Red;
                }
                else
                {
                    bt.BackColor = Color.Silver;
                }
            }
            byte input = Inputs[3];// mise à jour entrées
            foreach (Control im in this.groupBox2.Controls)
            {
                if (im is PictureBox)
                {
                    //PictureBox pic = (PictureBox)im;
                    string s = im.Name;

                    byte val = byte.Parse(s.Substring(s.Length - 1));
                    if ((input & (1 << (((val - 1))))) > 0)
                    {
                        //pic.Image = Properties.Resources.led_green;
                        //pic.Refresh();
                        im.BackColor = System.Drawing.Color.LimeGreen;
                    }
                    else
                    {
                        //pic.Image = Properties.Resources.led_grey;
                        //pic.Refresh();
                        im.BackColor = System.Drawing.Color.Gray;
                    }
                }
            }// mise à jour entrées analogiques
            analogMeter1.Value = (Inputs[4] + 256 * Inputs[5]);
            analogMeter2.Value = (Inputs[6] + 256 * Inputs[7]);
            lbEa1.Text = Convert.ToString(analogMeter1.Value);
            lbEa2.Text = Convert.ToString(analogMeter2.Value);
            // Mise à jour compteurs
            txRa4.Text = Convert.ToString((Inputs[8] + 256 * Inputs[9]));
            txRc0.Text = Convert.ToString((Inputs[10] + 256 * Inputs[11]));

        }

        private void btResetRa4_Click(object sender, EventArgs e)
        {
            byte etat = 2;
            theReferenceUsbDevice.CompteurControl(etat);
        }

        private void btResetRc0_Click(object sender, EventArgs e)
        {
            byte etat = 3;
            theReferenceUsbDevice.CompteurControl(etat);
        }

        private void btStartRa4_Click(object sender, EventArgs e)
        {
            byte etat = 4;
            theReferenceUsbDevice.CompteurControl(etat);
        }

        private void btStartRc0_Click(object sender, EventArgs e)
        {
            byte etat = 5;
            theReferenceUsbDevice.CompteurControl(etat);
        }

        private void btStopRa4_Click(object sender, EventArgs e)
        {
            byte etat = 6;
            theReferenceUsbDevice.CompteurControl(etat);
        }

        private void btStopRc0_Click(object sender, EventArgs e)
        {
            byte etat = 7;
            theReferenceUsbDevice.CompteurControl(etat);
        }

        private void HsS1_Scroll(object sender, ScrollEventArgs e)
        {
            byte etat = 8;
            byte valeur = (byte)HsS1.Value;
            txS1.Text = Convert.ToString(valeur);
            theReferenceUsbDevice.PwmControl(etat, valeur);
        }

        private void HsS2_Scroll(object sender, ScrollEventArgs e)
        {
            byte etat = 9;
            byte valeur = (byte)HsS2.Value;
            txS2.Text = Convert.ToString(valeur);
            theReferenceUsbDevice.PwmControl(etat, valeur);
        }

        
    }
}
    
