using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Examen.CapaLogica;
using Examen.capaModelo;

namespace Examen.Vistas
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();

        }

        public static void MostrarAlerta(Page page, string message)
        {
            string script = $"<script type='text/javascript'>alert('{message}');</script>";
            ClientScriptManager cs = page.ClientScript;
            cs.RegisterStartupScript(page.GetType(), "AlertScript", script);
        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Usuarios"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void Bagregar_Click(object sender, EventArgs e)
        {
            cls_Usuarios.Nombre = Tnombre.Text;
            cls_Usuarios.correoElectronico = TcorreoElectronico.Text;
            cls_Usuarios.Telefono = TTelefono.Text;
            if (Cls_LUsuarios.AgregarUsuarios(cls_Usuarios.Nombre, cls_Usuarios.correoElectronico, cls_Usuarios.Telefono) > 0)
            {
                MostrarAlerta(this, "Usuario ingresado");
                LlenarGrid();
            }
            else
            {
                MostrarAlerta(this, "Error");
            }
        }

        protected void Beliminar_Click(object sender, EventArgs e)
        {
            cls_Usuarios.id = int.Parse(Tcodigo.Text);
            if (Cls_LUsuarios.BorrarUsuarios(cls_Usuarios.id) > 0)
            {
                MostrarAlerta(this, "Usuario borrado");
                LlenarGrid();
            }
            else
            {
                MostrarAlerta(this, "Error");
            }
        }

        protected void BModificar_Click(object sender, EventArgs e)
        {
            cls_Usuarios.Nombre = Tnombre.Text;
            cls_Usuarios.id = int.Parse(Tcodigo.Text);
            cls_Usuarios.correoElectronico = TcorreoElectronico.Text;
            cls_Usuarios.Telefono = TTelefono.Text;

            if (Cls_LUsuarios.ModificarUsuarios(cls_Usuarios.id, cls_Usuarios.Nombre, cls_Usuarios.correoElectronico, cls_Usuarios.Telefono) > 0)
            {
               // MostrarAlerta(this, "Usuario ingresado");

                LlenarGrid();
            }
            else
            {
                MostrarAlerta(this, "Error");
            }

        }
    }
}