import React, { useState, useEffect } from 'react';
import { Form, Button, Card, ListGroup, Modal } from 'react-bootstrap';

const BookClubs = () => {
  const [bookClubs, setBookClubs] = useState([]);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [newBookClubName, setNewBookClubName] = useState('');

  // Fetch existing book clubs from the backend
  useEffect(() => {
    fetch('http://localhost:3000/api/bookclubs')
      .then((response) => response.json())
      .then((data) => setBookClubs(data));
  }, []);

  const handleCreateModalClose = () => {
    setShowCreateModal(false);
    setNewBookClubName('');
  };

  const handleCreateBookClub = () => {
    // Perform create book club logic
    fetch('http://localhost:3000/api/bookclubs', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ name: newBookClubName }),
    })
      .then((response) => response.json())
      .then((data) => {
        // Add the newly created book club to the list
        setBookClubs([...bookClubs, data]);
        handleCreateModalClose();
      });
  };

  return (
    <div className="container">
      <h2>Book Clubs</h2>

      {/* List existing book clubs */}
      <Card>
        <Card.Header>Existing Book Clubs</Card.Header>
        <ListGroup variant="flush">
          {bookClubs.map((bookClub) => (
            <ListGroup.Item key={bookClub.id}>{bookClub.name}</ListGroup.Item>
          ))}
        </ListGroup>
      </Card>

      {/* Create Book Club Modal */}
      <Modal show={showCreateModal} onHide={handleCreateModalClose}>
        <Modal.Header closeButton>
          <Modal.Title>Create Book Club</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group controlId="formBookClubName">
              <Form.Label>Book Club Name</Form.Label>
              <Form.Control
                type="text"
                placeholder="Enter book club name"
                value={newBookClubName}
                onChange={(e) => setNewBookClubName(e.target.value)}
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleCreateModalClose}>
            Cancel
          </Button>
          <Button variant="primary" onClick={handleCreateBookClub}>
            Create
          </Button>
        </Modal.Footer>
      </Modal>

      {/* Button to trigger Create Book Club Modal */}
      <Button variant="primary" onClick={() => setShowCreateModal(true)}>
        Create Book Club
      </Button>
    </div>
  );
};

export default BookClubs;