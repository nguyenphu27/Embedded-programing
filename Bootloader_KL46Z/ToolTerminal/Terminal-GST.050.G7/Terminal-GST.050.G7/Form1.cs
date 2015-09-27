using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Threading;
namespace Terminal_GST._050.G7
{
    public partial class Form1 : Form
    {

        Int32 local = 0;
        List<String> list = new List<String>();
        String line;
        Int32 totalline = 0;
        Int32 countwrong = 0;
        String indata;
        Int32 systemTick = 0;

        public Form1()
        {
            InitializeComponent();
            btn_closed.Enabled = false;          
            //Scan serial port com
            foreach (String s in System.IO.Ports.SerialPort.GetPortNames())
            {
                txtListCom.Items.Add(s);
            }           
        }
   
        public System.IO.Ports.SerialPort cport;

        public void serialport_connect(String port, int baudrate, Parity parity, int databits, StopBits stopbits)
        {
            cport = new System.IO.Ports.SerialPort(
            port, baudrate, parity, databits, stopbits);

            try
            {
                cport.Open();               
                btn_closed.Enabled = true;
                Btn_Connect.Enabled = false;
                txtDisplay.AppendText("Connected!\n");
                txtStatus.Text = "Connected";
                cport.DataReceived += new SerialDataReceivedEventHandler(cport_DataReceived);
            }
            catch (Exception ex) { MessageBox.Show(ex.ToString(), "Error!"); }
        }
        
        //get data
        private void cport_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            totalline = list.Count();
            SerialPort sp = (SerialPort)sender;
            indata = sp.ReadExisting();           
                if (indata == "R")
                { //transfer next line if received letter 'R'
                    countwrong = 0;
                    if (local < totalline-1)
                    {
                        local++;
                        cport.Write(list[local]);
                        txtStatus.Text = "Received Line: " + local;
                        txtDisplay.AppendText("Line: " + local + " done! \n");
                        systemTick = 0;
                    }
                    else
                    {   //if received letter 'Z' transfer complete 
                        cport.Write("Z");
                        txtStatus.Text = "Done!";
                        txtDisplay.AppendText("Download to SRAM memory Successfully!\n");
                        systemTick = 0;
                        this.timer1.Enabled = false;
                    }
                }

                if (indata == "W")
                {
                    //resend line wrong 100 time if not received letter 'R' stop transfer 
                    //and close port com
                    if (countwrong < 100)
                    {
                        countwrong++;
                        cport.Write(list[local]);
                        txtStatus.Text = "Resend Line: " + local + ", time: " + countwrong;
                        txtDisplay.AppendText("Line: " + local + " wrong, resending..\n");
                        systemTick = 0;
                    }
                    else
                    {
                        //notify error and stop transfer data
                        txtDisplay.AppendText("Cann't transfer data! Some line data wrong!\nPlease reconnect!");
                        systemTick = 0;
                        this.timer1.Enabled = false;
                        cport.Close(); //close com port to reconnect
                    }
                }
            }                                   
        private void Btn_Connect_Click(object sender, EventArgs e)
        {
            String port = txtListCom.Text;
            int baudrate = Convert.ToInt32(txtListBaurate.Text);
            //default databit = 8, parity = none, stopbit =1
            serialport_connect(port, baudrate, System.IO.Ports.Parity.None, 8, System.IO.Ports.StopBits.One);
        }

        

        private void Btn_Load_Click(object sender, EventArgs e)
        {
            
            local = 0;
            list.Clear();
            txtDisplay.AppendText("Tranfering data...!\n");
            try
            {
                FileStream fr = new FileStream
                    (txtlinkpath.Text, FileMode.Open, FileAccess.ReadWrite);
                StreamReader sr = new StreamReader(fr);
                while ((line = sr.ReadLine()) != null)
                {
                    list.Add(line);
                }

                cport.Write(list[0]);
                fr.Close();
                sr.Close();
                txtStatus.Text = "Received Line: 0";
                this.timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex);
            }
        }

        private void Btn_Exit_Click(object sender, EventArgs e)
        {
            Application.Exit();            
        }

        private void Btn_Browser_Click(object sender, EventArgs e)
        {
            OpenFileDialog fdlg = new OpenFileDialog(); 
            fdlg.InitialDirectory = @"C:\Keil_v5\ARM\ARMCC\bin";
            fdlg.Title = "Choose Srec File";
            fdlg.Filter = "All files (*.*)|*.*|Srec file|*.srec";
            if (fdlg.ShowDialog() == DialogResult.OK)
            {
                txtlinkpath.Text = fdlg.FileName;
                String length = File.ReadAllText(txtlinkpath.Text);
                if (length.Length / 1024 < 24)
                {
                    txtStatus.Text = "File Size: " + length.Length / 1024 + " KB" + " Available send file!";
                }
                else {
                    txtStatus.Text = "File Size: " + length.Length / 1024 + " KB" + " Cann't send, file size > 24 KB";
                }
                
            }

        }
       
        private void btn_about_Click(object sender, EventArgs e)
        {
            MessageBox.Show("GST050.UIT.KTMT.Group 7\n Design by Duc Phu", "About", MessageBoxButtons.OK, MessageBoxIcon.Information);            
        }

        private void btn_closed_Click(object sender, EventArgs e)
        {
            if (cport.IsOpen)
            {
                cport.Close();
                btn_closed.Enabled = false;
                Btn_Connect.Enabled = true;
                txtStatus.Text = "Disconnected\n";
            }
        }
        
        private void timer1_Tick(object sender, EventArgs e)
        {
            systemTick++;
            if(systemTick>50){ //set time out 5s
                txtDisplay.AppendText("Time out occur! Line: \n" + local +". Please reconnect!\n");
                txtStatus.Text = "Time out!";
                systemTick = 0;
                this.timer1.Enabled = false;
                cport.Close();
                btn_closed.Enabled = false;
                Btn_Connect.Enabled = true;               
            }
        }
    }
}
