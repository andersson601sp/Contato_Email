using System;

namespace Email.DML
{
    public class Contato
    { 

        protected byte _id;
        public byte Id{ get { return _id; } set { _id = value; }}

        private string _nome;
        public string Nome { get { return _nome; } set { _nome = value; } }

        private string _email;
        public string Email { get { return _email; } set { _email = value; } }

    }
}
