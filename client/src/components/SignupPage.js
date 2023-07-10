import React, { useState } from 'react';
import { Form, Button } from 'react-bootstrap';

const SignupPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [passwordConfirmation, setPasswordConfirmation] = useState('');
  const [error, setError] = useState('');

  const handleSignup = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('http://localhost:3000/api/users', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email,
          password,
          password_confirmation: passwordConfirmation,
        }),
      });

      if (response.ok) {
        // Signup successful
        setError('');
        // Redirect or perform any necessary action
      } else {
        const data = await response.json();
        setError(data.errors || 'An error occurred during signup.');
      }
    } catch (error) {
      setError('An error occurred during signup.');
    }
  };

  return (
    <div className="container">
      <h2>Signup</h2>
      <Form onSubmit={handleSignup}>
        <Form.Group controlId="email">
          <Form.Label>Email address</Form.Label>
          <Form.Control
            type="email"
            placeholder="Enter email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </Form.Group>

        <Form.Group controlId="password">
          <Form.Label>Password</Form.Label>
          <Form.Control
            type="password"
            placeholder="Enter password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </Form.Group>

        <Form.Group controlId="passwordConfirmation">
          <Form.Label>Confirm Password</Form.Label>
          <Form.Control
            type="password"
            placeholder="Confirm password"
            value={passwordConfirmation}
            onChange={(e) => setPasswordConfirmation(e.target.value)}
            required
          />
        </Form.Group>

        {error && <div className="text-danger">{error}</div>}

        <Button variant="primary" type="submit">
          Sign Up
        </Button>
      </Form>
    </div>
  );
};

export default SignupPage;