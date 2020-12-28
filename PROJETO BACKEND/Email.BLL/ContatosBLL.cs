using System;
using System.Collections.Generic;
using System.Data;
using Email.DAL;
using Email.DML;

namespace Email.BLL
{
    public class ContatosBLL
    {
         string conStr = "";
        public ContatosBLL(string _conStr)
        {
            conStr = _conStr;
        }

        public void Incluir(Contato contato)
        {
            if (contato.Nome.Trim().Length == 0)
            {
                throw new Exception("O Nome do Contato é Obrigatório");
            }

            if (contato.Email.Trim().Length == 0)
            {
                throw new Exception("O Email do Contato é Obrigatório");
            }

            ContatosDAL obj = new ContatosDAL();
            obj.Incluir(contato, conStr);
        }

        public void Alterar(Contato contato)
        {
            if (contato.Nome.Trim().Length == 0)
            {
                throw new Exception("O Nome do Contato é Obrigatório");
            }

            if (contato.Email.Trim().Length == 0)
            {
                throw new Exception("O Email do Contato é Obrigatório");
            }

            ContatosDAL obj = new ContatosDAL();
            obj.Alterar(contato, conStr);
        }


        public void Excluir(int pId)
        {
            if (pId < 1)
            {
                throw new Exception("Selecione antes de excluir.");
            }

            ContatosDAL obj = new ContatosDAL();
            obj.DELETE(pId, conStr);
        }

        public DataTable CONSULTA()
        {
            ContatosDAL result = new ContatosDAL();
            return result.CONSULTA(conStr);
        }

    }
}
