import { useState } from "react";
import {
  Jumbotron,
  Button,
  Form,
  Col,
  Spinner,
  Alert,
  Modal,
  Table,
} from "react-bootstrap";
import axios from "axios";

function ListaContato() {
  const FIXER_URL = "http://localhost:44385/email/";
  const [contatos, setContatos] = useState([]);
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [idContato, setIdContato] = useState("0");
  const [formValidado, setFormValidado] = useState(false);
  const [exibirSpinner, setExibirSpinner] = useState(false);
  const [exibirMsgErro, setExibirMsgErro] = useState(false);
  const [exibirModal, setExibirModal] = useState(false);

  function handleNome(event) {
    setNome(event.target.value);
  }

  function handleEmail(event) {
    setEmail(event.target.value);
  }

  function handleFecharModal(event) {}

  function salvar(event) {
    let urlAlterar = "Alterar";
    event.preventDefault();
    setFormValidado(true);
    if (event.currentTarget.checkValidity() === true) {
      setExibirSpinner(true);

      const data = { id: idContato, email: email, nome: nome };

      const options = {
        headers: { "Content-Type": "application/json" },
      };

      axios
        .post(`${FIXER_URL}${urlAlterar}`, data, options)
        .then((res) => {
          console.log("RESPONSE RECEIVED: ", res);
        })
        .catch((err) => {
          console.log("AXIOS ERROR: ", err);
        });
    }
  }

  function excluir(contatoItem) {
    setFormValidado(true);
      setExibirSpinner(true);

      const data = { id: contatoItem.id };

      const options = {
        headers: { "Content-Type": "application/json" },
      };

      axios
        .post(`${FIXER_URL}Excluir`, data, options)
        .then((res) => {
          console.log("RESPONSE RECEIVED: ", res);
        })
        .catch((err) => {
          console.log("AXIOS ERROR: ", err);
        });
  }

  function editar(contatoItem) {
    idContato(contatoItem.id);
    nome(contatoItem.nome);
    email(contatoItem.email);
    exibirModal(true);
  }

  function exibirErro() {
    setExibirMsgErro(true);
    setExibirSpinner(true);
  }

  function buscarContatos() {
    axios
      .get(`${FIXER_URL}lista`)
      .then((res) => setContatos(res.data))
      .catch((err) => exibirErro());
  }

  function ContatosParaRenderisar(props) {
    const { contatosList, editar, excluir } = props;

    if (contatosList) {
      if (contatosList.length > 0) {
        return;
        contatosList.map((contatoItem) => (
          <tr>
            <td>{contatoItem.id}</td>
            <td>{contatoItem.nome}</td>
            <td>{contatoItem.email}</td>
            <td>
              <Button variant="success" onClick={() => editar(contatoItem)}>
                Editar
              </Button>
            </td>
            <td>
              <Button variant="danger" onClick={() => excluir(contatoItem)}>
                Excluir
              </Button>
            </td>
          </tr>
        ));
      }
      return <p>Lista de contatos vazia</p>;
    }
    return <p>Não foi possivel renderizar a lista de contatos</p>;
  }

  return (
    <div>
      <Table striped bordered hover size="sm">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>Email</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody contatos={contatos} editar={editar} excluir={excluir}>

        </tbody>
      </Table>
      <Modal show={exibirModal} onHide={handleFecharModal} data-testeid="modal">
        <Modal.Header closeButton>
          <Modal.Title> Editar Contato</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form onSubmit={salvar} noValidate validated={formValidado}>
            <Form.Row>
              <Col sm="5">
                <Form.Control
                  placeholder="IdContato"
                  value={idContato}
                  required
                />
              </Col>
              <Col sm="5">
                <Form.Control
                  placeholder="Nome"
                  value={nome}
                  onChange={handleNome}
                  required
                />
              </Col>
              <Col sm="5">
                <Form.Control
                  placeholder="Email"
                  value={email}
                  onChange={handleEmail}
                  required
                />
              </Col>
              <Col sm="2">
                <Button
                  variant="success"
                  type="submit"
                  data-testid="btn-salvar"
                >
                  <span className={exibirSpinner ? null : "hidden"}>
                    <Spinner animation="border" size="sm" />
                  </span>
                  <span className={exibirSpinner ? "hidden" : null}>
                    Salvar
                  </span>
                </Button>
              </Col>
            </Form.Row>
          </Form>
        </Modal.Body>
        <Modal.Footer></Modal.Footer>
      </Modal>
    </div>
  );
}

export default ListaContato;