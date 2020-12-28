using Email.DML;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Email.DAL
{
    public class ContatosDAL
    {
        public DataTable CONSULTA(string pStrConexao)
        {
            SqlConnection cn = new SqlConnection();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable result = new DataTable();
            try
            {
                cn.ConnectionString = pStrConexao;
                da.SelectCommand = new SqlCommand();

                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.CommandText = "CONSULTA_CONTATO";
                da.SelectCommand.Connection = cn;

                da.Fill(result);
                return result;

            }
            catch (SqlException ex)
            {
                throw new Exception("Servidor SQL Erro:" + ex.Number);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        public void Incluir(Contato pContato, string pStrConexao)
        {
            SqlConnection cn = new SqlConnection();
            try
            {
                cn.ConnectionString = pStrConexao;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "INSERT_CONTATO";

                SqlParameter pnome = new SqlParameter("@NOME", SqlDbType.VarChar, 30);
                pnome.Value = pContato.Nome;
                cmd.Parameters.Add(pnome);

                SqlParameter pemail = new SqlParameter("@EMAIL", SqlDbType.VarChar, 50);
                pemail.Value = pContato.Email;
                cmd.Parameters.Add(pemail);

                cn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                throw new Exception("Servidor SQL Erro:" + ex.Number);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        public void Alterar(Contato pContato, string pStrConexao)
        {
            SqlConnection cn = new SqlConnection();
            try
            {
                cn.ConnectionString = pStrConexao;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "UPDATE_CONTATO";

                SqlParameter pid = new SqlParameter("@ID", SqlDbType.Int);
                pid.Value = pContato.Id;
                cmd.Parameters.Add(pid);

                SqlParameter pnome = new SqlParameter("@NOME", SqlDbType.VarChar, 30);
                pnome.Value = pContato.Nome;
                cmd.Parameters.Add(pnome);

                SqlParameter pemail = new SqlParameter("@EMAIL", SqlDbType.VarChar, 50);
                pemail.Value = pContato.Email;
                cmd.Parameters.Add(pemail);

                cn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                throw new Exception("Servidor SQL Erro:" + ex.Number);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        public void DELETE(int pIdEmail, string pStrConexao)
        {
            SqlConnection cn = new SqlConnection();
            try
            {
                cn.ConnectionString = pStrConexao;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DELETE_CONTATO";

                SqlParameter pid = new SqlParameter("@ID", SqlDbType.Int);
                pid.Value = pIdEmail;
                cmd.Parameters.Add(pid);

                cn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                throw new Exception("Servidor SQL Erro:" + ex.Number);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
    }
}
