using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLQuanAn
{
    public partial class UDQL : Form
    {
        public UDQL()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DangNhap A = new DangNhap();
            A.Show();
        }

        private void UDQL_Load(object sender, EventArgs e)
        {
            toolStrip2.Hide();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            DangNhap D = new DangNhap();
            D.Show();
            toolStrip1.Hide();
            toolStrip2.Show();
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            toolStrip2.Hide();
            toolStrip1.Show();
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            ProFile A = new ProFile();
            A.Show();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void toolStripMenuItem4_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Them A = new Them();
            A.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Sua A = new Sua();
            A.Show();
        }

        private void newToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Refresh();
        }
    }
}
