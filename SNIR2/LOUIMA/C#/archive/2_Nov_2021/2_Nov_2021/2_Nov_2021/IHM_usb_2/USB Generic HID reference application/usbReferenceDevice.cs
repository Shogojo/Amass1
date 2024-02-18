//-----------------------------------------------------------------------------
//
//  usbReferenceDevice.cs
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

// The following namespace allows debugging output (when compiled in debug mode)
using System.Diagnostics;

namespace USB_Generic_HID_reference_application
    {
    using usbGenericHidCommunications;

    /// <summary>
    /// This class performs several different tests against the 
    /// reference hardware/firmware to confirm that the USB
    /// communication library is functioning correctly.
    /// 
    /// It also serves as a demonstration of how to use the class
    /// library to perform different types of read and write
    /// operations.
    /// </summary>
    class usbReferenceDevice : usbGenericHidCommunication
        {
        /// <summary>
        /// Class constructor - place any initialisation here
        /// </summary>
        /// <param name="vid"></param>
        /// <param name="pid"></param>
        public usbReferenceDevice(int vid, int pid) : base(vid, pid)
            {
            }

        public void Test1(int etat, byte port)
        {
            // Test 1 - Send a single write packet to the USB device

            // Declare our output buffer
            Byte[] outputBuffer = new Byte[65];
            Byte[] inputBuffer = new Byte[65];
            bool success;
            // Byte 0 must be set to 0
            outputBuffer[0] = 0;
            outputBuffer[1] = 1;
            success = readSingleReportFromDevice(ref inputBuffer);
            // Byte 1 must be set to our command
            outputBuffer[2] = inputBuffer[2];
            if (etat == 1)
            {
                
                outputBuffer[2] |=(byte) Math.Pow(2,port-1);
            }
            else
            {
                outputBuffer[2] &= (byte)(0xFF - Math.Pow(2, port - 1));
            }

            // Fill the rest of the buffer with known data
            //int bufferPointer;
            //Byte data = 0;
            //for (bufferPointer = 2; bufferPointer < 64; bufferPointer++)
            //{
            //    // We send the numbers 0 to 63 to the device
            //    outputBuffer[bufferPointer] = data;
            //    data++;
            //}
            
            success = writeRawReportToDevice(outputBuffer);
        }
        public void CompteurControl(byte etat)
        {
            // Test 1 - Send a single write packet to the USB device

            // Declare our output buffer
            Byte[] outputBuffer = new Byte[65];
            Byte[] inputBuffer = new Byte[65];
            bool success;
            // Byte 0 must be set to 0
            outputBuffer[0] = 0;
            outputBuffer[1] = etat;
        
            success = writeRawReportToDevice(outputBuffer);
        }
        public void PwmControl(byte etat, byte valeur)
        {
            // Test 1 - Send a single write packet to the USB device

            // Declare our output buffer
            Byte[] outputBuffer = new Byte[65];
            Byte[] inputBuffer = new Byte[65];
            bool success;
            // Byte 0 must be set to 0
            outputBuffer[0] = 0;
            outputBuffer[1] = etat;
            outputBuffer[3] = valeur;

            success = writeRawReportToDevice(outputBuffer);
        }
        public Byte[] Reading()
            {
                Byte[] inputBuffer = new Byte[65];
                bool success = readSingleReportFromDevice(ref inputBuffer);
                return inputBuffer;
            }
           
        // Collect debug information from the device
        public String collectDebug()
            {
            // Collect debug information from USB device
            Debug.WriteLine("Reference Application -> Collecting debug information from device");

            // Declare our output buffer
            Byte[] outputBuffer = new Byte[64];

            // Declare our input buffer
            Byte[] inputBuffer = new Byte[64];

            // Byte 0 must be set to 0
            outputBuffer[0] = 0;

            // Byte 1 must be set to our command
            outputBuffer[1] = 0x10;

            // Send the collect debug command
            writeRawReportToDevice(outputBuffer);

            // Read the response from the device
            readSingleReportFromDevice(ref inputBuffer);

            // Byte 1 contains the number of characters transfered
            if (inputBuffer[1] == 0) return String.Empty;

            // Convert the Byte array into a string of the correct length
            string s = System.Text.ASCIIEncoding.ASCII.GetString(inputBuffer, 2, inputBuffer[1]);

            return s;
            }
        }
    }
